//
//  ViewController.swift
//  pageViewController
//
//  Created by Иван Гришин on 16.08.2022.
//

import UIKit

class ViewController: UIViewController {

    let pageVC = ImageAssetsCollectionView()
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        pageVC.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        view.addSubview(pageVC)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            containerView.heightAnchor.constraint(equalToConstant: 500),
            
            pageVC.topAnchor.constraint(equalTo: containerView.topAnchor),
            pageVC.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            pageVC.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            pageVC.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }


}

