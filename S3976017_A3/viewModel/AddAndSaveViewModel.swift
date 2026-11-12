//
//  AddAndSaveViewModel.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class AddAndSaveViewModel: ObservableObject {
    @Published var isComplete: Bool = false
    
    var onAdd: (() -> Void)?
    var onSave: (() -> Void)?
    
    func addDetails() {
        onAdd?()
    }
    
    func save() {
        guard isComplete else {
            print("[debug] Save disabled")
            return
        }
        onSave?()
        print("[debug] Save tapped and processed")
    }
}
