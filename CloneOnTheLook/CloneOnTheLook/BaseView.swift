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
        backgroundColor = .black
        setSubViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    let baseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "마음에 드는 스타일을 선택해주세요"
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "onthelook이 취향을 분석하고\n좋아할 만한 스타일을 추천해드릴게요!"
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    let collectionView: UICollectionView = {
        //let layout = UICollectionViewFlowLayout()
        let layout = PinterestLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .black
        return collectionView
    }()
    let selectCompleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("5개 이상 선택해주세요", for: .normal)
        button.setTitleColor(.systemGray2, for: .normal)
        button.backgroundColor = .darkGray
//        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.isHidden = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    let coverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        return view
    }()
    let coverBaseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    let coverDescriptionLabel: UILabel = {
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
        baseStackView.addArrangedSubview(titleLabel)
        baseStackView.addArrangedSubview(subtitleLabel)
        baseStackView.addArrangedSubview(collectionView)
        
        coverBaseStackView.addArrangedSubview(coverDescriptionLabel)
        coverBaseStackView.addArrangedSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(maleButton)
        buttonStackView.addArrangedSubview(femaleButton)
        
        addSubview(backButton)
        addSubview(baseStackView)
        addSubview(selectCompleteButton)
        addSubview(coverView)
        addSubview(coverBaseStackView)
    }
    
    func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 30),
            baseStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            baseStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            baseStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            selectCompleteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            selectCompleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            selectCompleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 320),
            selectCompleteButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            coverView.topAnchor.constraint(equalTo: self.topAnchor, constant: 230),
            coverView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            coverView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            coverBaseStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 300),
            coverBaseStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            coverBaseStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        ])

        NSLayoutConstraint.activate([
            maleButton.heightAnchor.constraint(equalToConstant: 50),
            femaleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
