//
//  ContentView.swift
//  Jurassic Park Apex Predators
//
//  Created by Admin on 2023-07-22.
//

import SwiftUI

struct ContentView: View {
    let apController = ApexPredatorController()
    @State var sortAlphabetical = false
    @State var currentFilter = "All"
    var body: some View {
        
        //Filter
        apController.filterBy(type: currentFilter)
        //Sorting
        if sortAlphabetical{
            apController.sortByAlphabetical()
        }else{
            apController.sortByMovieAppearance()
        }
        
        return NavigationView {
            List{
                ForEach(apController.apexPredators){
                    predator in
                    NavigationLink(destination: PredatorDetail(predator:predator)) {
                        // rows of predatpr
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        withAnimation {
                            sortAlphabetical.toggle()
                        }
                    }label:{
                        if sortAlphabetical{
                            Image(systemName: "film")
                        }else{
                            Image(systemName: "textformat")
                        }
                    }.padding(10)
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu{
                        Picker("Filter",selection:$currentFilter.animation()){
                            ForEach(apController.typeFilters,id:\.self){
                                type in
                                HStack{
                                    Text(type)
                                    Spacer()
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                                
                            }
                        }
                    }label:{
                        Image(systemName:"slider.horizontal.3")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
