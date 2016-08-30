//
//  ViewController.swift
//  Math-O-Matik
//
//  Created by Alexander v. Below on 30.08.16.
//  Copyright © 2016 Alexander von Below. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var faktor1: UILabel!
    @IBOutlet weak var faktor2: UILabel!
    @IBOutlet weak var ergebnis: UITextField!
    @IBOutlet weak var anzeige: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFields()
    }
    
    func setUpFields() {
        self.ergebnis.text = ""
        
        let f1 = Int(arc4random_uniform(10) + 1)
        let f2 = Int(arc4random_uniform(10) + 1)
        self.faktor2.text = String(f2)
        self.faktor1.text = String(f1)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let f1 = Int(self.faktor1.text ?? "") ?? 0
        let f2 = Int(self.faktor2.text ?? "") ?? 0
        
        let e = Int(self.ergebnis.text ?? "") ?? 0
        
        if e == f1 * f2 {
            self.anzeige.text = "✔️"
        }
        else {
            self.anzeige.text = "❌"
        }
        setUpFields()
        
        return true
    }
    
    @IBAction func neuesErgebnis(_ sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

