//
//  ViewController.swift
//  SideMenuSwift
//
//  Created by mac on 03/01/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myBarView:UIView!

    @IBOutlet weak var financialBar:UIView!
    @IBOutlet weak var initiativeBar:UIView!
    @IBOutlet weak var riskBar:UIView!
    @IBOutlet weak var customerSatisBar:UIView!
    @IBOutlet weak var operationalBar:UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()


         financialBar.setHeight(height:0,animateTime: 0.5)
         initiativeBar.setHeight(height:0,animateTime: 0.5)
         riskBar.setHeight(height:0,animateTime: 0.5)
         customerSatisBar.setHeight(height:0,animateTime: 0.5)
         operationalBar.setHeight(height:0,animateTime: 0.5)

         myBarView.isHidden = true
        
    }
    
    @IBAction func click(_ sender:UIButton){
        

        myBarView.isHidden = false
        
        financialBar.setHeight(height:(200*60)/100,animateTime: 1.5)
        initiativeBar.setHeight(height:(200*80)/100,animateTime: 1.5)
        riskBar.setHeight(height:(200*40)/100,animateTime: 1.5)
        customerSatisBar.setHeight(height:(200*30)/100,animateTime: 1.5)
        operationalBar.setHeight(height:(200*70)/100,animateTime: 1.5)
        
        let colorHeiht1 = (financialBar.frame.height * 100) / 100
        let colorHeiht2 = (initiativeBar.frame.height * 30) / 100
        let colorHeiht3 = (riskBar.frame.height * 30) / 100
        let colorHeiht4 = (customerSatisBar.frame.height * 30) / 100
        let colorHeiht5 = (operationalBar.frame.height * 30) / 100
        
        drawBar(myView: financialBar, barHeight: colorHeiht1,color:#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))
        drawBar(myView: initiativeBar, barHeight: colorHeiht2,color:#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        drawBar(myView: riskBar, barHeight: colorHeiht3,color:#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        drawBar(myView: customerSatisBar, barHeight: colorHeiht4,color:#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        drawBar(myView: operationalBar, barHeight: colorHeiht5,color:#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        
    }
    
    
    func drawBar(myView:UIView,barHeight:CGFloat ,color: UIColor? = .gray){
        
        let positionOfView = myView.convert(myView.bounds, to: self.view)
        let initialBound = CGRect(x: 0.0, y: myView.frame.height, width: myView.frame.width, height: 0)
        let finalBound = CGRect(x: 0.0, y: 0.0, width: myView.frame.width, height: barHeight)
        let a = CALayer()
        a.bounds = CGRect(x: 0, y: 0, width: myView.frame.width, height: barHeight)
        a.position = CGPoint(x: positionOfView.maxX, y: positionOfView.maxY)
        a.anchorPoint = CGPoint(x: 1, y: 1)
        a.backgroundColor = color?.cgColor
        view.layer.addSublayer(a)
        
        let anim = CABasicAnimation(keyPath: "bounds")
        anim.duration = 1.5
        anim.fromValue = initialBound
        anim.toValue = finalBound
        a.add(anim, forKey: "anim")
        
    }
    
}


extension UIView {
    func setHeight(height:CGFloat, animateTime:TimeInterval?=0.3) {
        if let cons = self.constraints.first(where: { $0.firstAttribute == .height && $0.relation == .equal }) {
            cons.constant = CGFloat(height)
        
            if let animateTime = animateTime {
                UIView.animate(withDuration: animateTime, animations:{
                    self.superview?.layoutIfNeeded()
                })
            }
            else {
                self.superview?.layoutIfNeeded()
            }
        }
    }
}



