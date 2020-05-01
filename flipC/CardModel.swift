//
//  CardModel.swift
//  flipC
//
//  Created by Abrish Sabri on 01.05.20.
//  Copyright © 2020 Abrish Sabri. All rights reserved.
//

import Foundation

class CardModel {

    func getCards() -> [Card] {

        // Declare an empty array
        var generatedCards = [Card]()
        var keepTrack = [Int]()

        // Randomly generate 8 pairs of cards
        while keepTrack.count < 8 {

            // Generate a random number
            let randomNumber = Int.random(in: 1...13)

            // Keep tracks of duplicates
            if !keepTrack.contains(randomNumber) {
                keepTrack.append(randomNumber)
                // Create two new card objects
                let cardOne = Card()
                let cardTwo = Card()

                // Set their image names
                cardOne.imageName = "card\(randomNumber)"
                cardTwo.imageName = "card\(randomNumber)"
                // Add them to the array
                generatedCards += [cardOne,cardTwo]
                print(randomNumber)
            }
        }

        // Randomize the cards within the array
        generatedCards.shuffle()

        // Return the array
        return generatedCards
    }
}
