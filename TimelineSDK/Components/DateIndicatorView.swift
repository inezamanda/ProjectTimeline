//
//  DateIndicatorView.swift
//  ProjectTimeline
//
//  Created by Inez on 13/11/24.
//

import SwiftUI

public struct DateIndicatorView: View {
    let selectedDate: Date
    let timelineStartDate: Date
    let timelineEndDate: Date
    let indicatorColor: Color
    
    public init(selectedDate: Date, timelineStartDate: Date, timelineEndDate: Date, indicatorColor: Color = Color.red) {
        self.selectedDate = selectedDate
        self.timelineStartDate = timelineStartDate
        self.timelineEndDate = timelineEndDate
        self.indicatorColor = indicatorColor
    }
    
    public var body: some View {
        GeometryReader { geometry in
            // Total number of days in the timeline
            let totalDays = Calendar.current.dateComponents([.day], from: timelineStartDate, to: timelineEndDate).day! + 1
            
            // Width for one day
            let dayWidth: CGFloat = geometry.size.width / CGFloat(totalDays)
            
            // Calculate the day index for the selected date
            let selectedDayIndex = Calendar.current.dateComponents([.day], from: timelineStartDate, to: selectedDate).day!
            
            // Calculate the time proportion within the current day
            let currentHour = Calendar.current.component(.hour, from: selectedDate)
            let currentMinute = Calendar.current.component(.minute, from: selectedDate)
            let timeProportion = CGFloat(currentHour * 60 + currentMinute) / CGFloat(24 * 60)
            
            // Add the time offset to the position
            let timeOffset = timeProportion * dayWidth
            
            Rectangle()
                .fill(indicatorColor)
                .frame(width: 2)
                .offset(x: CGFloat(selectedDayIndex) * dayWidth + timeOffset)
        }
    }
}
