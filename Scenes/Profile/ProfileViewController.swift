//
//  profile.swift
//  demo_repeat
//
//  Created by Hoàng Võ on 05/02/2026.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private enum Section: Int, CaseIterable {
        case header = 0
        case posts = 1
    }
    
    private enum Const {
        static let itemsCount = 30
        static let column: CGFloat = 3
        static let spacing: CGFloat = 2
        static let inset: CGFloat = 0
    }
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = Const.spacing
        layout.minimumLineSpacing = Const.spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        print("DEBUG: Registering PostCell")
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseId)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.reuseId)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.frame = view.bounds
    }
}
extension ProfileViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {return 0}
        switch section {
        case .header:
            return 0
        case .posts:
            return Const.itemsCount
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseId, for: indexPath)
        as! PostCell
        cell.configure(text: "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {return UICollectionReusableView()}
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.reuseId, for: indexPath)
        return header
    }
}
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = Const.spacing * (Const.column - 1)
        let totalInset = Const.inset * 2
        let available = view.bounds.width - totalInset - totalSpacing
        let eachItems = available / Const.column
        return CGSize(width: eachItems, height: eachItems + 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let section = Section(rawValue: section) else {return .zero}
        switch section {
        case .header:
            return CGSize(width: view.bounds.width, height: 280)
        case .posts:
            return .zero
        }
    }
}
