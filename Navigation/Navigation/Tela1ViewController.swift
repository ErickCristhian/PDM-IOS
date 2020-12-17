//
//  ViewController.swift
//  Navigation
//
//  Created by Erick Cristhian Moura da Silva on 17/12/20.
//  Copyright © 2020 Erick Cristhian Moura da Silva. All rights reserved.
//

import UIKit

class Tela1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tela Inicial - View Did Load")
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)
        print("Tela Inicial - View Will Appear")
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(true)
        print("Tela Inicial - View Did Appear")
    }
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(true)
        print("Tela Inicial - View Will Disappear")
    }
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(true)
        print("Tela Inicial - View Did Disappear")
    }

}

