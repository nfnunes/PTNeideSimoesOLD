//
//  NameTextFieldNib.swift
//  PTNeideSimoes
//
//  Created by Nuno Nunes on 04/03/2018.
//  Copyright © 2018 Nuno Nunes. All rights reserved.
//

import UIKit

@IBDesignable

class NameTextFieldNib: UIControl {

    @IBOutlet var nameTextFieldNib: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var contentView: UIView?
    //@IBInspectable var nibName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup(){
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView?{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "NameTextFieldNib", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }
    
//    public override var placeholder: String? {
//        didSet {
//            let placeholderStr = placeholder ?? ""
//            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSForegroundColorAttributeName: placeholderColor])
//        }
//    }
//
//    @IBInspectable public var placeholderColor: UIColor = .red {
//        didSet {
//            let placeholderStr = placeholder ?? ""
//            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSForegroundColorAttributeName: placeholderColor])
//        }
//    }

}
