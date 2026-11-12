//
//  RatingViewModel.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import SwiftUI

@Observable
class RatingViewModel {
    var selected: Int = 0
    let maxRating = 5

    func select(_ rating: Int) {
        selected = rating
    }

    func color(for rating: Int) -> Color {
        rating == selected ? .blue : .gray
    }

    func symbol(for rating: Int) -> String {
        rating == selected ? "\(rating).circle.fill" : "\(rating).circle"
    }
}
