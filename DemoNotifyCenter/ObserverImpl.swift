//
//  ObserverImpl.swift
//  DemoNotifyCenter
//
//  Created by Sergey Matveev on 10.05.2023.
//

import Foundation

class ObserverImpl<I>: Observer {
    typealias T = I
    
    func onNotification(event: T) {
        print("Notification recieved \(event)")
    }

    static func == (lhs: ObserverImpl, rhs: ObserverImpl) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    func hash(into hasher: inout Hasher) {
    }
}
