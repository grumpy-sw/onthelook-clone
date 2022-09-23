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
        baseView.maleButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        baseView.femaleButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        baseView.backButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc func buttonDidTap() {
        baseView.coverView.isHidden.toggle()
        baseView.coverBaseStackView.isHidden.toggle()
        baseView.backButton.isHidden.toggle()
    }
    
    @objc func backButtonDidTap() {
//        baseView.coverView.isHidden = false
//        baseView.baseStackView.isHidden = false
//        baseView.backButton.isHidden = true
        print("터치")
    }

}

