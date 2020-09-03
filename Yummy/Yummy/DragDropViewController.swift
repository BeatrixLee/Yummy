//
//  DragDropViewController.swift
//  Yummy
//
//  Created by Beatrix Lee on 31/08/20.
//  Copyright © 2020 Beatrix Lee. All rights reserved.
//

import UIKit


class DragDropViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    public var nomesMisteriosos = ["A revelação dos paredões", "Abacaxii", "Allen Iverson", "Carai Largatixa", "Chorão", "Dantitas", "Dog Caramelo", "Doninha Espacial", "Faroeste Universitário", "Fratis", "Gado Tristinho", "HeisenbergPOW", "High On Chicletinho", "Creide", "Máscara Verde", "Mister M", "Moita Afoita", "O Rebocado de Jequiti", "OiCasado", "Orelhinha de Gata", "Panda neurótico", "Passoquinha", "Reviradora de Olhos Profissional", "Sorria Mo", "Stefani Joanne Angelina Germanotta", "Tamtam", "Tutuzinho de Feijão", "Xuxubabe", "Yoga boy", "Zé Mamão", "Zebiloide"]
    
    var nomesReais = ["Danilo Lira", "Junior", "Luis Pereira", "Pedro Spínola", "Erick Almeida", "Lívia", "Mirella Almeida", "Ana Carolina Melo", "Hugo Santos", "Lucas Vinícius", "Hélio Silva", "José Henrique", "Renan Freitas", "Ravena", "Eduardo Lopes C", "Victor Vieira", "Marina Savluchinske", "Felipe Bandeira", "Dudu Ramos", "Alanis Lima", "Alexandra", "Íris Soares", "Marina Lima", "Morgana Galamba", "Samuel", "Matheus", "Ana", "Meyrillan", "Wilton Ramos", "Juliano", "Vítor Bárrios"]
    
    
    @IBOutlet weak var cookiesImageView: UIImageView!
    @IBOutlet weak var cardsAcademyCollectionView: UICollectionView!
    @IBOutlet weak var resultadoBiscoitoLabel: UILabel!
    
    var onWater: OnWater?
    var initialPosition = CGPoint.zero
    
    var resultado: String?
    var nomeReal: String?
    var secoOuMolhado: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cria gesture recognizer e adiciona na ImageView com os cookies
        let dragInteraction = UIPanGestureRecognizer(target: self, action: #selector(dragCookies(_:)))
        cookiesImageView.addGestureRecognizer(dragInteraction)
        
        // ativa as interações do user
        cookiesImageView.isUserInteractionEnabled = true
        
        print(self.onWater)
                
        if self.onWater!.water {
            self.resultadoBiscoitoLabel.text = "Em um momento de distração, seu biscoito acaba caindo dentro do leite. Agora ele está encharcado."
        } else {
            self.resultadoBiscoitoLabel.text = "Você ganhou um biscoito, mas infelizmente o leite está em falta, então ele está sequinho. De qualquer forma, ele é muito gostoso."
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        cardsAcademyCollectionView.collectionViewLayout = layout
        
        cardsAcademyCollectionView.delegate = self
        cardsAcademyCollectionView.dataSource = self
        
        cookie()
                
    }
    
    //func para mostrar se o biscoito é seco ou molhando dependendo do resultado da API
    
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
        self.secoOuMolhado = cookiesImageView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exibirResultado" {
            let viewController = segue.destination as? ResultadoViewController
            viewController?.resultado = self.resultado
            viewController?.nomeReal = self.nomeReal
            viewController?.secoOuMolhado = self.secoOuMolhado
        }
    }
    
    //func para configurar o gesto que vai ser feito com base em estados de casos, como quando o toque começa, qual ele muda e quando termina
    
    @objc func dragCookies(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.initialPosition = cookiesImageView.center
            break
        case .changed:
            self.cookiesImageView.center = recognizer.location(in: self.view)
            break
        case .ended:
            if cardsAcademyCollectionView.frame.contains(cookiesImageView.center) {
                let matchingViews = self.cardsAcademyCollectionView.subviews.filter {$0.convert($0.bounds, to: self.view).contains(recognizer.location(in: self.view))}
                if matchingViews.first != nil {
                    let cell = matchingViews.first! as! DragDropCollectionViewCell
                    self.resultado = cell.nomeCardsLabel.text
                    // pega o indice do apelido e pega o nome real com o mesmo indice
                    self.nomeReal = self.nomesReais[self.nomesMisteriosos.firstIndex(of: cell.nomeCardsLabel.text!)!]
                    performSegue(withIdentifier: "exibirResultado", sender: self)
                }
            }else{
                self.cookiesImageView.center = initialPosition
            }
            break
        default:
            return
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


