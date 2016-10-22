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
    @IBOutlet var fromUnitSegmentedControl: UISegmentedControl!
    @IBOutlet var toUnitSegmentedControl: UISegmentedControl!
    @IBOutlet var numberToConvert: UITextField!
    
    let mileUnit : Float = 1.609344
    let yardUnit : Float = 0.0009144
    
    
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
        var resultValue = ""
        var originValue = ""
        
        if fromUnitSegmentedControl.selectedSegmentIndex == 0 {
            
            originValue = formatValue(result: valueToConvert, mask: "%.2f", unit: "kilómetros")
            
            if toUnitSegmentedControl.selectedSegmentIndex == 1 {
                
                let valueConverted : Float = valueToConvert / mileUnit
                resultValue = formatValue(result: valueConverted, mask: "%.2f", unit: "millas")
                
            } else if toUnitSegmentedControl.selectedSegmentIndex == 2 {
                
                let valueConverted : Float = valueToConvert / yardUnit
                resultValue = formatValue(result: valueConverted, mask: "%.2f", unit: "yardas")
                
            } else {
                resultValue = originValue
            }
            
        } else if fromUnitSegmentedControl.selectedSegmentIndex == 1 {
            
            originValue = formatValue(result: valueToConvert, mask: "%.2f", unit: "millas")
            
            if toUnitSegmentedControl.selectedSegmentIndex == 0 {
                
                let valueConverted : Float = valueToConvert * mileUnit
                resultValue = formatValue(result: valueConverted, mask: "%.2f", unit: "kilometros")
                
            } else if toUnitSegmentedControl.selectedSegmentIndex == 2 {
                
                let valueConverted : Float = valueToConvert * mileUnit / yardUnit
                resultValue = formatValue(result: valueConverted, mask: "%.2f", unit: "yardas")
                
            } else {
                resultValue = originValue
            }
            
        } else if fromUnitSegmentedControl.selectedSegmentIndex == 2 {
            
            originValue = formatValue(result: valueToConvert, mask: "%.2f", unit: "yardas")
            
            if toUnitSegmentedControl.selectedSegmentIndex == 0 {
                
                let valueConverted : Float = valueToConvert * yardUnit
                resultValue = formatValue(result: valueConverted, mask: "%.5f", unit: "kilómetros")
                
            } else if toUnitSegmentedControl.selectedSegmentIndex == 1 {
                
                let valueConverted : Float = valueToConvert * yardUnit / mileUnit
                resultValue = formatValue(result: valueConverted, mask: "%.5f", unit: "millas")

            } else {
                resultValue = originValue
            }
        }
        
        result.text = originValue.appending(" = ").appending(resultValue)
        
    }
    
    func formatValue(result : Float, mask : String, unit : String) -> String {
        var resultValueFormated = result.cleanValue(format: mask).appending(" ").appending(unit)
        
        if result == 1 {
            resultValueFormated.remove(at: resultValueFormated.index(before: resultValueFormated.endIndex))
        }
        
        return resultValueFormated
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension Float {
    func cleanValue(format : String) -> String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: format, self)
    }
}

