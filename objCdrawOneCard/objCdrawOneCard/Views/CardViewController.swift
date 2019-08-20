//
//  CardViewController.swift
//  objCdrawOneCard
//
//  Created by Ian Hall on 8/20/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func updateView(){
        IMHCardController.drawANewCard(5) { (cards) in
            guard let cards = cards else {return}
            let card = cards[0]
            DispatchQueue.main.async {
                self.label.text = card.suit
            }
            IMHCardController.fetchImage(card, completed: { (image) in
                DispatchQueue.main.async {
                    self.cardImage.image = image
                }
            })
        }
    }
    @IBAction func newCardButtonPressed(_ sender: Any) {
    updateView()
    }
}
