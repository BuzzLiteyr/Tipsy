//
//  TipCalculator.swift
//  Tipsy
//
//  Created by Michel Besnard on 2016-07-14.
//  Copyright © 2016 Michel Besnard. All rights reserved.
//

import Foundation

class TipCalculator {
    
    // tip amount, bill amount, tip percentage, total amount
    
    // MARK: - Private Variables (Properties)
    private var _tipAmount: Double = 0
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _totalAmount: Double = 0
    
    // MARK: - Getters and Setters
    var tipAmount: Double {
        return _tipAmount
    }
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    //MARK: - Initialized
    init(billAmount: Double, tipPercent: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
    }
    
    //MARK: - Functions
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
    }
    
    
}
