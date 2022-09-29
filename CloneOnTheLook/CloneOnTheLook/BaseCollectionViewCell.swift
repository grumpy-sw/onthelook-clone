//
//  BaseCollectionViewCell.swift
//  CloneOnTheLook
//
//  Created by 박세웅 on 2022/09/26.
//

import UIKit

final class BaseCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        String(describing: Self.self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                coverView.isHidden.toggle()
//            }
//        }
//    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .systemPurple
        return imageView
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    let coverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.isHidden = true
        return view
    }()
    
    let heartView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "suit.heart.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setSubViews() {
        coverView.addSubview(heartView)
        contentView.addSubview(imageView)
        contentView.addSubview(idLabel)
        contentView.addSubview(coverView)
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            idLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            coverView.topAnchor.constraint(equalTo: self.topAnchor),
            coverView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            coverView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heartView.centerXAnchor.constraint(equalTo: coverView.centerXAnchor),
            heartView.centerYAnchor.constraint(equalTo: coverView.centerYAnchor),
            heartView.heightAnchor.constraint(equalToConstant: 30),
            heartView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setCellData(_ cellInfo: BaseCellModel, _ selected: Bool) {
        imageView.image = cellInfo.image
        idLabel.text = cellInfo.user
        coverView.isHidden = !selected   // 선택하면(selected=true) -> isHidden=false
    }
}

extension BaseCollectionViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        idLabel.text = nil
        coverView.isHidden = true
    }
}
