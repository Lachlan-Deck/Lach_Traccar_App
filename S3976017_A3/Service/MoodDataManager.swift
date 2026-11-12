//
//  MoodDataManager.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import SwiftData

@MainActor
class MoodDataManager {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    /// Saves a mood to SwiftData.
    /// - Returns: `true` if successful, `false` otherwise.
    @discardableResult
    func saveMood(name: String, descriptor: String, date: Date) -> Bool {
        let newMood = Mood(name: name, descriptor: descriptor, date: date)
        modelContext.insert(newMood)
        
        do {
            try modelContext.save()
            print("[debug] Mood saved:", newMood)
            return true
        } catch {
            print("[error] Failed to save mood:", error)
            return false
        }
    }
}

