//
//  SecondScreenViewController.swift
//  Observer
//
//  Created by Alessandro Teixeira Lima on 11/03/24.
//

import UIKit

class SecondScreenViewController: UIViewController {
    private let viewModel: FirstScreenViewModel
    private let textField = UITextField()
    private let updateButton = UIButton()

    init(viewModel: FirstScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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

        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)

        updateButton.setTitle("Atualizar Valor", for: .normal)
        updateButton.setTitleColor(.systemBlue, for: .normal)
        updateButton.addTarget(self, action: #selector(updateValue), for: .touchUpInside)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(updateButton)

        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            textField.widthAnchor.constraint(equalToConstant: 200),
            updateButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func updateValue() {
        viewModel.updateValue(newValue: textField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
