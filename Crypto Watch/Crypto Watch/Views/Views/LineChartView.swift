//
//  LineChartView.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 9.05.2024.
//

import UIKit

class LineChartView: UIView {
    
    // MARK: - Properties
    private var sparkline: [Double] = []
    
    private var lineColor: UIColor = .label
    
    // MARK: - UI Components
    private var popupView: UIView?
    
    private var xOffset: CGFloat {
        return (self.bounds.width - 32) / CGFloat(sparkline.count - 1)
    }
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLongPressGesture()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Drawing line method
    override func draw(_ rect: CGRect) {
        guard sparkline.count > 1 else { return }
        let path = UIBezierPath()
        let maxVal = sparkline.max() ?? 0
        let minVal = sparkline.min() ?? 0
        let range = maxVal - minVal
        let scaleFactor = range != 0 ? (rect.height - 32) / CGFloat(range) : 0
        let xOffset = (rect.width - 32) / CGFloat(sparkline.count - 1)
        
        for (index, value) in sparkline.enumerated() {
            let x = xOffset * CGFloat(index) + 16
            let y = scaleFactor * CGFloat(value - minVal) + 16
            if index == 0 {
                path.move(to: CGPoint(x: x, y: rect.height - y))
            } else {
                path.addLine(to: CGPoint(x: x, y: rect.height - y))
            }
        }
        
        lineColor.setStroke()
        path.lineWidth = 2
        path.stroke()
    }
    
    // MARK: - Public Methods
    public func setSparklineData(_ data: [String]) {
        self.sparkline = data.compactMap { Double($0) }
        self.setNeedsDisplay()
    }
    
    public func configure(lineColor: UIColor) {
        self.lineColor = lineColor
    }
    
    // MARK: - Private Methods
    private func setupLongPressGesture() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gesture:)))
        self.addGestureRecognizer(longPressRecognizer)
    }
    
    private func updatePopup(location: CGPoint) {
        if let closestIndex = indexForLocation(location) {
            let value = sparkline[closestIndex]
            hidePopup()
            showPopup(at: location, withValue: value)
        } else {
            hidePopup()
        }
    }
    
    private func indexForLocation(_ location: CGPoint) -> Int? {
        let index = Int((location.x - 16) / xOffset)
        return index >= 0 && index < sparkline.count ? index : nil
    }
    
    private func showPopup(at location: CGPoint, withValue value: Double) {
        if popupView == nil {
            popupView = UIView(frame: CGRect(x: 0, y: 0, width: 152, height: 50))
            popupView?.backgroundColor = .systemBackground
            popupView?.layer.cornerRadius = 10
            popupView?.layer.shadowOpacity = 0.3
            popupView?.layer.shadowRadius = 5
            popupView?.layer.zPosition = 1
        }
        let valueLabel = UILabel(frame: popupView!.bounds)
        valueLabel.text = String(format: "$%.8f", value)
        valueLabel.textAlignment = .center
        popupView?.addSubview(valueLabel)
        
        var xPosition = location.x - (popupView!.bounds.width / 2)
        var yPosition = location.y - popupView!.bounds.height - 10
        
        xPosition = max(xPosition, -16) // Left margin
        xPosition = min(xPosition, UIScreen.main.bounds.width - popupView!.bounds.width - 16) // Right margin
        yPosition = max(yPosition, -64) // Top margin
        
        popupView?.frame.origin = CGPoint(x: xPosition, y: yPosition)
        
        if let popupView = popupView, popupView.superview == nil {
            self.addSubview(popupView)
        }
    }

    private func hidePopup() {
        popupView?.subviews.forEach { $0.removeFromSuperview() }
        popupView?.removeFromSuperview()
        popupView = nil
    }
    
    // MARK: - Objective Methods
    @objc private func handleLongPress(gesture: UILongPressGestureRecognizer) {
        let location = gesture.location(in: self)
        
        switch gesture.state {
        case .began:
            updatePopup(location: location)
        case .changed:
            updatePopup(location: location)
        case .ended:
            hidePopup()
        default:
            break
        }
    }
    
}
