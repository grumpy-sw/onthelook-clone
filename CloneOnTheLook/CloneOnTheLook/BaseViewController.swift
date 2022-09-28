//
//  BaseViewController.swift
//  CloneOnTheLook
//
//  Created by 박세웅 on 2022/09/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    let baseView = BaseView()
    var imageList: [BaseCellModel] = []
    
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
        let pictures = ["1", "2", "3", "4", "5", "6", "7", "8"]
        let users = ["@lee._.250", "@esmilk", "@__hyeokeo", "@zzong_10", "@dailydo_ri", "@s_habille", "@hakchan_sik", "@ho._.dongdong", "@55osh", "@good.leee", "@Dustin0507", "@daily.room_", "@mnm_j97h", "@se_woong._.park", "@seung.u97"]
        
        for index in 0..<53 {
            imageList.append(BaseCellModel(image: UIImage(named: pictures[index % 8])!, user: users.randomElement()!))
        }
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
        
        let cellInfo = imageList[indexPath.item]
        cell.setCellData(cellInfo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? BaseCollectionViewCell {
            cell.coverView.isHidden.toggle()
        }
    }
}

extension BaseViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let cellWidth: CGFloat = (view.bounds.width - 4) / 3
        let imageHeight = imageList[indexPath.item].image.size.height
        let imageWidth = imageList[indexPath.item].image.size.width
        
        let imageRatio = imageHeight/imageWidth
        
        return imageRatio * cellWidth
    }
}
