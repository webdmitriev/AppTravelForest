//
//  UIBuilder.swift
//  AppTravelForest
//
//  Created by Олег Дмитриев on 06.08.2024.
//

import UIKit

class UIBuilder {
    
    // primary var's
    lazy var container: CGFloat = 16
    
    func addLabel(text: String, fontS: CGFloat, fontW: UIFont.Weight, color: UIColor, lines: Int) -> UILabel {
        let txt = UILabel()
        
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.text = text
        txt.font = .systemFont(ofSize: fontS, weight: fontW)
        txt.textColor = color
        txt.numberOfLines = lines
        
        return txt
    }
    
    func addView() -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }
    
    func addImage(image: UIImage, brs: CGFloat) -> UIImageView {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = image
        img.layer.cornerRadius = brs
        img.layer.masksToBounds = true
        return img
    }
    
}
