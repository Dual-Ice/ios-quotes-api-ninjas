//
//  QuotesViewController.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//
import UIKit

class QuotesViewController: UIViewController {
    
    var category: String?
    let quotesManager = QuotesManager()
    
    let quoteView = QuoteView()
    
    init(category: String?) {
        if category == "random" {
            self.category = nil
        } else {
            self.category = category
        }
        super.init(nibName: nil, bundle: nil)
        if category == nil {
            navigationItem.title = "Random Quote"
        } else {
            navigationItem.title = category?.capitalized
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = quoteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteView.getAnotherQuoteButton.addTarget(self, action: #selector(getAnotherQuote), for: .touchUpInside)
        loadQuote()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    @objc func getAnotherQuote() {
        loadQuote()
    }
    
    func loadQuote() {
        if let category = category {
            quotesManager.getQuotesByCategory(category) { quotes in
                if let quote = quotes?.first {
                    DispatchQueue.main.async {
                        self.updateUI(with: quote)
                    }
                }
            }
        } else {
            quotesManager.getRandomQuote { quote in
                if let quote = quote {
                    DispatchQueue.main.async {
                        self.updateUI(with: quote)
                    }
                }
            }
        }
    }
    
    func updateUI(with quote: Quote) {
        quoteView.quoteLabel.text = quote.quote
        quoteView.authorLabel.text = "- \(quote.author)"
    }
}

