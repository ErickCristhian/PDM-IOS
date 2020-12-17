//
//  ViewController.swift
//  Arrocha
//
//  Created by Erick Cristhian Moura da Silva on 17/12/20.
//  Copyright © 2020 Erick Cristhian Moura da Silva. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var jogo: Arrocha?
    
    @IBOutlet weak var lbInicio: UILabel!
    
    @IBOutlet weak var lbFim: UILabel!
    

    @IBOutlet weak var slChute: UISlider!
    
    @IBOutlet weak var lbChute: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.novoJogo()
    }
    @IBAction func definirChute(_ sender: Any) {
        self.lbChute.text = String(Int(self.slChute.value))
    }
    @IBAction func chutar(_ sender: Any) {
        if let jogo = self.jogo {
            if (jogo.chuteValido(chute: Int(self.slChute.value))){
                jogo.jogar(chute: Int(self.slChute.value))
                self.atualizaInterface()
                if (jogo.isArrochado()){
                    // Ganhou
                    self.transicao(mensagem: "Ganhou")
                    self.novoJogo()
                }
            }else {
                // Perdeu
                self.transicao(mensagem: "Perdeu")
                self.novoJogo()
            }
        }    }
    
     func novoJogo(){
           self.jogo = Arrocha(inicio: 1, fim: 100)
           self.slChute.value = 1
           self.lbChute.text = String(Int(self.slChute.value))
           atualizaInterface()
           print(self.jogo!.numero)
       }
    func atualizaInterface(){
        if let jogo = self.jogo{
            self.lbInicio.text = String(jogo.inicio)
            self.lbFim.text = String(jogo.fim)
        }
    }
    
    func transicao(mensagem: String){
        let rvc = self.storyboard?.instantiateViewController(identifier: "resultado") as! ResultadoViewController
        rvc.resultado = mensagem
        self.present(rvc, animated: true, completion: nil)
    }}

