//
//  Debouncer.swift
//  Weather-iOS
//
//  Created by Thant Zin on 2025/10/24.
//

import Foundation

class Debouncer {
    private var timer: Timer?
    private let interval: TimeInterval

    init(interval: TimeInterval) {
        self.interval = interval
    }

    func run(action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
            action()
        }
    }
}
