//
//  ViewController.swift
//  Millas a Metros
//
//  Created by Fernando Rivas Palomo on 18/10/16.
//  Copyright © 2016 Fernando Rivas Palomo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    @IBOutlet var optionSelected: UISegmentedControl!
    @IBOutlet var numberToConvert: UITextField!
    
    let mileUnit : Float = 1.609344
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        result.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func convert(_ sender: UIButton) {
        
        let valueToConvert : Float = Float(numberToConvert.text!)!
        
        if optionSelected.selectedSegmentIndex == 0 {
            let convertedValue = String.init(format: "%.2f", valueToConvert * mileUnit)
            result.text = "\(convertedValue) kilómetros"
            
        } else {
            let convertedValue = String.init(format: "%.2f", valueToConvert / mileUnit)
            result.text = "\(convertedValue) millas"
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

