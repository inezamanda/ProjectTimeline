//
//  HorizontalDateLabelsView.swift
//  ProjectTimeline
//
//  Created by Inez on 14/11/24.
//

import SwiftUI

public struct HorizontalDateLabelsView: View {
    let startDate: Date
    let endDate: Date
    let textColor: Color
    
    public init(startDate: Date, endDate: Date, textColor: Color = Color.primary) {
        self.startDate = startDate
        self.endDate = endDate
        self.textColor = textColor
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(datesBetween(start: startDate, end: endDate), id: \.self) { date in
                VStack {
                    Text(formatDate(date))
                        .font(.caption)
                        .foregroundColor(textColor)
                        .frame(width: 50, alignment: .leading)
                        .id(date.normalized)
                }
                .frame(width: 50)
            }
        }
    }
    
    private func datesBetween(start: Date, end: Date) -> [Date] {
        var dates: [Date] = []
        var currentDate = start
        while currentDate <= end {
            dates.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }
        return dates
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}
