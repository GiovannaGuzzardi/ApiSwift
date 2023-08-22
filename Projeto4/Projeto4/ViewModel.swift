//
//  ViewModel.swift
//  Projeto4
//
//  Created by Student09 on 04/08/23.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var listHero : [SuperheroI] = []
    @Published var choiseHero : SuperheroI = SuperheroI(id: "", name: "")
    @Published var searchText = ""
    
    func fetch () {
        guard let url  = URL( string : "https://www.superheroapi.com/api.php/1607522183072414/search/\(searchText)") else { return }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data , _, error in
            guard let data = data, error == nil else {
                return
            }
        
            do {
                let parsed = try JSONDecoder().decode( SuperheroResponseI.self , from : data)
                
                DispatchQueue.main.async {
                    self?.listHero = parsed.results
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetchId (idHero : String) {
        guard let url  = URL( string : "https://www.superheroapi.com/api.php/1607522183072414/\(idHero)") else { return }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data , _, error in
            guard let data = data, error == nil else {
                return
            }
        
            do {
                let parsed = try JSONDecoder().decode( SuperheroI.self , from : data)
                
                DispatchQueue.main.async {
                    self?.choiseHero = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}


/*
 Tentando descobrir o que estou fazendo
 */
