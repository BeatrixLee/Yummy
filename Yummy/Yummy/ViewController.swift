//
//  ViewController.swift
//  Yummy
//
//  Created by Beatrix Lee on 31/08/20.
//  Copyright © 2020 Beatrix Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var instrucaoLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var confirmarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmarButton.layer.cornerRadius = 20
        
        
    }

    @IBAction func confirmarButton(_ sender: UIButton) {
        
        
    }
    
}

