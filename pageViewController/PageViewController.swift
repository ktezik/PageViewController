//
//  PageViewController.swift
//  pageViewController
//
//  Created by Иван Гришин on 16.08.2022.
//

import UIKit

/// Коллекция с отступами для представления типа Page где видно предыдущую и следующие страницы
/// скролл останавливается в центре каждой ячейки
final class ImageAssetsCollectionView: UIView {
    
    // MARK: - Private Properties
    
    private let colors: [UIColor] = [.blue, .red, .green, .brown]
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = CenteredScrollCollectionViewLayout()
        collectionViewLayout.minimumLineSpacing = 16
        collectionViewLayout.minimumInteritemSpacing = 16
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 112, height: 400)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 56, bottom: 0, right: 56)
        collectionView.contentOffset = CGPoint(x: -56, y: 0)
        return collectionView
    }()
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UICollectionViewDataSource

extension ImageAssetsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    
}
