//
//  LaunchesTableViewCell.swift
//  FalconHeavy
//
//  Created by Alina Sakovskaya on 7.04.24.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {

    private let launcesBackgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = .specialCellBackground
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LaunchNOT")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameRocketLabel = UILabel(text: "FalconSat",
                                          font: .labGrotesqueRegular20(),
                                          color: .specialBigLabel)
    
    private let dateRocketLabel = UILabel(text: "2 февраля, 2022",
                                          font: .labGrotesqueRegular16(),
                                          color: .specialCellLabel)
    
    private var rocketStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        rocketStackView =  UIStackView(arrangedSubviews: [nameRocketLabel, dateRocketLabel],
                                       axis: .vertical,
                                       spacing: 2)
        addSubview(backgroundCell)
        backgroundCell.addSubview(launcesBackgroundCell)
        backgroundCell.addSubview(rocketStackView)
        backgroundCell.addSubview(rocketImageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCell.heightAnchor.constraint(equalTo: heightAnchor),
            backgroundCell.widthAnchor.constraint(equalTo: widthAnchor),
            launcesBackgroundCell.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 8),
            launcesBackgroundCell.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 32),
            launcesBackgroundCell.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -32),
            launcesBackgroundCell.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -8),
            rocketImageView.centerYAnchor.constraint(equalTo: rocketStackView.centerYAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: launcesBackgroundCell.trailingAnchor, constant: -24),
            rocketImageView.heightAnchor.constraint(equalToConstant: 50),
            rocketImageView.widthAnchor.constraint(equalToConstant: 50),
            rocketStackView.centerYAnchor.constraint(equalTo: launcesBackgroundCell.centerYAnchor),
            rocketStackView.leadingAnchor.constraint(equalTo: launcesBackgroundCell.leadingAnchor, constant: 24),
        ])
    }
}
