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
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .systemPurple
        return imageView
    }()
    
    private func setSubViews() {
        contentView.addSubview(imageView)
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

extension BaseCollectionViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
