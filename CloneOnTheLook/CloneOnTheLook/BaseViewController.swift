//
//  BaseViewController.swift
//  CloneOnTheLook
//
//  Created by 박세웅 on 2022/09/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    let baseView = BaseView()
    var imageList: [UIImage] = []
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = baseView.collectionView.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        setSampleImages()
        setButtonAction()
        setCollectionViewCell()
        setCollectionViewDelegate()
    }
    
    private func setSampleImages() {
        imageList.append(UIImage(named: "1")!)
        imageList.append(UIImage(named: "2")!)
        imageList.append(UIImage(named: "3")!)
        imageList.append(UIImage(named: "4")!)
        imageList.append(UIImage(named: "5")!)
        imageList.append(UIImage(named: "6")!)
        imageList.append(UIImage(named: "7")!)
        imageList.append(UIImage(named: "8")!)
        imageList.append(UIImage(named: "1")!)
        imageList.append(UIImage(named: "2")!)
        imageList.append(UIImage(named: "3")!)
        imageList.append(UIImage(named: "4")!)
        imageList.append(UIImage(named: "5")!)
        imageList.append(UIImage(named: "6")!)
        imageList.append(UIImage(named: "7")!)
        imageList.append(UIImage(named: "8")!)
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
        baseView.selectCompleteButton.isHidden.toggle()
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
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseCollectionViewCell.identifier, for: indexPath) as? BaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        let image = imageList[indexPath.item]
        cell.imageView.image = image
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width * 0.31, height: collectionView.frame.height * 0.3)
//    }
}

extension BaseViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let cellWidth: CGFloat = (view.bounds.width - 4) / 3
        let imageHeight = imageList[indexPath.item].size.height
        let imageWidth = imageList[indexPath.item].size.width
        
        let imageRatio = imageHeight/imageWidth
        
        return imageRatio * cellWidth
    }
}
