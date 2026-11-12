//
//  dayView.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import SwiftUI

struct DatePickerView: View {
    @ObservedObject var viewModel: DatePickerViewModel
    
    var body: some View {
        VStack {
            Text("Select a Date")
                .font(.headline)
            
            DatePicker(
                "Date",
                selection: $viewModel.selectedDate,
                in: viewModel.dateRange,
                displayedComponents: .date
            )
            .datePickerStyle(.compact)
            .padding()
        }
        .padding()
    }
}
#Preview {
    DatePickerView(viewModel: DatePickerViewModel())
}
