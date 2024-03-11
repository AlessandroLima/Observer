//
//  FirstScreenViewModel.swift
//  Observer
//
//  Created by Alessandro Teixeira Lima on 11/03/24.
//

import Foundation

class DataModel {
    var value: String = ""
}

class FirstScreenViewModel {
    private let model: DataModel
    weak var observer: Observer?

    init(model: DataModel) {
        self.model = model
    }

    func updateValue(newValue: String) {
        model.value = newValue
        observer?.valueDidChange(newValue: newValue)
    }
}

