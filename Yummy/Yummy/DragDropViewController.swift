//
//  DragDropViewController.swift
//  Yummy
//
//  Created by Beatrix Lee on 31/08/20.
//  Copyright © 2020 Beatrix Lee. All rights reserved.
//

import UIKit

class DragDropViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public var nomesMisteriosos = ["A revelação dos paredões", "Abacaxii", "Allen Iverson", "Carai Largatixa", "ChorãoComedorDeCasado", "Dantitas", "Dog Caramelo", "Doninha Espacial", "Faroeste Universitário", "Fratis", "Gado Tristinho", "HeisenbergPOW", "High On Chicletinho", "Creide", "Máscara Verde", "Mister M", "Moita Afoita", "O Rebocado de Jequiti", "OiCasado", "Orelhinha de Gata", "Panda neurótico", "Passoquinha", "Reviradora de Olhos Profissional", "Sorria Mo", "Stefani Joanne Angelina Germanotta", "Tamtam", "Tutuzinho de Feijão", "Xuxubabe", "Yoga boy", "Zé Mamão", "Zebiloide"]
    
    
    @IBOutlet weak var cookiesImageView: UIImageView!
    @IBOutlet weak var cardsAcademyCollectionView: UICollectionView!
    var onWater: OnWater? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.onWater)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        cardsAcademyCollectionView.collectionViewLayout = layout
        
        cardsAcademyCollectionView.delegate = self
        cardsAcademyCollectionView.dataSource = self
        
        cookie()
        
    }
    
    func cookie() {
        if onWater?.water == false {
            cookiesImageView.image = #imageLiteral(resourceName: "CRACKEDCOOKIE")
            print("deu seco")
        }else{
            if onWater?.water == true {
                cookiesImageView.image = #imageLiteral(resourceName: "MILKCOOKIE")
                print("deu molhado")
            }
        }
    }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return nomesMisteriosos.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardsAcademy", for: indexPath) as! DragDropCollectionViewCell
            
            let cellIndex = indexPath.item
            
            cell.layer.cornerRadius = 20
            cell.layer.backgroundColor = #colorLiteral(red: 0.2833517194, green: 0.9702231288, blue: 0.8814888597, alpha: 1)
            
            cell.nomeCardsLabel.text = nomesMisteriosos[cellIndex]
            
            return cell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: 160, height: 180)
            
        }
        
}

