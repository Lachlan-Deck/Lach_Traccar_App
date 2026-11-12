//
//  MoodModalView.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import SwiftUI

struct AddMoodModal: View {
    @ObservedObject var viewModel: ButtonGridViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var newMood: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Add a New Mood")) {
                    TextField("Enter new mood", text: $newMood)
                }
            }
            .navigationTitle("New Mood")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        viewModel.addItem(newMood)
                        dismiss()
                    }
                    .disabled(newMood.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    AddMoodModal(viewModel: ButtonGridViewModel())
}
