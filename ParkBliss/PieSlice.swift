////
////  PieSlice.swift
////  ParkBliss
////
////  Created by baobaollf on 4/18/22.
////
//
//import SwiftUI
//import UIKit
//
//class PieSlice: UIView {
//
//    override func draw(_ rect: CGRect) {
//
//        drawSlice(rect, startPercent: 0, endPercent: 50, color: .green)
//        drawSlice(rect, startPercent: 50, endPercent: 75, color: .red)
//    }
//
//    private func drawSlice(_ rect: CGRect, startPercent: CGFloat, endPercent: CGFloat, color: UIColor) {
//        let center = CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
//        let radius = min(rect.width, rect.height) / 2
//        let startAngle = startPercent / 100 * CGFloat.pi * 2 - CGFloat.pi
//        let endAngle = endPercent / 100 * CGFloat.pi * 2 - CGFloat.pi
//        let path = UIBezierPath()
//        path.move(to: center)
//        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//        path.close()
//        color.setFill()
//        path.fill()
//    }
//}
//
////struct PieSlice_Previews: PreviewProvider {
////    static var previews: some View {
////        PieSlice()
////    }
////}
