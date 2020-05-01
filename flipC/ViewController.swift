//
//  ViewController.swift
//  flipC
//
//  Created by Abrish Sabri on 01.05.20.
//  Copyright © 2020 Abrish Sabri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let model = CardModel()
    var cardsArray = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        cardsArray = model.getCards()
    }



}

