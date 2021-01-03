//
//  LoadingView.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    // MARK: - Properties
    
    var size: CGSize?
    var startPosition: CGPoint?
    let iconCount = 4
    var shouldAnimate = false {
        willSet {
            if newValue {
                self.animateShow(0)
            }
            else {
                for subview in self.subviews {
                    subview.alpha = 0
                }
            }
        }
    }
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.calculateIconSize()
        self.calculateIconStartPosition()
        self.addIcons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Setup
    
    private func calculateIconSize() {
        let width = self.frame.width*0.1
        let height = width*1.25
        
        self.size = CGSize(width: width, height: height)
    }
    
    private func calculateIconStartPosition() {
        if let size = self.size {
            let halfWidth = self.frame.width*0.5
            let halfHeight = self.frame.height*0.5
            let halfCount = CGFloat(Double(self.iconCount)*0.5)
            let x = halfWidth - (size.width*halfCount)
            let y = halfHeight - (size.height*0.5)
            
            self.startPosition = CGPoint(x: x, y: y)
        }
    }
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func addIcons() {
        if let size = self.size, let origin = self.startPosition {
            var currentIconOrigin = CGPoint(x: origin.x, y: origin.y)
            
            for _ in 0..<self.iconCount {
                let imageView = UIImageView(image: ImageHelper.icon.image)
                imageView.frame.size = size
                imageView.frame.origin = CGPoint(x: currentIconOrigin.x, y: currentIconOrigin.y)
                imageView.alpha = 0
                
                self.addSubview(imageView)
                
                currentIconOrigin.x += size.width
            }
        }
    }
    
    func startAnimation() {
        self.shouldAnimate = true
    }
    
    func stopAnimation() {
        self.shouldAnimate = false
    }
    
    private func animateShow(_ index: Int) {
        if index < self.subviews.count {
            UIView.animate(withDuration: 0.3, animations: {
                self.subviews[index].alpha = 1
            }) { (finished) in
                self.animateShow(index+1)
            }
        }
        else {
            self.animateHide(self.iconCount-1)
        }
    }
    
    private func animateHide(_ index: Int) {
        if index >= 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.subviews[index].alpha = 0
            }) { (finished) in
                self.animateHide(index-1)
            }
        }
        else {
            self.animateShow(0)
        }
    }
}
