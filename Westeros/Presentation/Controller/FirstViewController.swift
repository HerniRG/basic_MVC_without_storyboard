//
//  FirstViewController.swift
//  Westeros
//
//  Created by Hernán Rodríguez on 11/9/24.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func aPorTodasButton(_ sender: Any) {
        let viewController = SecondViewController()
        self.present(viewController, animated: true)
    }
    

}
