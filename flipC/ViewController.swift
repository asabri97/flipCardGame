//
//  ViewController.swift
//  flipC
//
//  Created by Abrish Sabri on 01.05.20.
//  Copyright © 2020 Abrish Sabri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    let model = CardModel()
    var cardsArray = [Card]()

    var firstCardFlippedIndex:IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        cardsArray = model.getCards()

        // set the view controller as the datasource and delegate of the collection view
        collectionView.dataSource = self
        collectionView.delegate = self
    }


    // MARK: - Collection View Delegate Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        //return number of cards
        return cardsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // Get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell

        // Configure cell
        let card = cardsArray[indexPath.row]
        cell.configureCell(card: card)

        // return cell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        // Refernce to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell

        // Check the card status
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false {
            cell?.flipUp()

            // check if it's first card
            if firstCardFlippedIndex == nil {
                firstCardFlippedIndex = indexPath
            }


            else {

                // if second card is flipped, run comparison logic
                checkForMatch(indexPath)
            }

        }

    }

    // MARK: - Card Game Logic methods

    func checkForMatch(_ secondCardFlippedIndex:IndexPath) {

        // Two card objects with indices to check if they match
        let cardOne = cardsArray[firstCardFlippedIndex!.row]
        let cardTwo = cardsArray[secondCardFlippedIndex.row]

        let cellCardOne = collectionView.cellForItem(at: firstCardFlippedIndex!) as? CardCollectionViewCell
        let cellCardTwo = collectionView.cellForItem(at: secondCardFlippedIndex) as? CardCollectionViewCell

        // Compare the two cards
        if cardOne.imageName == cardTwo.imageName {
            // Set the status
            cardOne.isMatched = true
            cardTwo.isMatched = true

            // Remove the cards
            cellCardOne?.remove()
            cellCardTwo?.remove()
        }

        else {
            // flip the cards back
            cellCardOne?.flipDown()
            cellCardTwo?.flipDown()
        }

        // Reset the firstCardFlipped property
        firstCardFlippedIndex = nil
    }

}

