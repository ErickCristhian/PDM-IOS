//
//  ViewController.swift
//  Pessoas
//
//  Created by Valéria Cavalcanti on 11/12/20.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    
    var cadastro: Cadastro?
    var pessoa: Pessoa?
    var editIndex: Int?
    
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(true)
        
        if editIndex != -1 {
            self.tfNome.text = self.pessoa?.nome
            self.tfIdade.text = String(self.pessoa!.idade)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.editIndex = -1
    }
    
    
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text
        let idade = Int(self.tfIdade.text!)
        
        let pessoa = Pessoa(nome: nome!, idade: idade!)
        
        self.cadastro?.add(pessoa: pessoa)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

