//
//  ContentView.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import SwiftUI
import SwiftData

struct MainPageView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = MainPageViewModel()
    @State private var showingAddMood = false
    
    @State private var showSaveAlert = false
    @State private var saveSuccess = false

    private var dataManager: MoodDataManager {
        MoodDataManager(modelContext: modelContext)
    }
    
    var body: some View {
        VStack {
            Text("How would you describe your mood")
                .font(.title)

            DatePickerView(viewModel: viewModel.dateVM)
            RatingView(viewModel: viewModel.ratingVM)
            MoodDescriptorColumns(viewModel: viewModel.moodVM)

            AddAndSave(
                viewModel: viewModel,
                onAddDetails: { showingAddMood = true },
                onSave: { saveMood() }
            )
        }
        .padding()
        .sheet(isPresented: $showingAddMood) {
            AddMoodModal(viewModel: viewModel.moodVM)
                .presentationDetents([.medium])
        }
        .alert(isPresented: $showSaveAlert) {
            if saveSuccess {
                return Alert(
                    title: Text("Mood Saved"),
                    message: Text("Your mood entry has been successfully saved."),
                    dismissButton: .default(Text("OK"))
                )
            } else {
                return Alert(
                    title: Text("Save Failed"),
                    message: Text("Something went wrong while saving your mood."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    private func saveMood() {
        guard let moodName = viewModel.moodVM.selectedItem else {
            print("[debug] No mood selected")
            return
        }
        
        let rating = String(viewModel.ratingVM.selected)
        let date = viewModel.dateVM.selectedDate
        
        let success = dataManager.saveMood(name: moodName, descriptor: rating, date: date)
        
        saveSuccess = success
        showSaveAlert = true
    }
}


#Preview {
    MainPageView()
}

