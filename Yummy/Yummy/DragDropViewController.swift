//
//  DragDropViewController.swift
//  Yummy
//
//  Created by Beatrix Lee on 31/08/20.
//  Copyright © 2020 Beatrix Lee. All rights reserved.
//

import UIKit

class DragDropViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    @IBOutlet weak var cardsAcademyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        cardsAcademyCollectionView.collectionViewLayout = layout
        
        cardsAcademyCollectionView.delegate = self
        cardsAcademyCollectionView.dataSource = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 20
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardsAcademy", for: indexPath) as! DragDropCollectionViewCell
        
        cell.layer.cornerRadius = 20
        cell.layer.backgroundColor = #colorLiteral(red: 0.2833517194, green: 0.9702231288, blue: 0.8814888597, alpha: 1)
        
        return cell
        
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 160, height: 180)
        
    }
    
    
    
}
