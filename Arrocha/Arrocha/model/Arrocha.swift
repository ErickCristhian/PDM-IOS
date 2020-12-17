//
//  Arrocha.swift
//  Arrocha
//
//  Created by Erick Cristhian Moura da Silva on 17/12/20.
//  Copyright © 2020 Erick Cristhian Moura da Silva. All rights reserved.
//

import Foundation

class Arrocha {
    var inicio: Int
    var fim: Int
    var numero: Int
    
    init(inicio: Int, fim: Int) {
        self.inicio = inicio
        self.fim = fim
        self.numero = Int.random(in: self.inicio + 1 ..< self.fim)
    }
    
    func isArrochado() -> Bool {
        return self.inicio + 1 == self.fim - 1
    }
    
    func chuteValido(chute: Int) -> Bool {
        if (chute <= self.inicio) || (chute >= self.fim){
            return false
        }else if (chute == self.numero){
            return false
        }
        return true
    }
    func jogar(chute: Int) {
        if(chute < self.numero){
            self.inicio = chute
        }else {
            self.fim = chute
        }
    }
}
