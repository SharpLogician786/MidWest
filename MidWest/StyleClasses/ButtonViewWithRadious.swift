//
//  ButtonViewWithRadious.swift
//  RiyoWork
//
//  Created by MacBook Pro on 04/03/2023.
//

import UIKit

class ButtonViewWithRadious: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    /*
     // Method: init(frame: CGRect)
     // Description: Use method to validate email format
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /*
     // Method: init?(coder aDecoder: NSCoder)
     // Description: Use method to validate email format
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    /*
     // Method: setupView()
     // Description: Use method to setupView
     */
    func setupView() -> Void {
        self.layer.cornerRadius = 24
        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 4
    }
    
}
