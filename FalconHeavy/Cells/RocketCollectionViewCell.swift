//
//  RocketCollectionViewCell.swift
//  FalconHeavy
//
//  Created by Alina Sakovskaya on 7.04.24.
//

import UIKit

class RocketCollectionViewCell: UICollectionViewCell {
    private let numberLabel = UILabel(text: "229",
                                      font: .labGrotesqueBold16(),
                                      color: .specialMediumLabel)
    
    let parameterLabel = UILabel(text: "Высота, ft",
                                 font: .labGrotesqueRegular14(),
                                 color: .specialCellLabel)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder)")
    }
    
    private func setupViews() {
        layer.cornerRadius = 20
        backgroundColor = .specialCellBackground
        
        addSubview(numberLabel)
        addSubview(parameterLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            parameterLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 0),
            parameterLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

