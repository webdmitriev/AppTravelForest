//
//  SuggestCell.swift
//  AppTravelForest
//
//  Created by Олег Дмитриев on 06.08.2024.
//

import UIKit

final class SuggestCell: UICollectionViewCell {
    
    static let reuseId: String = "SuggestCellID"
    
    private let uiBuilder = UIBuilder()
    
    private lazy var containerView: UIView = uiBuilder.addView()
    
    private lazy var postImage: UIImageView = uiBuilder.addImage(image: .image01, brs: 16)
    
    private lazy var postTitle: UILabel = uiBuilder.addLabel(text: "Nusa Pedina", fontS: 14, fontW: .regular, color: .appWhite, lines: 2)
    
    private lazy var postLocationIcon: UIImageView = uiBuilder.addImage(image: .iconLocationWhite, brs: 0)
    
    private lazy var postLocation: UILabel = uiBuilder.addLabel(text: "Bali, Indonesia", fontS: 10, fontW: .regular, color: .appWhite, lines: 1)
    
    private lazy var ratingBlock: UIView = uiBuilder.addView()
    
    private lazy var ratingBlockIcon: UIImageView = uiBuilder.addImage(image: .iconStar, brs: 0)
    
    private lazy var ratingBlockText: UILabel = uiBuilder.addLabel(text: "4.5", fontS: 10, fontW: .regular, color: .appWhite, lines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(item: SuggestData) {
        postImage.image = UIImage(named: item.image)
        postTitle.text = item.title
        postLocation.text = item.location
        ratingBlockText.text = item.rating
        
        self.setupSelf()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupSelf() {
        self.backgroundColor = .clear
        
        self.ratingBlock.backgroundColor = .appBlack
        self.ratingBlock.alpha = 0.4
        self.ratingBlock.layer.cornerRadius = 6
        
        self.addSubview(self.containerView)
        self.containerView.addSubviews(postImage, ratingBlock, ratingBlockText, ratingBlockIcon, postTitle, postLocationIcon, postLocation)
        
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            postImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            postImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            postImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            postImage.heightAnchor.constraint(equalToConstant: 160),
            
            ratingBlock.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            ratingBlock.leadingAnchor.constraint(equalTo: ratingBlockText.leadingAnchor, constant: -4),
            ratingBlock.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            ratingBlock.bottomAnchor.constraint(equalTo: ratingBlockIcon.bottomAnchor, constant: 4),
            
            ratingBlockIcon.topAnchor.constraint(equalTo: ratingBlock.topAnchor, constant: 4),
            ratingBlockIcon.trailingAnchor.constraint(equalTo: ratingBlock.trailingAnchor, constant: -4),
            ratingBlockIcon.widthAnchor.constraint(equalToConstant: 12),
            ratingBlockIcon.heightAnchor.constraint(equalToConstant: 12),
            
            ratingBlockText.topAnchor.constraint(equalTo: ratingBlock.topAnchor, constant: 4),
            ratingBlockText.trailingAnchor.constraint(equalTo: ratingBlockIcon.leadingAnchor, constant: -4),
            ratingBlockText.heightAnchor.constraint(equalToConstant: 12),
            
            postTitle.bottomAnchor.constraint(equalTo: postLocationIcon.topAnchor, constant: -5),
            postTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            postTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            postLocationIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            postLocationIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            postLocationIcon.widthAnchor.constraint(equalToConstant: 12),
            postLocationIcon.heightAnchor.constraint(equalToConstant: 12),
            
            postLocation.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            postLocation.leadingAnchor.constraint(equalTo: postLocationIcon.trailingAnchor, constant: 4),
            postLocation.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            postLocation.heightAnchor.constraint(equalToConstant: 12),
        ])
    }
    
}
