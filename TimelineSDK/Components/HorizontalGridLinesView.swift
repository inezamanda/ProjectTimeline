//
//  HorizontalGridLinesView.swift
//  ProjectTimeline
//
//  Created by Inez on 14/11/24.
//

import SwiftUI

public struct HorizontalGridLinesView: View {
    let startDate: Date
    let endDate: Date
    let gridLineColor: Color
    
    public init(startDate: Date, endDate: Date, gridLineColor: Color = Color.gray.opacity(0.1)) {
        self.startDate = startDate
        self.endDate = endDate
        self.gridLineColor = gridLineColor
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(datesBetween(start: startDate, end: endDate), id: \.self) { _ in
                Rectangle()
                    .fill(gridLineColor)
                    .frame(width: 1)
                    .frame(maxHeight: .infinity)
                    .frame(width: 50, alignment: .leading)
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
}
