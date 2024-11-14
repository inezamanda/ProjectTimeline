//
//  ContentView.swift
//  ProjectTimeline
//
//  Created by Inez on 13/11/24.
//

import SwiftUI
import TimelineSDK


let tasks: [TaskModel] = [
    TaskModel(
        name: "Another Task",
        startDate: Calendar.current.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2024, month: 11, day: 15))!,
        endDate: Calendar.current.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2024, month: 11, day: 24))!,
        color: Color.blue
    ),
    TaskModel(
        name: "Interview",
        startDate: Calendar.current.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2024, month: 11, day: 1))!,
        endDate: Calendar.current.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2024, month: 11, day: 6))!,
        color: Color.red
    ),
    TaskModel(
        name: "Update",
        startDate: Calendar.current.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2024, month: 11, day: 14))!,
        endDate: Calendar.current.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2024, month: 11, day: 19))!,
        color: Color.green
    ),
    TaskModel(
        name: "Wireframe",
        startDate: Calendar.current.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2024, month: 11, day: 2))!,
        endDate: Calendar.current.date(from: DateComponents(
            timeZone: TimeZone(secondsFromGMT: 0),
            year: 2024, month: 11, day: 4))!,
        color: Color.blue
    ),
]

struct ContentView: View {
    let startDate = Calendar.current.date(from: DateComponents(timeZone: TimeZone(secondsFromGMT: 0), year: 2024, month: 11, day: 1))!
    let endDate = Calendar.current.date(from: DateComponents(timeZone: TimeZone(secondsFromGMT: 0), year: 2024, month: 11, day: 30))!
    
    var body: some View {
            VStack {
                // Header
                Text("Project Overview")
                    .font(.largeTitle)
                    .padding()

                // Timeline View
                TimelineView(
                    tasks: tasks,
                    startDate: startDate,
                    endDate: endDate
                )
                .setTitle("Project Timeline")
                .horizontalGridLine(gridLineColor: Color.blue.opacity(0.3))
                .horizontalDateLabels(textColor: Color.black)
                .dateIndicatorLine(indicatorColor: Color.green)

                // Footer
                VStack {
                    Text("Other Project Details")
                        .font(.title2)
                        .padding(.top, 20)
                    Text("This is where additional content goes, like project statistics or metadata.")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .background(Color.gray.opacity(0.2))
            }
            .padding()
        }
}

#Preview {
    ContentView()
}
