//
//  CardCollectionViewCell.swift
//  flipC
//
//  Created by Abrish Sabri on 01.05.20.
//  Copyright © 2020 Abrish Sabri. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!

    @IBOutlet weak var backImageView: UIImageView!

    var card:Card?

    func configureCell(card:Card) {

        // Keep track of card represented by this cell
        self.card = card

        // Set the front image view to the image that represents the card
        frontImageView.image = UIImage(named: card.imageName)

        // Reset the state of the card
        if card.isFlipped {
            flipUp(speed: 0)
        }
        else {
            flipDown(speed: 0)
        }
    }

    func flipUp(speed:TimeInterval = 0.3) {
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        card?.isFlipped = true
    }

    func flipDown(speed:TimeInterval = 0.3) {
          UIView.transition(from: frontImageView, to: backImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        card?.isFlipped = false
    }
}
