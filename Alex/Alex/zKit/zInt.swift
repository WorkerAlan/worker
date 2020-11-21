//
//  zInt.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import Foundation

extension Int {
    var seconds: TimeInterval { return TimeInterval(self) }
    var minutes: TimeInterval { return seconds * 60 }
    var hours: TimeInterval { return minutes * 60 }
    var days: TimeInterval { return hours * 24 }
    var years: TimeInterval { return days * 365 }
    var second: TimeInterval { seconds }
    var minute: TimeInterval { minutes }
    var hour: TimeInterval { hours }
    var day: TimeInterval { days }
    var year: TimeInterval { years }
}
