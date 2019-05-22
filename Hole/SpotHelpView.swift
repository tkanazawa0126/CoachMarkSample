//
//  SpotHelpView.swift
//  Hole

import UIKit

protocol ViewDelegate: class {
    func touched()
}

class SpotHelpView: UIView {

    weak var delegate: ViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 円の穴
    func makeHoleAt(point: CGPoint, radius: CGFloat) {
        let mask = CAShapeLayer()
        mask.fillRule = .evenOdd
        mask.fillColor = UIColor.black.cgColor
        
        let maskPath = UIBezierPath(rect: bounds)
        maskPath.move(to: point)
        maskPath.addArc(withCenter: point, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        mask.path = maskPath.cgPath
        layer.mask = mask
    }
    
    // 四角の穴
    func makeQuadrangle(rect: CGRect) {
        let mask = CAShapeLayer()
        mask.fillRule = .evenOdd
        mask.fillColor = UIColor.black.cgColor
        
        let maskPath = UIBezierPath(rect: bounds)
        maskPath.move(to: rect.origin)
        maskPath.addLine(to: CGPoint(x: rect.maxX, y: rect.origin.y))
        maskPath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        maskPath.addLine(to: CGPoint(x: rect.origin.x, y: rect.maxY))
        maskPath.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y))
        
        mask.path = maskPath.cgPath

        mask.add(animation, forKey: "circleAnim")
        layer.mask = mask
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.touched()
    }
    
}
