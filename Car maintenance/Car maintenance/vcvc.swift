//
//  vcvc.swift
//  Car maintenance
//
//  Created by Константин on 20.09.21.
//

import Firebase

struct Task {
    
    // MARK: Internal

    let title: String
    let userId: String
    let ref: DatabaseReference? // Reference к конкретной записи в DB
    var completed: Bool = false
    
    // MARK: Lifecycle

    // для создания объекта локально
    init(title: String, userId: String) {
        self.title = title
        self.userId = userId
        self.ref = nil
    }

    // для создания объекта из сети
    init?(snapshot: DataSnapshot) { // DataSnapshot - снимок иерархии DB просмотр оглавления
        guard let snapshotValue = snapshot.value as? [String: Any],
              let title = snapshotValue[Constants.titleKey] as? String,
              let userId = snapshotValue[Constants.userIdKey] as? String,
              let completed = snapshotValue[Constants.completedKey] as? Bool else { return nil }
        self.title = title
        self.userId = userId
        self.completed = completed
        ref = snapshot.ref
    }

    func convertToDictionary() -> [String: Any] {
        [Constants.titleKey: title, Constants.userIdKey: userId, Constants.completedKey: completed]
    }

    // MARK: Private

    private enum Constants {
        static let titleKey = "title"
        static let userIdKey = "userId"
        static let completedKey = "completed"
    }
}

