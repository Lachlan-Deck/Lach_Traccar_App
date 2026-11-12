//
//  MoodDescriptorColumns.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation

import SwiftUI

struct MoodDescriptorColumns: View {
    @ObservedObject var viewModel: ButtonGridViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(viewModel.items, id: \.self) { item in
                    Button {
                        viewModel.select(item)
                    } label: {
                        Text(item)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(viewModel.selectedItem == item ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(viewModel.selectedItem == item ? .white : .primary)
                            .cornerRadius(8)
                            .animation(.easeInOut, value: viewModel.selectedItem)
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    MoodDescriptorColumns(
        viewModel: ButtonGridViewModel()
    )
}
