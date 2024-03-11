//
//  FirstScreenViewModel.swift
//  Observer
//
//  Created by Alessandro Teixeira Lima on 11/03/24.
//

import Foundation

class FirstScreenViewModel {
    weak var observer: Observer?

    func updateValue(newValue: String) {
        observer?.valueDidChange(newValue: newValue)
    }
}

