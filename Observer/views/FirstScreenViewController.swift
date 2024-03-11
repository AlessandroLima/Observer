//
//  FirstScreenViewController.swift
//  Observer
//
//  Created by Alessandro Teixeira Lima on 11/03/24.
//

import UIKit

class FirstScreenViewController: UIViewController, Observer {
    private let viewModel: FirstScreenViewModel
    private let valueLabel = UILabel()

    init(viewModel: FirstScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.observer = self
        self.valueLabel.text = "Palceholder"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .gray

        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(valueLabel)

        let showSecondScreenButton = UIButton(type: .system)
        showSecondScreenButton.setTitle("Mostrar Segunda Tela", for: .normal)
        showSecondScreenButton.addTarget(self, action: #selector(showSecondScreen), for: .touchUpInside)
        showSecondScreenButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showSecondScreenButton)

        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showSecondScreenButton.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 20),
            showSecondScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func showSecondScreen() {
        let secondScreenViewController = SecondScreenViewController(viewModel: viewModel)
        navigationController?.pushViewController(secondScreenViewController, animated: true)
    }

    func valueDidChange(newValue: String) {
        valueLabel.text = newValue
    }
}
