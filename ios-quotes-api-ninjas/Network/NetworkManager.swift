//
//  NetworkManager.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//

import Foundation
class NetworkManager {
    
    private let apiKey = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
    
    // Load data from https://api.api-ninjas.com
    func loadData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
}
