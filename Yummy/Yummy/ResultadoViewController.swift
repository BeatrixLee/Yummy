//
//  ResultadoViewController.swift
//  Yummy
//
//  Created by Beatrix Lee on 02/09/20.
//  Copyright © 2020 Beatrix Lee. All rights reserved.
//

import UIKit

class ResultadoViewController: ViewController {
    
    var resultado: String?
    var secoOuMolhado: UIImageView?
    var nomeReal: String?
    
    @IBOutlet weak var biscoitoImageView: UIImageView!
    @IBOutlet weak var revelaNomeLabel: UILabel!
    @IBOutlet weak var revelaNomeRealLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        revelaNomeLabel.text = resultado
        biscoitoImageView.image = secoOuMolhado?.image
        revelaNomeRealLabel.text = nomeReal

        print(resultado)
        print(secoOuMolhado)
    }

}
