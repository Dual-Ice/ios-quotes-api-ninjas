//
//  ChuckNorrisManager.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//

import Foundation

class ChuckNorrisManager: NetworkManager {
    
    private let baseURL = "https://api.api-ninjas.com/v1/chucknorris"
    func getRandomJoke(completion: @escaping (Joke?) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        
        loadData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let quote = try? JSONDecoder().decode(Joke.self, from: data)
            completion(quote)
        }
    }
}
