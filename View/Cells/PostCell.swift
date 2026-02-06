//
//  postcell.swift
//  demo_repeat
//
//  Created by Hoàng Võ on 05/02/2026.
//

import UIKit

final class PostCell: UICollectionViewCell {
    
    static let reuseId = "PostCell"
    
    private let square = UIView()
    private let captionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        square.backgroundColor = .lightGray
        contentView.addSubview(square)
        
        captionLabel.text = "This is a post"
        contentView.addSubview(captionLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        square.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height - 20)
        captionLabel.frame = CGRect(x: 8, y: square.frame.maxY + 5, width: contentView.bounds.width, height: 15)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        captionLabel.text = nil
    }
    
    func configure(text: String) {
        captionLabel.text = text
    }
}
