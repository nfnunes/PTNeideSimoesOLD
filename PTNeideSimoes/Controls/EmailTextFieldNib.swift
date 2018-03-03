//
//  EmailTextFieldNib.swift
//  PTNeideSimoes
//
//  Created by Nuno Nunes on 03/03/2018.
//  Copyright © 2018 Nuno Nunes. All rights reserved.
//

import UIKit


class EmailTextFieldNib: UIControl {
    
    @IBOutlet var emailTextFieldNib: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){
        Bundle.main.loadNibNamed("EmailTextFieldNib", owner: self, options: nil)
        addSubview(emailTextFieldNib)
        emailTextFieldNib.frame = self.bounds
        emailTextFieldNib.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }


}
