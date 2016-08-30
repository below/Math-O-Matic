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
    @IBOutlet weak var operatorFeld: UILabel!
    @IBOutlet weak var rechenartenControl: UISegmentedControl!
    @IBOutlet weak var counterLabel: UILabel!

    var correct = 0
    var wrong = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFields()
    }
    
    func setUpFields() {
        self.ergebnis.text = ""
        
        var f1 : Int!
        var f2 : Int!
        switch rechenartenControl.selectedSegmentIndex {
        case 1:
            operatorFeld.text = ":"
            f2 = Int(arc4random_uniform(10) + 1)
            let result = Int(arc4random_uniform(10) + 1)
            f1 = f2 * result
        default:
            operatorFeld.text = "⨯"
            f1 = Int(arc4random_uniform(10) + 1)
            f2 = Int(arc4random_uniform(10) + 1)

        }
        
        self.faktor2.text = String(f2)
        self.faktor1.text = String(f1)
    }
    
    @IBAction func andereRechenart(_ sender: UISegmentedControl) {
        setUpFields()
    }
    
    func currentOperation () -> ((_ x : Int, _ y : Int) -> Int) {
        switch rechenartenControl.selectedSegmentIndex {
        case 1:
            return { (x:Int, y:Int) -> Int in
                return x / y
            }
        default:
            return { (x:Int, y:Int) -> Int in
                return x * y
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let f1 = Int(self.faktor1.text ?? "") ?? 0
        let f2 = Int(self.faktor2.text ?? "") ?? 0
        
        let e = Int(self.ergebnis.text ?? "") ?? 0
        
        let calc = currentOperation()
        if e == calc(f1, f2) {
            self.anzeige.text = "✔️"
            correct = correct + 1
        }
        else {
            self.anzeige.text = "❌"
            wrong = wrong + 1
        }
        let correctString = NSAttributedString(string: String(correct), attributes: [ NSForegroundColorAttributeName : UIColor.green ])
        let wrongString = NSAttributedString(string: String(wrong), attributes: [ NSForegroundColorAttributeName : UIColor.red ])
        setUpFields()
        
        let resultString = NSMutableAttributedString(attributedString: correctString)
        resultString.append(NSAttributedString(string: " / "))
        resultString.append(wrongString)
        counterLabel.attributedText = resultString
        return true
    }
    
    @IBAction func neuesErgebnis(_ sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

