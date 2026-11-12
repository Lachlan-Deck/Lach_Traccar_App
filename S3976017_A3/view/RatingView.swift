//
//  RatingView.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import SwiftUI

struct RatingView: View {
    @State var viewModel = RatingViewModel()

    var body: some View {
        HStack(spacing: 16) {
            ForEach(1...viewModel.maxRating, id: \.self) { i in
                Button {
                    viewModel.select(i)
                } label: {
                    Image(systemName: viewModel.symbol(for: i))
                        .foregroundStyle(viewModel.color(for: i))
                        .font(.system(size: 40))
                        .scaleEffect(i == viewModel.selected ? 1.2 : 1.0)
                        .animation(.spring(), value: viewModel.selected)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    RatingView()
}
