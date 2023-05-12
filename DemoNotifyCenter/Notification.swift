//
//  Notification.swift
//  DemoNotifyCenter
//
//  Created by Sergey Matveev on 12.05.2023.
//

import Foundation

enum Notifications<P: Hashable>: Hashable {

    case article(payload: P? = nil)
    case userMessage(payload: P? = nil)
    case misc

    static func == (lhs: Notifications<P>, rhs: Notifications<P>) -> Bool {
        switch (lhs, rhs) {
        case (.article, .article):
            return true
        case (.userMessage, .userMessage):
            return true
        case (.misc, .misc):
            return true
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
    }
}

typealias UserNotification = Notifications<[AnyHashable: AnyHashable]>
