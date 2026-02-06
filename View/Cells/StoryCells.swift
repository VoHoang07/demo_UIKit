//
//  StoryCells.swift
//  demo_repeat
//
//  Created by Hoàng Võ on 05/02/2026.
//

import UIKit

final class StoryCells: UICollectionViewCell {
    
    static let reuseId = "StoryCells"
    private let circle = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        circle.backgroundColor = .lightGray
        circle.clipsToBounds = true
        addSubview(circle)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        circle.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        circle.layer.cornerRadius = 40
    }
}
