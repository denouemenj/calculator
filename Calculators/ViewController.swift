//
//  ViewController.swift
//  Calculators
//
//  Created by Jiayu li on 2017-07-14.
//  Copyright © 2017 Jiayu li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var perfromingMath = false
    var operation = 0
    var haspreviousNumber = false
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if perfromingMath == true{
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            perfromingMath = false
        }
        else{
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            if perfromingMath==false && haspreviousNumber==true
            {
                if operation == 12 {
                    previousNumber = previousNumber / numberOnScreen
                }
                else if operation == 13 {
                    previousNumber = previousNumber * numberOnScreen
                }
                else if operation == 14 {
                    previousNumber = previousNumber - numberOnScreen
                }
                else if operation == 15 {
                    previousNumber = previousNumber + numberOnScreen
                }
            }
            else
            {
                previousNumber = Double(label.text!)!
                haspreviousNumber = true
            }
            
            if sender.tag == 12 { //Divide
                label.text = "/"
            }
            else if sender.tag == 13 {  //Multiply
                label.text = "x"
            }
            else if sender.tag == 14 {  //Minus
                label.text = "-"
            }
            else if sender.tag == 15 {  //Plus
                label.text = "+"
            }
            operation = sender.tag
            perfromingMath = true
        }
        else if sender.tag == 16 {
            // performing equal
            if operation == 12 {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 {
                label.text = String(previousNumber * numberOnScreen)
            }
           else if operation == 14 {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                label.text = String(previousNumber + numberOnScreen)
            }
            
        }
        else if sender.tag == 11{
            // clear
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            haspreviousNumber = false
        }
        else if sender.tag == 1 {
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

