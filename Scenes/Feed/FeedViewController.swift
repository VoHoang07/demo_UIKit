//
//  feed.swift
//  demo_repeat
//
//  Created by Hoàng Võ on 05/02/2026.
//

import UIKit

final class FeedViewController: UIViewController {
    private enum Const {
        static let columns: CGFloat = 3
        static let spacing: CGFloat = 2
        static let inset: CGFloat = 0
        static let itemsCount = 30
    }
    
    private let post: [Int] = Array(0..<Const.itemsCount)
    
    private var feed: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        setupUI()
        updateState()
    }
    private func updateState() {
        if post.isEmpty {
            let label = UILabel()
            label.text = "No Post Yet"
            label.font = .systemFont(ofSize: 16, weight: .bold)
            label.textAlignment = .center
            feed.backgroundView = label
        } else {
            feed.backgroundView = nil
        }
    }
    private func setupUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Const.spacing
        layout.minimumInteritemSpacing = Const.spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        feed = UICollectionView(frame: .zero, collectionViewLayout: layout)
        feed.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseId)
        feed.dataSource = self
        feed.delegate = self
        
        view.addSubview(feed)
        feed.frame = view.bounds
        feed.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Const.itemsCount
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = feed.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) 
        as! PostCell
        cell.configure(text: "Post \(indexPath.row)")
        return cell
    }
}
extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = Const.spacing * (Const.columns - 1)
        let totalInset = Const.inset * 2
        let available = view.bounds.width - totalInset - totalSpacing
        let eachItems = available / Const.columns
        
        return CGSize(width: eachItems , height: eachItems + 15)
    }
}
