//
//  MoodDescriptorViewModel.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import SwiftUI
import Combine


class ButtonGridViewModel: ObservableObject {
    @Published var items: [String]
    @Published var selectedItem: String? = nil

    init() {
        self.items = [
            "Angry", "Blah", "Content", "Happy",
            "Hopeful", "Stressed", "Super", "Worried"
        ]
    }

    func select(_ item: String) {
        selectedItem = item
        print("[debug] selected:", item)
    }

    func addItem(_ newItem: String) {
        let trimmed = newItem.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        guard !items.contains(trimmed) else { return }
        items.append(trimmed)
        print("[debug] added:", trimmed)
    }
}

