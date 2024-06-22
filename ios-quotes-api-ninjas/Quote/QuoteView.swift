//
//  QuoteView.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//

import UIKit

class QuoteView: UIView {
    
    let quoteLabel = UILabel()
    let authorLabel = UILabel()
    let getAnotherQuoteButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        // Setup Quote Label
        quoteLabel.textAlignment = .center
        quoteLabel.numberOfLines = 0
        addSubview(quoteLabel)
        
        // Setup Author Label
        authorLabel.textAlignment = .center
        authorLabel.textColor = .gray
        addSubview(authorLabel)
        
        // Setup Get Another Quote Button
        getAnotherQuoteButton.setTitle("Get another quote", for: .normal)
        addSubview(getAnotherQuoteButton)
        
        // Layout
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        getAnotherQuoteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 20),
            authorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            getAnotherQuoteButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            getAnotherQuoteButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

