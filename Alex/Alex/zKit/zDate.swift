//
//  zDate.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import Foundation

let zCalendar = _zCanendar()

private func _zCanendar() -> Calendar {
    var c = Calendar(identifier: Calendar.current.identifier)
    c.locale = Locale.current
    return c
}

extension Date {
    var era: Int { return zCalendar.component(.era, from: self) }
    var year: Int { return zCalendar.component(.year, from: self) }
    var month: Int { return zCalendar.component(.month, from: self) }
    var day: Int { return zCalendar.component(.day, from: self) }
    var hour: Int { return zCalendar.component(.hour, from: self) }
    var minute: Int { return zCalendar.component(.minute, from: self) }
    var second: Int { return zCalendar.component(.second, from: self) }
    var weekday: Int { return zCalendar.component(.weekday, from: self) }
    var weekdayOrdinal: Int { return zCalendar.component(.weekdayOrdinal, from: self) }
    var quarter: Int { return zCalendar.component(.quarter, from: self) }
    var weekOfMonth: Int { return zCalendar.component(.weekOfMonth, from: self) }
    var weekOfYear: Int { return zCalendar.component(.weekOfYear, from: self) }
    var yearForWeekOfYear: Int { return zCalendar.component(.yearForWeekOfYear, from: self) }
    var nanosecond: Int { return zCalendar.component(.nanosecond, from: self) }
    var calendar: Int { return zCalendar.component(.calendar, from: self) }
    var timeZone: Int { return zCalendar.component(.timeZone, from: self) }
}
