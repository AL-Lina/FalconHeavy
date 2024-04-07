//
//  SettingsViewController.swift
//  FalconHeavy
//
//  Created by Alina Sakovskaya on 7.04.24.
//

import UIKit

class SettingsViewController: UIViewController {

    private let nameLabel = UILabel(text: "Настройки",
                                    font: .labGrotesqueRegular16(),
                                    color: .specialSmallLabel)
    
    private let heightLabel = UILabel(text: "Высота",
                                      font: .labGrotesqueRegular16(),
                                      color: .specialSmallLabel)
    
    private let diameterLabel = UILabel(text: "Диаметр",
                                        font: .labGrotesqueRegular16(),
                                        color: .specialSmallLabel)
    
    private let weightLabel = UILabel(text: "Масса",
                                      font: .labGrotesqueRegular16(),
                                      color: .specialSmallLabel)
    
    private let payloadLabel = UILabel(text: "Полезная нагрузка",
                                       font: .labGrotesqueRegular16(),
                                       color: .specialSmallLabel)
    
    private lazy var heighSegmentedControl = createSegmentControl(itemOne: "m", itemTwo: "ft",
                                                                  selector: #selector(heighSegmentedControlTap))
    
    private lazy var diameterSegmentedControl = createSegmentControl(itemOne: "m", itemTwo: "ft",
                                                                     selector: #selector(diameterSegmentedControlTap))
    
    private lazy var weightSegmentedControl = createSegmentControl(itemOne: "kg", itemTwo: "lb",
                                                                   selector: #selector(weightSegmentedControlTap))
    
    private lazy var payloadSegmentedControl = createSegmentControl(itemOne: "kg", itemTwo: "lb",
                                                                    selector: #selector(payloadSegmentedControlTap))
    
    private lazy var closedButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Закрыть", for: .normal)
        button.titleLabel?.font = UIFont.labGrotesqueBold16()
        button.tintColor = .specialBigLabel
        button.addTarget(self, action: #selector(closedButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var heighStackView = UIStackView()
    var diameterStackView = UIStackView()
    var weightStackView = UIStackView()
    var payloadStackView = UIStackView()
    
    let rocketCollectionViewCell = RocketCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        heighSegmentedControlTap()
    }
    
    private func setupViews() {
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialSettingsBackground
        
        view.addSubview(nameLabel)
        view.addSubview(closedButton)
        
        heighStackView =  UIStackView(arrangedSubviews: [heightLabel, heighSegmentedControl],
                                      axis: .horizontal,
                                      spacing: 10)
        diameterStackView =  UIStackView(arrangedSubviews: [diameterLabel, diameterSegmentedControl],
                                         axis: .horizontal,
                                         spacing: 10)
        weightStackView =  UIStackView(arrangedSubviews: [weightLabel, weightSegmentedControl],
                                       axis: .horizontal,
                                       spacing: 10)
        payloadStackView =  UIStackView(arrangedSubviews: [payloadLabel, payloadSegmentedControl],
                                        axis: .horizontal,
                                        spacing: 10)
        view.addSubview(heighStackView)
        view.addSubview(diameterStackView)
        view.addSubview(weightStackView)
        view.addSubview(payloadStackView)
    }
    
    @objc private func closedButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func heighSegmentedControlTap() {
        if heighSegmentedControl.selectedSegmentIndex == 0 {
            rocketCollectionViewCell.parameterLabel.text = "m"
            reloadInputViews()
        } else {
            rocketCollectionViewCell.parameterLabel.text = "ft"
            reloadInputViews()
        }
    }
    
    @objc private func diameterSegmentedControlTap() {
        if diameterSegmentedControl.selectedSegmentIndex == 0 {
            rocketCollectionViewCell.parameterLabel.text = "m"
        } else {
            rocketCollectionViewCell.parameterLabel.text = "ft"
        }
    }
    
    
    @objc private func weightSegmentedControlTap() {
        if weightSegmentedControl.selectedSegmentIndex == 0 {
            rocketCollectionViewCell.parameterLabel.text = "kg"
        } else {
            rocketCollectionViewCell.parameterLabel.text = "lb"
        }
    }
    
    @objc private func payloadSegmentedControlTap() {
        if payloadSegmentedControl.selectedSegmentIndex == 0 {
            rocketCollectionViewCell.parameterLabel.text = "kg"
        } else {
            rocketCollectionViewCell.parameterLabel.text = "lb"
        }
    }
    
}

extension SettingsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closedButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            closedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            heighStackView.topAnchor.constraint(equalTo: closedButton.bottomAnchor, constant: 72),
            heighStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            heighStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            heighSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            heighSegmentedControl.widthAnchor.constraint(equalToConstant: 115),
            diameterStackView.topAnchor.constraint(equalTo: heighStackView.bottomAnchor, constant: 24),
            diameterStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            diameterStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            diameterSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            diameterSegmentedControl.widthAnchor.constraint(equalToConstant: 115),
            weightStackView.topAnchor.constraint(equalTo: diameterStackView.bottomAnchor, constant: 24),
            weightStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            weightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            weightSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            weightSegmentedControl.widthAnchor.constraint(equalToConstant: 115),
            payloadStackView.topAnchor.constraint(equalTo: weightStackView.bottomAnchor, constant: 24),
            payloadStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            payloadStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            payloadSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            payloadSegmentedControl.widthAnchor.constraint(equalToConstant: 115)
        ])
    }
}

