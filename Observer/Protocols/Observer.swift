//
//  Observer.swift
//  Observer
//
//  Created by Alessandro Teixeira Lima on 11/03/24.
//

import Foundation

protocol Observer: AnyObject {
    func valueDidChange(newValue: String)
}
