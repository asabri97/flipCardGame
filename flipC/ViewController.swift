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
        if cell?.card?.isFlipped == false {
            cell?.flipUp()
        }
        else {
            cell?.flipDown()
        }

    }

}

