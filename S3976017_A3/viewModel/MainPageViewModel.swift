//
//  MainPageViewModel.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import SwiftUI
import Combine


@MainActor
@Observable
class MainPageViewModel {
    var ratingVM = RatingViewModel()
    var moodVM = ButtonGridViewModel()
    var dateVM = DatePickerViewModel()

    var isComplete: Bool {
        ratingVM.selected > 0 &&
        moodVM.selectedItem != nil &&
        dateVM.selectedDate <= Date()
    }
}

