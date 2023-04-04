//
//  ViewController.swift
//  Account
//
//  Created by user235115 on 3/19/23.
//

import UIKit

class ViewController: UIViewController{

    @IBAction func nameField(_ sender: UITextField) {
        self.performSegue(withIdentifier: "goToFinal", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFinal"{
             segue.destination as! FinalViewController
        }
    }
}

