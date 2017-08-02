//
//  UIView+Wave.swift
//  GlowEffect
//
//  Created by Vigneshuvi on 14/07/17.
//  Copyright © 2017 Uvi. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable extension UIView {
    
    @objc @IBInspectable public var enableWaveEffect:Bool {
        set {
            if newValue {
                
                self.startWaving()
            }
        }
        get {
            return self.enableWaveEffect;
        }
        
    }
    
    @objc public func startWavingWithRepeatCount(repeatCount:Float) {
        self.startWavingWithColor(color: UIColor.lightGray, repeatCount: repeatCount);
    }
    
    // Create a pulsing, Waving view based on this one.
    @objc  public func startWaving() {
        self.isOpaque = false;
        self.clipsToBounds = false;
        self.startWavingWithColor(color: UIColor.lightGray, repeatCount: 1);
    }
    
    // Stop Waving by removing the animation from the superview
    @objc public func stopWaving() {
        self.layer.removeAllAnimations();
    }
    
    @objc public func startWavingWithColor(color:UIColor, repeatCount:Float) {
        
        // Add Wave effect
        let borderLayer = CAShapeLayer()
        borderLayer.frame =  self.bounds;
        let circlePath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: 5.0)
        borderLayer.path = circlePath.cgPath
        borderLayer.fillColor = color.cgColor
        borderLayer.strokeColor = UIColor.clear.cgColor
        borderLayer.opacity = 0.3
        borderLayer.lineWidth = 20.0;
        
        // Start Transaction
        CATransaction.begin()
        
        // Scale Animation
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
        scaleAnimation.toValue = NSValue.init(caTransform3D: CATransform3DMakeScale(2.0, 2.0, 1));
        scaleAnimation.repeatCount = 2
        
        // Alpha Animation
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = [0.5];
        alphaAnimation.toValue = [0];
        alphaAnimation.repeatCount = 2
        
        // Group Animations
        let animation:CAAnimationGroup = CAAnimationGroup.init();
        animation.animations = [scaleAnimation, alphaAnimation];
        animation.duration = 2.0;
        animation.repeatCount = repeatCount;
        
        // Set the Timing function.
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut);
        
        // Callback function
        CATransaction.setCompletionBlock {
            self.layer.removeAllAnimations();
            borderLayer.backgroundColor = UIColor.clear.cgColor
            borderLayer.removeAllAnimations();
            borderLayer.removeFromSuperlayer();
        }
        borderLayer.add(animation, forKey: nil)
        self.layer.addSublayer(borderLayer);
        CATransaction.commit()
        
    }
    
    @objc public func rippleEffect() {
        
        self.isOpaque = true;
        self.clipsToBounds = true;
        
        // Start Transaction
        CATransaction.begin()
        
        // Ripple Effect
        let rippleAnimation = CATransition();
        rippleAnimation.delegate = self as? CAAnimationDelegate;
        rippleAnimation.duration = 1.5;
        rippleAnimation.fillMode = kCAFillModeRemoved;
        rippleAnimation.repeatCount = 1.0
        rippleAnimation.startProgress = 0.0;
        rippleAnimation.endProgress = 0.99;
        rippleAnimation.isRemovedOnCompletion = true;
        rippleAnimation.type =  "rippleEffect";
        
        // Set the Timing function.
        rippleAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut);
        
        // Callback function
        CATransaction.setCompletionBlock {
            self.layer.removeAllAnimations();
        }
        self.layer.add(rippleAnimation, forKey: nil)
        CATransaction.commit()
        
    }
    
}

    
