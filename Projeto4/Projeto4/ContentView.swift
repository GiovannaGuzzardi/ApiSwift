//
//  ContentView.swift
//  Projeto4
//
//  Created by Student09 on 04/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var objViewModel = ViewModel()
    func SearchHero() {
        objViewModel.fetch()
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15.5)
                            .stroke(.white, lineWidth: 1)
                            .frame(height: 35, alignment: .center)
                        HStack{
                            ScrollView(.horizontal){
                                TextField("Procure um super aqui", text: $objViewModel.searchText).foregroundColor(.white)
                            }
                            Button(action: {SearchHero()} ) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white)
                            }
                            .frame(width: .infinity)
                        }.padding()
                    }
                    .frame(width: .infinity)
                    if(objViewModel.listHero.count == 0 ){
                        Text("Procure um heroi")
                    } else {
                        ForEach(objViewModel.listHero, id: \.id){
                            cartas in
                            Button(action: {objViewModel.fetchId(idHero: cartas.id)} ) {
                                Text("A : \(cartas.name)")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    Text(objViewModel.choiseHero.id)
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .background(
                .linearGradient(
                    Gradient (colors: [.red, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
        }
        .ignoresSafeArea()
        .onAppear(){
            objViewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
