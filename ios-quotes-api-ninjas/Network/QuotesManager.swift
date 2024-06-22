//
//  QuotesManager.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let category: String
}

class QuotesManager: NetworkManager {
    private let baseURL = "https://api.api-ninjas.com/v1/quotes"
    
    func getRandomQuote(completion: @escaping (Quote?) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        loadData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let quote = try? JSONDecoder().decode([Quote].self, from: data).first
            completion(quote)
        }
    }
    
    func getQuotesByCategory(_ category: String, completion: @escaping ([Quote]?) -> Void) {
        let urlString = baseURL + "?category=" + category.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: urlString) else { return }
        loadData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let quotes = try? JSONDecoder().decode([Quote].self, from: data)
            completion(quotes)
        }
    }
    
    func getCategories() -> [String] {
        return ["random", "age", "alone", "amazing", "anger", "architecture", "art", "attitude", "beauty", "best", "birthday", "business", "car", "change", "communication", "computers", "cool", "courage", "dad", "dating", "death", "design", "dreams", "education", "environmental", "equality", "experience", "failure", "faith", "family", "famous", "fear", "fitness", "food", "forgiveness", "freedom", "friendship", "funny", "future", "god", "good", "government", "graduation", "great", "happiness", "health", "history", "home", "hope", "humor", "imagination", "inspirational", "intelligence", "jealousy", "knowledge", "leadership", "learning", "legal", "life", "love", "marriage", "medical", "men", "mom", "money", "morning", "movies", "success"]
    }
}

