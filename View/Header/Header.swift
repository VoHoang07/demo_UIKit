//
//  Header.swift
//  demo_repeat
//
//  Created by Hoàng Võ on 05/02/2026.
//

import UIKit

final class Header: UICollectionReusableView {
    
    static let reuseId = "header"
    
    private enum Const {
        static let spacing: CGFloat = 4
        static let itemsCount = 30
    }
    
    private var storiesView: UICollectionView!

    private let avatar = UIView()
    private let name = UILabel()
    private let stats = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupStoriesView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        avatar.backgroundColor = .gray
        avatar.clipsToBounds = true
        addSubview(avatar)
        
        name.text = "VoHoang07"
        name.font = .systemFont(ofSize: 16, weight: .bold)
        addSubview(name)
        
        stats.text = "20 posts.     100 Followers.     200 Following"
        stats.font = .italicSystemFont(ofSize: 13)
        addSubview(stats)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatar.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        avatar.layer.cornerRadius = 100 / 2
        
        name.frame = CGRect(x: 16, y: avatar.frame.maxY + 10, width: bounds.width, height: 20)
        
        stats.frame = CGRect(x: 16, y: name.frame.maxY + 10, width: bounds.width, height: 18)
        
        storiesView.frame = CGRect(x: 0, y: stats.frame.maxY + 15, width: bounds.width, height: 80)
    }
    private func setupStoriesView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Const.spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        storiesView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        storiesView.register(StoryCells.self, forCellWithReuseIdentifier: StoryCells.reuseId)
        storiesView.showsHorizontalScrollIndicator = false 
        
        storiesView.dataSource = self
        storiesView.delegate = self
        
        addSubview(storiesView)
    }
}

extension Header: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storiesView.dequeueReusableCell(withReuseIdentifier: StoryCells.reuseId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Const.itemsCount
    }
}
extension Header: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
