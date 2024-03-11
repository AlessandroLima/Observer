//
//  FirstScreenViewController.swift
//  Observer
//
//  Created by Alessandro Teixeira Lima on 11/03/24.
//

import Foundation
import UIKit

class FirstScreenViewController: UIViewController, Observer {
    private let viewModel: FirstScreenViewModel
    private let valueLabel = UILabel()

    init(viewModel: FirstScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.observer = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(valueLabel)

        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func valueDidChange(newValue: String) {
        valueLabel.text = newValue
    }
}

