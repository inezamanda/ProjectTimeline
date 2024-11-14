//
//  TimelineTask.swift
//  ProjectTimeline
//
//  Created by Inez on 14/11/24.
//

import Foundation
import SwiftUI

public protocol TimelineTask: Identifiable {
    var id: UUID { get }
    var name: String { get }
    var startDate: Date { get }
    var endDate: Date { get }
    var color: Color { get }
}

public extension TimelineTask {
    var id: UUID {
        return UUID() // Default implementation if the user doesn't provide one
    }
    var duration: Int {
        Calendar.current.dateComponents([.day], from: startDate, to: endDate).day! + 1
    }
}

public extension Date {
    var normalized: Date {
        Calendar.current.startOfDay(for: self) // Returns the date with the time set to 00:00:00
    }
}
