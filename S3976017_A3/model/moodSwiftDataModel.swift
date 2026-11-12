//
//  moodSwiftDataModel.swift
//  S3976017_A3
//
//  Created by Lach on 29/10/2025.
//

import Foundation
import SwiftData


@Model
class Mood: Identifiable {
    var id: UUID
    var name: String
    var descriptor: String
    var date: Date
        
    init(id: UUID = UUID(), name: String, descriptor: String, date: Date = Date()) {
        self.id = id
        self.name = name
        self.descriptor = descriptor
        self.date = date
    }
}

