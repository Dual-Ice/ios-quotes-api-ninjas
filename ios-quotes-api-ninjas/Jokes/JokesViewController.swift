//
//  JokesViewController.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//

import UIKit

class JokesViewController: UIViewController {
    
    let jokesManager = JokesManager()
    var jokesView: JokesView!
    
    override func loadView() {
        jokesView = JokesView()
        view = jokesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Jokes"
        jokesView.getAnotherJokeButton.addTarget(self, action: #selector(getAnotherJoke), for: .touchUpInside)
        loadJoke()
    }
    
    @objc private func getAnotherJoke() {
        loadJoke()
    }
    
    private func loadJoke() {
        jokesManager.getRandomJoke { [weak self] joke in
            guard let self = self, let joke = joke else {
                DispatchQueue.main.async {
                    self?.jokesView.jokeLabel.text = "Failed to load joke."
                }
                return
            }
            
            DispatchQueue.main.async {
                self.jokesView.jokeLabel.text = joke.joke
            }
        }
    }
}
