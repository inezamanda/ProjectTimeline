//
//  TimelineView.swift
//  ProjectTimeline
//
//  Created by Inez on 13/11/24.
//

import SwiftUI

public struct TimelineView<ProjectTask: TimelineTask>: View {
    @State private var selectedDate = Date()
    @State private var hasScrolledToFocus = false
    let tasks: [ProjectTask]
    let startDate: Date
    let endDate: Date
    var focusDate = Date().normalized
    
    // Customizable colors
    private var title: String = "Task Timeline"
    private var gridLineColor: Color = Color.gray.opacity(0.1)
    private var dateLabelColor: Color = Color.primary
    private var indicatorColor: Color = Color.red
    
    public init(tasks: [ProjectTask], startDate: Date, endDate: Date, focusDate: Date = Date()) {
        self.tasks = tasks
        self.startDate = startDate
        self.endDate = endDate
        self.focusDate = focusDate
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
            }
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HorizontalDateLabelsView(startDate: startDate, endDate: endDate, textColor: dateLabelColor)
                    ZStack(alignment: .topLeading) {
                        HorizontalGridLinesView(startDate: startDate, endDate: endDate, gridLineColor: gridLineColor)
                        TaskBarsView(tasks: tasks, startDate: startDate, endDate: endDate)
                            .padding(.top, 20)
                        DateIndicatorView(
                            selectedDate: selectedDate,
                            timelineStartDate: startDate,
                            timelineEndDate: endDate,
                            indicatorColor: indicatorColor
                        )
                    }
                    
                }
                .onAppear {
                    Task {
                        try? await Task.sleep(nanoseconds: 200_000_000)
                        proxy.scrollTo(focusDate.normalized, anchor: .center)
                    }
                }
            }
        }
        .padding()
    }
    
    // Modifier for setting the title
    public func setTitle(_ title: String) -> TimelineView {
        var copy = self
        copy.title = title
        return copy
    }
    
    // Modifier for horizontal grid line style
    public func horizontalGridLine(gridLineColor: Color) -> TimelineView {
        var copy = self
        copy.gridLineColor = gridLineColor
        return copy
    }
    
    // Modifier for horizontal date label style
    public func horizontalDateLabels(textColor: Color) -> TimelineView {
        var copy = self
        copy.dateLabelColor = textColor
        return copy
    }
    
    // Modifier for date indicator style
    public func dateIndicatorLine(indicatorColor: Color) -> TimelineView {
        var copy = self
        copy.indicatorColor = indicatorColor
        return copy
    }
}
