//
//  ViewController.swift
//  Yummy
//
//  Created by Beatrix Lee on 31/08/20.
//  Copyright © 2020 Beatrix Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var onWater: OnWater?
    
    @IBOutlet weak var instrucaoLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var confirmarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmarButton.layer.cornerRadius = 20
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        dismissKey()

    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    
    @IBAction func confirmarButton(_ sender: UIButton) {
        
        if self.latitudeTextField.text == "" || self.longitudeTextField.text == "" {
            // se um ou outro nao estiver preenchido, avisa para o usuario preencher
        }
        
        if Int(self.latitudeTextField.text!) ?? -91 < -90 || Int(self.latitudeTextField.text!) ?? 91 > 90 {
            // avisa que tem que ser maior que -90 e menor que 90
        }
        
        if Int(self.longitudeTextField.text!) ?? -181 < -180 || Int(self.longitudeTextField.text!) ?? 181 > 180 {
            // avisa que tem que ser maior que -180 e menor que 180
        }
        
        load()
        
    }
    
    // quando for chamar uma segue (sair de uma tela para outra) primeiro ele passa por esse metodo, para passar a informacao de uma tela para outra
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarResultado" {
            // se for a segue certa ele entra aqui no if e cria uma variavel que é a proxima view controller que é a segunda tela
            let viewController2 = segue.destination as? DragDropViewController
            viewController2?.onWater = self.onWater
        }
    }
    
    func load() {
        let latitude = latitudeTextField.text!
        let longitude = longitudeTextField.text!
        let stringURL = "https://api.onwater.io/api/v1/results/\(latitude),\(longitude)?access_token=EqSdx-D9e-wM48gYTPGY"
        let url = URL(string:stringURL)!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(OnWater.self, from: data!)
                // nao precisa do array [OnWater.self] pois so recebe um item
                
                DispatchQueue.main.async {
                    self.onWater = jsonData
                    self.performSegue(withIdentifier: "mostrarResultado", sender: self)
                }
            } catch {
                print("JSON error: \"(error.localizedDescription)")
                DispatchQueue.main.async {
                    //
                }
            }
        }
        // loading screen aqui, mas tem que sair antes da linha 54 no do
        task.resume()
    }
    
}

extension UIViewController {
    func dismissKey()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false; view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
