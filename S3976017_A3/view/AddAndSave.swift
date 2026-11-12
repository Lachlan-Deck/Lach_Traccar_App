//
//  AddAndSave.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//


import SwiftUI



struct AddAndSave: View {
    var viewModel: MainPageViewModel
    var onAddDetails: () -> Void
    var onSave: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            Button("Add details") {
                onAddDetails()
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)

            Button("Save to go") {
                onSave()
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
//            .disabled(!viewModel.isComplete)
//            .opacity(viewModel.isComplete ? 1 : 0.5)
        }
        .padding()
    }
}

#Preview {
    AddAndSave(
        viewModel: MainPageViewModel(),
        onAddDetails: {},
        onSave: {}
    )
}


