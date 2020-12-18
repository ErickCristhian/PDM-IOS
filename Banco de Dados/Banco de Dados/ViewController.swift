//
//  ViewController.swift
//  Banco de Dados
//
//  Created by Erick Cristhian Moura da Silva on 18/12/20.
//  Copyright © 2020 Erick Cristhian Moura da Silva. All rights reserved.
//

import UIKit

import CoreData

class ViewController: UIViewController {

    var delegate: AppDelegate!
    var contexto: NSManagedObjectContext!
    
    @IBOutlet weak var tfNome: UITextField!
    
    @IBOutlet weak var tfIdade: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = UIApplication.shared.delegate as? AppDelegate
        self.contexto = self.delegate.persistentContainer.viewContext
    }

    
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text
               let idade = Int(self.tfIdade.text!)
               let pessoa = NSEntityDescription.insertNewObject(forEntityName: "Pessoa", into: self.contexto)
               
               pessoa.setValue(nome, forKey: "nome")
               pessoa.setValue(idade, forKey: "idade")
               
               self.delegate.saveContext()
               self.listar()
               self.aumentaIdade()
               self.delFirst()
    }
    func listar(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        
        do {
            let pessoas = try self.contexto.fetch(requisicao) as!  [NSManagedObject]
            for p in pessoas{
                let nome = p.value(forKey: "nome")
                let idade = p.value(forKey: "idade")
                print("\(nome!) - \(idade!)")
                
            }
        } catch {
            print("Erro!")
        }
        
    }
    
    func aumentaIdade(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        do {
            let pessoas = try self.contexto.fetch(requisicao) as! [NSManagedObject]
            for p in pessoas{
                let idade = p.value(forKey: "idade") as! Int
                p.setValue(idade+10, forKey: "idade")
            }
            self.delegate.saveContext()
            print("Idades atualizadas!")
            self.listar()
        }catch{
            print("erro!")
        }
    }
    func delFirst(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        do {
            let pessoas = try self.contexto.fetch(requisicao) as! [NSManagedObject]
            
            self.contexto.delete(pessoas.first!)

            self.delegate.saveContext()
            print("Primeira Pessoa excluida!")
            self.listar()
        }catch{
            print("erro!")
        }
    }

}

