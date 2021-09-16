//
//  SignInVC.swift
//  Car maintenance
//
//  Created by Константин on 12.09.21.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    var ref: DatabaseReference!


    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference(withPath: "users")

        // MARK: - !!! нужно если у нас еще есть действующий user то сделаем переход
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let _ = user else { return }
            self?.performSegue(withIdentifier: Constants.Segues.tasks, sender: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        emailTF.text = ""
        passwordTF.text = ""
        errorLbl.alpha = 0
    }

    @IBAction func singInTapped(_ sender: Any) {
        guard
            let email = emailTF.text,
            let password = passwordTF.text,
            email != "",
            password != "" else {
            displayWarningLabel(warning: "info error, try agane")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if let _ = error {
                self?.displayWarningLabel(warning: "Error ocured")
            } else  if let _ = user {
                self?.performSegue(withIdentifier: Constants.Segues.tasks, sender: nil)
                return
            } else {
                self?.displayWarningLabel(warning: "such user doesn't exist")
            }
        }
        
    }

    @IBAction func registerTapped(_ sender: Any) {
        guard
            let email = emailTF.text,
            let password = passwordTF.text,
            email != "",
            password != "" else {
            displayWarningLabel(warning: "Info is incorrect")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
            if let error = error {
                self?.displayWarningLabel(warning: "Registration was incorrect\n\(error.localizedDescription)")
            } else {
                guard let user = user else { return }
                let userRef = self?.ref.child(user.user.uid)
                userRef?.setValue(["email": user.user.email])
            }
        }
    }


    // MARK: - придумать что то свое

    private func displayWarningLabel (warning text: String) {
        errorLbl.text = text
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in self?.errorLbl.alpha = 1 }) { [weak self] _ in
            self?.errorLbl.alpha = 0
        }
    }
    
}
