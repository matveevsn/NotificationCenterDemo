//
//  NotificationCenter.swift
//  DemoNotifyCenter
//
//  Created by Sergey Matveev on 24.04.2023.
//

import Foundation

protocol Observer<T>: Hashable {
    associatedtype T
    func onNotification(event: T)
}

class NotificationCenter<T: Hashable, O: Observer<T>> {

    private var eventToObservers = [T: Set<O>]()

    func registerObserver(event: T, observer: O) {
        print("registerObserver event \(event)")
        if var observers = eventToObservers[event] {
            observers.insert(observer)
            eventToObservers[event] = observers
        } else {
            eventToObservers[event] = [observer]
        }
        print("Observers after add \(eventToObservers)")
    }

    func removeObserver(event: T, observer: O) {
        if let observers = eventToObservers[event] {
            let filteredObservers = observers.filter { $0 != observer }
            eventToObservers[event] = filteredObservers
        }
    }

    func postNotification(event: T) {
        print("postNotification \(event)")
        if let observers = eventToObservers[event] {
            observers.forEach { observer in
                observer.onNotification(event: event)
            }
        }
    }
}
