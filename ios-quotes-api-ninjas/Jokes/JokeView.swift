//
//  JokeView.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//
import UIKit

class JokesView: UIView {
    
    let jokeLabel = UILabel()
    let getAnotherJokeButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        // Setup Joke Label
        jokeLabel.textAlignment = .center
        jokeLabel.numberOfLines = 0
        addSubview(jokeLabel)
        
        // Setup Get Another Joke Button
        getAnotherJokeButton.setTitle("Get another joke", for: .normal)
        addSubview(getAnotherJokeButton)
        
        // Layout
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        getAnotherJokeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            jokeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            jokeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            jokeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            jokeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            getAnotherJokeButton.topAnchor.constraint(equalTo: jokeLabel.bottomAnchor, constant: 20),
            getAnotherJokeButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

