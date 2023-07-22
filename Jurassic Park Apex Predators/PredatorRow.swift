//
//  PredatorRow.swift
//  Jurassic Park Apex Predators
//
//  Created by Admin on 2023-07-22.
//

import SwiftUI

struct PredatorRow: View {
    let predator: ApexPredetaor
    var body: some View {
        HStack{
            // Predator Image
            // convert the name to lowercase, check every character for empty space and remove empty space
            Image(predator.name.lowercased().filter {$0 != " "})
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: 1, x:0, y:0)
            VStack(alignment: .leading){
                // Predator species text
                Text(predator.name)
                    .fontWeight(.bold)
                // Predator type
                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal,13)
                    .padding(.vertical,6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(predator.typeOverlay().opacity(0.33))
                    )
            }
        }
    }
}

struct PredatorRow_Previews: PreviewProvider {
    static var previews: some View {
        // since each predator has a movie scene...
        let movieScene = MovieScene(id: 3, movie: "Jurassic Park III", sceneDescription: "A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.")
        
        // since we need a predator instance...
        let predator = ApexPredetaor(id: 3, name: "Tyrannosaurus Rex", type: "land", movies: [
            "Jurassic Park",
            "The Lost World: Jurassic Park",
            "Jurassic Park III",
            "Jurassic World",
            "Jurassic World: Fallen Kingdom"],movieScenes: [movieScene], link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
        
        PredatorRow(predator:predator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
