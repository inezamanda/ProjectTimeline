//
//  TaskModel.swift
//  ProjectTimeline
//
//  Created by Inez on 14/11/24.
//

import Foundation
import SwiftUI
import TimelineSDK

struct TaskModel: TimelineTask {
    let id = UUID()
    let name: String
    let startDate: Date
    let endDate: Date
    let color: Color
}

extension TaskModel {
    var duration: Int {
        Calendar.current.dateComponents([.day], from: startDate, to: endDate).day! + 1
    }
}
