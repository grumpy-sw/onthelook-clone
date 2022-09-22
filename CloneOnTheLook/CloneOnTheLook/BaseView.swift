//
//  BaseView.swift
//  CloneOnTheLook
//
//  Created by 박세웅 on 2022/09/22.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //layer.opacity = 0.5
        backgroundColor = .orange
        setSubViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let coverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        return view
    }()
    let baseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "어떤 성별로 보시겠어요?"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    let maleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("남성", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        button.layer.cornerRadius = 8
        return button
    }()
    let femaleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("여성", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        button.layer.cornerRadius = 10
        return button
    }()
    
    func setSubViews() {
        baseStackView.addArrangedSubview(descriptionLabel)
        baseStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(maleButton)
        buttonStackView.addArrangedSubview(femaleButton)
        
        addSubview(coverView)
        addSubview(baseStackView)
        
    }
    
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            coverView.topAnchor.constraint(equalTo: self.topAnchor),
            coverView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            coverView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            baseStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 300),
            baseStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            baseStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            maleButton.heightAnchor.constraint(equalToConstant: 50),
            femaleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
