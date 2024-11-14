//
//  TaskBarView.swift
//  ProjectTimeline
//
//  Created by Inez on 13/11/24.
//

import SwiftUI

public struct TaskBarView<ProjectTask: TimelineTask>: View {
    let task: ProjectTask
    let timelineStartDate: Date
    let row: Int
    
    public init(task: ProjectTask, timelineStartDate: Date, row: Int) {
        self.task = task
        self.timelineStartDate = timelineStartDate
        self.row = row
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(task.color)
                .frame(width: barWidth(), height: 40)
            
            Text(task.name)
                .foregroundColor(.white)
                .font(.caption)
                .padding(.horizontal, 5)
        }
        .offset(x: barOffset(for: task))
    }
    
    // Calculate the bar width based on task duration
    private func barWidth() -> CGFloat {
        let taskDays = Calendar.current.dateComponents([.day], from: task.startDate, to: task.endDate).day! + 1
        let dayWidth: CGFloat = 50
        return CGFloat(taskDays) * dayWidth
    }
    
    // Calculate the horizontal offset based on task's start date
    private func barOffset(for task: ProjectTask) -> CGFloat {
        let dayWidth: CGFloat = 50
        let daysFromStart = Calendar.current.dateComponents([.day], from: timelineStartDate, to: task.startDate).day!
        return CGFloat(daysFromStart) * dayWidth
    }
}
