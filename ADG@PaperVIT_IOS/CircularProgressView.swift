//
//  CircularProgressView.swift
//  CleanyModal test
//
//  Created by Utkarsh Dixit on 26/6/21.
//

import Foundation
import UIKit

class CircularProgressView: UIView{
    
    //MARK:- Propertiese
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var fixedEndPoint = CGFloat(3 * Double.pi / 2)
    var endPoint = CGFloat(3 * Double.pi / 2) {
        didSet{
            endPoint = endPoint*CGFloat(3 * Double.pi / 2)
        }
    }
    var fillCircleColour = UIColor.secondarySystemFill
    var progressCircleColour = #colorLiteral(red: 0.3960784314, green: 0.1725490196, blue: 0.8745098039, alpha: 1)
    var innerCircleWidth = CGFloat(5)
    var outterCircleWidth = CGFloat(10)
    
    // MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        createCircularPath(fillColour: fillCircleColour, progressColour: progressCircleColour, innerWidth: innerCircleWidth, outterWidth: outterCircleWidth)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath(fillColour: fillCircleColour, progressColour: progressCircleColour, innerWidth: innerCircleWidth, outterWidth: outterCircleWidth)
    }
    
    //MARK:- Creating Circular Paths for Provided Specifications
    
    private func createCircularPath(fillColour: UIColor, progressColour: UIColor, innerWidth: CGFloat, outterWidth: CGFloat) {
        // created circularPath for circleLayer
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: startPoint, endAngle: fixedEndPoint, clockwise: true)
        // circleLayer path defined to circularPath
        circleLayer.path = circularPath.cgPath
        // ui edits
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = innerWidth
        circleLayer.strokeEnd = 1
        circleLayer.strokeColor = fillColour.cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
        // created circularProgressPath for progressLayer
        let circularProgressPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 80, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        // progressLayer path defined to circularProgressPath
        progressLayer.path = circularProgressPath.cgPath
        // ui edits
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = outterWidth
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = progressColour.cgColor
        // added progressLayer to layer
        layer.addSublayer(progressLayer)
    }
    
    //MARK:- Animation Method
    /// Call this from the ViewController to start animation
    
    func progressAnimation(duration: TimeInterval, value: CGFloat) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
