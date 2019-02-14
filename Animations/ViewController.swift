//
//  ViewController.swift
//  TestApp
//
//  Created by anges on 09.02.19.
//  Copyright © 2019 anges. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var Waiter: UIActivityIndicatorView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainView.backgroundColor = UIColor.init(red: 0.4, green: 0.7, blue: 1.0, alpha: 1.0)
        MainView.layer.cornerRadius = 25
        
        //Wait Layer
        TopView.backgroundColor = UIColor.init(red: 1.0, green: 0.43, blue: 0.46, alpha: 1.0)
        TopView.layer.cornerRadius = 25
        TopView.alpha = 0.8

        Waiter.color = UIColor.black
        Waiter.startAnimating()

        //To activate the layer, 'withTimeInterval' must be changed to >0
        Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { _ in
            self.Waiter.stopAnimating()
            self.Waiter.hidesWhenStopped = true
            self.TopView.layer.zPosition = 0
            self.TopView.alpha = 0.0
        }
        
        
        //#################################################
        //Top Layer
        //#################################################
        let x1_1:CGFloat = 150
        let y1_1:CGFloat = 120
        
        //Outer circle
        let width1_1: CGFloat = 100
        let height1_1: CGFloat = 100
        
        //Middle circle
        let width1_2: CGFloat = 70
        let height1_2: CGFloat = 70
        
        //Inner circle
        let width1_3: CGFloat = 40
        let height1_3: CGFloat = 40
        
        let margin: CGFloat = 14
        
        var animation = CABasicAnimation()
        
        //Outer circle
        let layer1_1 = CAShapeLayer()
        layer1_1.path = UIBezierPath(roundedRect: CGRect(x: x1_1, y: y1_1, width: width1_1, height: height1_1), cornerRadius: 35).cgPath
        layer1_1.strokeColor = UIColor.blue.cgColor
        layer1_1.strokeStart = 0.0
        layer1_1.strokeEnd = 0.0
        layer1_1.lineWidth = 1
        layer1_1.autoreverses = false
        layer1_1.fillColor = UIColor.white.cgColor
        MainView.layer.addSublayer(layer1_1)
        
        //Middle circle
        let layer1_2 = CAShapeLayer()
        layer1_2.path = UIBezierPath(roundedRect: CGRect(x: x1_1+margin, y: y1_1+margin, width: width1_2, height: height1_2), cornerRadius: 35).cgPath
        layer1_2.strokeColor = UIColor.red.cgColor
        layer1_2.strokeStart = 0.0
        layer1_2.strokeEnd = 0.0
        layer1_2.lineWidth = 1
        layer1_2.fillColor = UIColor.white.cgColor
        MainView.layer.addSublayer(layer1_2)
        
        //Inner circle
        let layer1_3 = CAShapeLayer()
        layer1_3.path = UIBezierPath(roundedRect: CGRect(x: x1_1+margin*2, y: y1_1+margin*2, width: width1_3, height: height1_3), cornerRadius: 35).cgPath
        layer1_3.strokeColor = UIColor.black.cgColor
        layer1_3.strokeStart = 0.0
        layer1_3.strokeEnd = 0.0
        layer1_3.lineWidth = 1
        layer1_3.fillColor = UIColor.white.cgColor
        MainView.layer.addSublayer(layer1_3)
        
        //Animation for outer circle
        var val1_1:CGFloat = 0
        var val1_2:CGFloat = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            
            if(val1_1 <= 0.1)
            {
                animation = CABasicAnimation(keyPath: "lineWidth")
                animation.fillMode = .both
                animation.fromValue = 1
                animation.toValue = 35
                animation.duration = 1
                animation.autoreverses = false
                animation.repeatCount = 1
                layer1_1.add(animation, forKey: "line")
            }
            
            if(layer1_1.strokeEnd <= 1.0 || val1_1 == -0.2)
            {
                layer1_1.strokeColor = UIColor.blue.cgColor
                layer1_1.lineWidth = 6
                val1_1 += 0.1
                val1_2 = 0.0
                layer1_1.strokeEnd = val1_1
            }
            
            if(layer1_1.strokeEnd >= 1.0)
            {
                val1_2 += 0.1
                layer1_1.strokeStart = val1_2
                
                if(layer1_1.strokeStart >= 0.95)
                {
                    layer1_1.strokeColor = UIColor.white.cgColor
                    layer1_1.lineWidth = 1
                }
                
                if(layer1_1.strokeStart >= 1.0)
                {
                    layer1_1.strokeStart = 0.0
                    layer1_1.strokeEnd = 0.0
                    val1_2 = 0.0
                    val1_1 = -0.1
                }
            }
        }
        
        //Animation fpr middle circle
        var val2_1:CGFloat = 0
        var val2_2:CGFloat = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            
            if(val2_1 <= 0.1)
            {
                animation = CABasicAnimation(keyPath: "lineWidth")
                animation.fillMode = .both
                animation.fromValue = 1
                animation.toValue = 15
                animation.duration = 1
                animation.autoreverses = false
                animation.repeatCount = 1
                layer1_2.add(animation, forKey: "line")
            }
            
            if(layer1_2.strokeEnd <= 1.0 || val2_1 == -0.2)
            {
                layer1_2.strokeColor = UIColor.red.cgColor
                layer1_2.lineWidth = 6
                val2_1 += 0.1
                val2_2 = 0.0
                layer1_2.strokeEnd = val2_1
            }
            
            if(layer1_2.strokeEnd >= 1.0)
            {
                val2_2 += 0.1
                layer1_2.strokeStart = val2_2
                
                if(layer1_2.strokeStart >= 0.95)
                {
                    layer1_2.strokeColor = UIColor.white.cgColor
                    layer1_2.lineWidth = 1
                }
                
                if(layer1_2.strokeStart >= 1.0)
                {
                    layer1_2.strokeStart = 0.0
                    layer1_2.strokeEnd = 0.0
                    val2_2 = 0.0
                    val2_1 = -0.1
                }
            }
        }
        
        //Animation for inner circle
        var val3_1:CGFloat = 0
        var val3_2:CGFloat = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            
            if(val3_1 <= 0.1)
            {
                animation = CABasicAnimation(keyPath: "lineWidth")
                animation.fillMode = .both
                animation.fromValue = 1
                animation.toValue = 20
                animation.duration = 1
                animation.autoreverses = false
                animation.repeatCount = 1
                layer1_3.add(animation, forKey: "line")
            }
            
            if(layer1_3.strokeEnd <= 1.0 || val3_1 == -0.2)
            {
                layer1_3.strokeColor = UIColor.green.cgColor
                layer1_3.lineWidth = 6
                val3_1 += 0.1
                val3_2 = 0.0
                layer1_3.strokeEnd = val3_1
            }
            
            if(layer1_3.strokeEnd >= 1.0)
            {
                val3_2 += 0.1
                layer1_3.strokeStart = val3_2
                
                if(layer1_3.strokeStart >= 0.95)
                {
                    layer1_3.strokeColor = UIColor.white.cgColor
                    layer1_3.lineWidth = 1
                }
                
                if(layer1_3.strokeStart >= 1.0)
                {
                    layer1_3.strokeStart = 0.0
                    layer1_3.strokeEnd = 0.0
                    val3_2 = 0.0
                    val3_1 = -0.1
                }
            }
        }
        
        //#################################################
        //Middle Layer
        //#################################################
        
        //Top left layer
        let x1:CGFloat = 80
        let y1:CGFloat = 270
        
        //Top right layer
        let x2:CGFloat = 220
        let y2:CGFloat = 270
        
        //Bottom left layer
        let x3:CGFloat = 80
        let y3:CGFloat = 440
   
        //Bottom right layer
        let x4:CGFloat = 220
        let y4:CGFloat = 440
        
        //Size of layers
        let width:CGFloat = 100
        let height:CGFloat = 100
        
        img1.layer.zPosition = 1
        img2.layer.zPosition = 1
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.img1.transform = self.img1.transform.rotated(by: CGFloat(Double.pi/12))
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.img2.transform = self.img2.transform.rotated(by: CGFloat(Double.pi / -12))
        }
        
        //#################################################
        //Top left layer
        //#################################################
        let layer1 = CAShapeLayer()
        layer1.path = UIBezierPath(rect: CGRect(x: x1, y: y1, width: width, height: height)).cgPath
        layer1.strokeColor = UIColor.red.cgColor
        layer1.lineWidth = 3
        layer1.fillColor = UIColor.lightText.cgColor
        layer1.lineDashPattern = [8, 6]
        MainView.layer.addSublayer(layer1)
        
        animation = CABasicAnimation(keyPath: "lineDashPhase")
        animation.fromValue = 0
        animation.toValue = layer1.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
        animation.duration = 1
        animation.autoreverses = false
        animation.repeatCount = .infinity
        layer1.add(animation, forKey: "line")
        
        
        //#################################################
        //Top right layer
        //#################################################
        let layer2 = CAShapeLayer()
        layer2.path = UIBezierPath(ovalIn: CGRect(x: x2, y: y2, width: width, height: height)).cgPath
        layer2.strokeColor = UIColor.blue.cgColor
        layer2.lineWidth = 3
        layer2.fillColor = UIColor.lightText.cgColor
        layer2.contents = UIImage(named: "wait")?.cgImage
        layer2.lineDashPattern = [8, 8]
        MainView.layer.addSublayer(layer2)
        
        animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        animation.autoreverses = false
        animation.repeatCount = .infinity
        layer2.add(animation, forKey: "line")
        
        
        //#################################################
        //Bottom left layer
        //#################################################
        let layer3 = CAShapeLayer()
        layer3.path = UIBezierPath(roundedRect: CGRect(x: x3, y: y3, width: width, height: height), cornerRadius: 20).cgPath
        layer3.strokeColor = UIColor.green.cgColor
        layer3.lineWidth = 4
        layer3.fillColor = UIColor.lightText.cgColor
        MainView.layer.addSublayer(layer3)
        
        animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.autoreverses = false
        animation.repeatCount = .infinity
        layer3.add(animation, forKey: "line")
        
        
        //#################################################
        //Bottom right layer
        //#################################################
        let layer4 = CAShapeLayer()
        layer4.path = UIBezierPath(rect: CGRect(x: x4, y: y4, width: width, height: height)).cgPath
        layer4.strokeColor = UIColor.black.cgColor
        layer4.lineWidth = 3
        layer4.fillColor = UIColor.lightText.cgColor
        MainView.layer.addSublayer(layer4)
        
        animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 4
        animation.autoreverses = false
        animation.repeatCount = .infinity
        layer4.add(animation, forKey: "line")
        
        
        
        //#################################################
        //Bottom Layer
        //#################################################
        let x5:CGFloat = 150
        let y5:CGFloat = 580
        
        let width5_1: CGFloat = 100
        let height5_1: CGFloat = 100
        
        let width5_2: CGFloat = 70
        let height5_2: CGFloat = 70
        
        let width5_3: CGFloat = 40
        let height5_3: CGFloat = 40
        
        
        let layer5 = CAShapeLayer()
        layer5.path = UIBezierPath(roundedRect: CGRect(x: x5, y: y5, width: width5_1, height: height5_1), cornerRadius: 35).cgPath
        layer5.strokeColor = UIColor.black.cgColor
        layer5.lineWidth = 3
        layer5.fillColor = UIColor.white.cgColor
        MainView.layer.addSublayer(layer5)
        
        animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        animation.autoreverses = true
        animation.repeatCount = .infinity
        layer5.add(animation, forKey: "line")
        
        
        let layer6 = CAShapeLayer()
        layer6.path = UIBezierPath(roundedRect: CGRect(x: x5+margin, y: y5+margin, width: width5_2, height: height5_2), cornerRadius: 25).cgPath
        layer6.strokeColor = UIColor.red.cgColor
        layer6.lineWidth = 3
        layer6.fillColor = UIColor.white.cgColor
        MainView.layer.addSublayer(layer6)
        
        animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        animation.autoreverses = true
        animation.repeatCount = .infinity
        layer6.add(animation, forKey: "line")
        
        
        let layer7 = CAShapeLayer()
        layer7.path = UIBezierPath(roundedRect: CGRect(x: x5+margin*2, y: y5+margin*2, width: width5_3, height: height5_3), cornerRadius: 20).cgPath
        layer7.strokeColor = UIColor.blue.cgColor
        layer7.lineWidth = 3
        layer7.fillColor = UIColor.white.cgColor
        MainView.layer.addSublayer(layer7)
        
        animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fillMode = .both
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        animation.autoreverses = true
        animation.repeatCount = .infinity
        layer7.add(animation, forKey: "line")
    }
}

