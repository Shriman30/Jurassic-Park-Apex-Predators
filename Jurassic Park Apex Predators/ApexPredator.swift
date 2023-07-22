//
//  ApexPredator.swift
//  Jurassic Park Apex Predators
//
//  Created by Admin on 2023-07-22.
//

import Foundation
import SwiftUI

struct ApexPredetaor: Codable, Identifiable{
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlay()->Color{
        switch type{
        case "land":
            return .brown
        case "air":
            return .teal
        case "sea":
            return .blue
        default:
            return .white
        }
    }
}

struct MovieScene: Codable, Identifiable{
    let id: Int
    let movie: String
    let sceneDescription:String
}
