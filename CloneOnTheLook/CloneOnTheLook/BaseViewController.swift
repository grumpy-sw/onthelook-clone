//
//  BaseViewController.swift
//  CloneOnTheLook
//
//  Created by 박세웅 on 2022/09/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    let baseView = BaseView()
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
        setCollectionViewCell()
        setCollectionViewDelegate()
    }
    
    
    
    private func setButtonAction() {
        baseView.maleButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        baseView.femaleButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        baseView.backButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc func buttonDidTap() {
        baseView.coverView.isHidden.toggle()
        baseView.coverBaseStackView.isHidden.toggle()
        baseView.backButton.isHidden.toggle()
    }
    
    private func setCollectionViewCell() {
        baseView.collectionView.register(BaseCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: BaseCollectionViewCell.identifier)
    }
    
    private func setCollectionViewDelegate() {
        baseView.collectionView.delegate = self
        baseView.collectionView.dataSource = self
    }
}

extension BaseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseCollectionViewCell.identifier, for: indexPath) as? BaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.31, height: collectionView.frame.height * 0.3)
    }
    
}

