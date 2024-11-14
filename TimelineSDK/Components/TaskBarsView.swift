//
//  TaskBarsView.swift
//  ProjectTimeline
//
//  Created by Inez on 14/11/24.
//

import SwiftUI

public struct TaskBarsView<ProjectTask: TimelineTask>: View {
    let tasks: [ProjectTask]
    let startDate: Date
    let endDate: Date
    
    public init(tasks: [ProjectTask], startDate: Date, endDate: Date) {
        self.tasks = tasks
        self.startDate = startDate
        self.endDate = endDate
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            let taskRows = Array(calculateTaskRows().enumerated())
            ForEach(taskRows, id: \.offset) { rowIndex, row in
                ZStack(alignment: .leading) {
                    ForEach(row) { task in
                        TaskBarView(task: task, timelineStartDate: startDate, row: rowIndex)
                    }
                }
            }
        }
    }
    
    // Calculate task rows to avoid overlaps
    private func calculateTaskRows() -> [[ProjectTask]] {
        var rows: [[ProjectTask]] = []
        
        // Sort tasks by start date, then by shorter duration
        let sortedTasks = tasks.sorted { (task1: ProjectTask, task2: ProjectTask) -> Bool in
            if task1.startDate == task2.startDate {
                return task1.duration < task2.duration
            }
            return task1.startDate < task2.startDate
        }
        
        for task in sortedTasks {
            var placed = false
            for rowIndex in rows.indices {
                if canPlaceTask(task, in: rows[rowIndex]) {
                    rows[rowIndex].append(task)
                    placed = true
                    break
                }
            }
            if !placed {
                rows.append([task])
            }
        }
        
        return rows
    }
    
    // Check if a task can be placed in a given row without overlapping
    private func canPlaceTask(_ task: ProjectTask, in row: [ProjectTask]) -> Bool {
        for existingTask in row {
            if task.startDate <= existingTask.endDate && task.endDate >= existingTask.startDate {
                return false
            }
        }
        return true
    }
}
