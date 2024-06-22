//
//  ChuckNorrisViewController.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//

import UIKit

class ChuckNorrisViewController: UIViewController {
    
    let chuckNorrisManager = ChuckNorrisManager()
    var chuckNorrisView: ChuckNorrisView!
    
    override func loadView() {
        chuckNorrisView = ChuckNorrisView()
        view = chuckNorrisView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Chuck Norris"
        chuckNorrisView.getAnotherJokeButton.addTarget(self, action: #selector(getAnotherJoke), for: .touchUpInside)
        loadJoke()
    }
    
    @objc private func getAnotherJoke() {
        loadJoke()
    }
    
    private func loadJoke() {
        chuckNorrisManager.getRandomJoke { [weak self] joke in
            guard let self = self, let joke = joke else {
                DispatchQueue.main.async {
                    self?.chuckNorrisView.jokeLabel.text = "Failed to load Chuck Norris joke."
                }
                return
            }
            
            DispatchQueue.main.async {
                self.chuckNorrisView.jokeLabel.text = joke.joke
            }
        }
    }
}

