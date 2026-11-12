//
//  DatePickerViewModel.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import Combine
import SwiftUI

class DatePickerViewModel: ObservableObject {
    @Published var selectedDate: Date
    
    let dateRange: ClosedRange<Date>
    
    init() {
        let today = Date()
        self.selectedDate = today
        // Allow selection from distant past up to today
        self.dateRange = Date.distantPast...today
    }
}
