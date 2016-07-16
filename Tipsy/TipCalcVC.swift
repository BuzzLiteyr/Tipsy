//
//  ViewController.swift
//  Tipsy
//
//  Created by Michel Besnard on 2016-07-13.
//  Copyright © 2016 Michel Besnard. All rights reserved.
//

import UIKit

class TipCalcVC: UIViewController, UITextFieldDelegate {

    // MARK: - @IBOutlets
    @IBOutlet weak var tipsyView: UIView!
    @IBOutlet weak var billAmountTF: StyledTextField!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var tipSplitSlider: UISlider!
    @IBOutlet weak var tipSplitLbl: UILabel!
    @IBOutlet weak var tipSplitAmount: UILabel!

    // MARK: - Properties
    var tipCalculator = TipCalculator(billAmount: 00.00, tipPercent: 15)
    var splitAmount:Double = 0.0
    var howManyToSplit:Int = 1
    var howManyPeople: Int = 1
    var currentTipValue: Int = 0
    
    // MARK: - Load Views
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBActions
    @IBAction func billAmountChanges(_ sender: AnyObject) {
        calcTipChange()
        calcTipSplit()
        updateTipUI()
        calcTip()
    }
    
    @IBAction func tipPercentChanges(_ sender: UISlider) {
        calcTipChange()
        calcTipSplit()
        updateTipUI()
        calcTip()
    }
    
    @IBAction func tipSplitChanges(_ sender: UISlider) {
        calcTipChange()
        calcTipSplit()
        updateTipUI()
        calcTip()
    }
    
    // MARK: - Functions
    func calcTip() {
        tipCalculator.tipPercent = Double(tipPercentSlider.value)
        let tempValue = Double(Int((tipCalculator.tipPercent + 0.005) * 100))
        tipCalculator.tipPercent = tempValue/100
        tipCalculator.billAmount = ((billAmountTF.text)! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateTipUI()
    }
    
    func updateTipUI() {
        totalAmountLbl.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        tipAmountLbl.text = String(format: "$%0.2f", tipCalculator.tipAmount)
        tipSplitAmount.text = String(format: "$%0.2f", splitAmount)
//        tipPercentLbl.text = String("TIP \(currentTipValue)%")
    }
    
    func calcTipChange() {
        currentTipValue = Int(tipPercentSlider.value)
        tipPercentLbl.text = String("TIP \(Int(tipPercentSlider.value * 10000 / 100))%")
        calcTip()
        calcTipSplit()
    }

    func calcTipSplit() {
        howManyToSplit = Int(tipSplitSlider.value)
        splitAmount = Double(tipCalculator.tipAmount) / Double(howManyToSplit)
        howManyPeople = Int(tipSplitSlider.value)
        tipSplitLbl.text = String("SPLIT: \(howManyPeople)")
        calcTip()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == billAmountTF {
            textField.isFirstResponder()
            calcTip()
        }
        return true
    }
    
}

