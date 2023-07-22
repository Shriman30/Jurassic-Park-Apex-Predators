//
//  ApexPredatorController.swift
//  Jurassic Park Apex Predators
//
//  Created by Admin on 2023-07-22.
//

import Foundation

class ApexPredatorController{
    private var allApexPredators: [ApexPredetaor] = []
    var apexPredators: [ApexPredetaor] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]
    
    init(){
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do{
                let data = try Data(contentsOf:url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // convert from snake case since JSON has snake case
                
                allApexPredators = try decoder.decode([ApexPredetaor].self, from: data)
                apexPredators = allApexPredators
                
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func typeIcon(for type: String)->String{
        switch(type){
        case "All":
            return "square.stack.3d.up.fill"
        case "Land":
            return "leaf.fill"
        case "Air":
            return "wind"
        case "Sea":
            return "drop.fill"
        default:
            return "questionmark"
        }
    }
    
    func filterBy(type:String){
        switch type{
        case "Land","Air","Sea":
            apexPredators = allApexPredators.filter{
                $0.type == type.lowercased()
            }
        default:
            apexPredators = allApexPredators
        }
    }
    
    func sortByAlphabetical(){
        apexPredators.sort(by: {$0.name < $1.name}) // sort from a...z
    }
    
    func sortByMovieAppearance(){
        apexPredators.sort(by:{$0.id < $1.id})
    }
}
