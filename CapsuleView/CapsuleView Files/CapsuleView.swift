//
//  CapsuleView.swift
//  CapsuleView
//
//  Created by Umar Farooque on 1/24/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

@IBDesignable
class CapsuleView: UIView {

    //MARK:IBOutlets
    @IBInspectable var holderTextSize:Int = 0
    @IBInspectable var contentTextSize:Int = 0
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var mainContent: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var capsuleViewBG: UIView!
    
    //MARK: Other variables
    var placeholderAllignment = 0
    var contentAllignment = 0
    var placeHolderNOL = 0
    var contentNOL = 0
    let nibName :String? =  "CapsuleView"
    var contentView : UIView?
    
    //MARK:Show cross button
    @IBInspectable var showCross: Bool = true {
        didSet {
            self.closeButton.isHidden = !showCross
        }
    }
    
    //MARK:Placeholder Text Allignment
    @IBInspectable var placeTextAllign: Int = 0 {
        didSet {
            self.placeholderAllignment = placeTextAllign
        }
    }
    //MARK:Main content Text Allignment
    @IBInspectable var contentTextAllign: Int = 0 {
        didSet {
            self.contentAllignment = contentTextAllign
        }
    }
    
    //MARK:Placeholder Text
    @IBInspectable var placeHoldText: String = "" {
        didSet {
            self.placeholderLabel.text! = placeHoldText
        }
    }
    
    //MARK:Content Text
    @IBInspectable var contentText: String  = "" {
        didSet {
            self.mainContent.text! = contentText
        }
    }
    
    //MARK:Background Color
    @IBInspectable var bgColor: UIColor? = UIColor.clear {
        didSet {
            self.backgroundColor = bgColor!
        }
    }
    
    //MARK:TextAllignment Enum
    enum TextAllignment: Int {
        case left
        case right
        case center
    }

    //MARK:Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    
    //MARK: Custom init method
    init(placeholderText:String, contentText: String, cardColor:UIColor, textColor: UIColor, shadowColor: UIColor, shadowOpacity: Float, shadowRadius: Double, cardRadius: Double,shadowOffset: CGSize,textAllignment:Int,showCross: Bool,viewFrame: CGRect,placeHolderSize:Int,titleSize: Int) {
        super.init(frame: viewFrame)
        xibSetup()
        self.backgroundColor = cardColor
        self.mainContent.textColor = textColor
        self.placeholderLabel.textColor = textColor
        self.contentText = contentText
        self.placeHoldText = placeholderText
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset =  shadowOffset
        self.cornerRadius = cardRadius
        self.shadowOpacity = shadowOpacity
        self.contentAllignment = textAllignment
        self.placeholderAllignment = textAllignment
        self.closeButton.isHidden = !showCross
        self.holderTextSize = placeHolderSize
        self.contentTextSize = titleSize
        setAllignment()
        self.setupView()
        
    }
    
    
    func xibSetup() {
        contentView = loadViewFromNib()
        contentView!.frame = self.bounds
        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.setupView()
        self.addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }

    //MARK: Helper Function to update view in storyboard
    override func prepareForInterfaceBuilder() {
        placeholderLabel.font = FontType.getFont(rawValue: holderTextSize)
        mainContent.font = FontType2.getFont(rawValue: contentTextSize)
        self.placeholderLabel.text = placeHoldText
        self.mainContent.text = contentText
        self.setupView()
    }
    
    //MARK: Helper Function to setup view
    func setupView(){
        self.placeholderLabel.text = placeHoldText
        self.mainContent.text = contentText
        self.placeholderLabel.numberOfLines = placeHolderNOL
        self.mainContent.numberOfLines = contentNOL
        placeholderLabel.font = FontType.getFont(rawValue: holderTextSize)
        mainContent.font = FontType2.getFont(rawValue: contentTextSize)
        self.placeholderLabel.text = placeHoldText
        self.mainContent.text = contentText
        setAllignment()
        self.updateConstraints()
        self.layoutIfNeeded()
        
    }

    //MARK: Helper Function to set dynamic view
    func setupViewDynamic(placeholderText:String, contentText: String, cardColor:UIColor, textColor: UIColor, shadowColor: UIColor, shadowOpacity: Float, shadowRadius: Double, cardRadius: Double,shadowOffset: CGSize,textAllignment:Int,showCross: Bool,placeHolderSize:Int,titleSize: Int){
        self.backgroundColor = cardColor
        self.mainContent.textColor = textColor
        self.placeholderLabel.textColor = textColor
        self.contentText = contentText
        self.placeHoldText = placeholderText
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOffset =  shadowOffset
        self.cornerRadius = cardRadius
        self.shadowOpacity = shadowOpacity
        self.contentAllignment = textAllignment
        self.placeholderAllignment = textAllignment
        self.closeButton.isHidden = !showCross
        self.holderTextSize = placeHolderSize
        self.contentTextSize = titleSize
        self.setupView()
    }
    //MARK: Function to set text allignment
    func setAllignment(){
        switch contentAllignment {
        case 0:
            mainContent.textAlignment = .left
        case 1:
            mainContent.textAlignment = .right
        case 2:
            mainContent.textAlignment = .center
        default:
            mainContent.textAlignment = .left
        }
        switch placeholderAllignment {
        case 0:
            placeholderLabel.textAlignment = .left
        case 1:
            placeholderLabel.textAlignment = .right
        case 2:
            placeholderLabel.textAlignment = .center
        default:
            placeholderLabel.textAlignment = .left
        }
    }
    
}

extension CapsuleView {
    
    //MARK: Layer's corner radius
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    //MARK: The width of the layer's border, inset from the layer bounds. The border is composited above the layer's content and sublayers and includes the effects of the `cornerRadius' property. Defaults to zero. Animatable.
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    //MARK: The color of the layer's border. Defaults to opaque black. Colors created from tiled patterns are supported. Animatable.
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    //MARK: The color of the shadow. Defaults to opaque black. Colors created from patterns are currently NOT supported. Animatable.
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    //MARK: The opacity of the shadow. Defaults to 0. Specifying a value outside the [0,1] range will give undefined results. Animatable.
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    //MARK: The shadow offset. Defaults to (0, -3). Animatable.
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    //MARK: The blur radius used to create the shadow. Defaults to 3. Animatable.
    @IBInspectable var shadowRadius: Double {
        get {
            return Double(self.layer.shadowRadius)
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }
    
    //MARK:Content Font size
    enum FontType2: Int {
        case mini = 0, small, medium, def, large, huge
        
        var contentHolderFont: UIFont {
            switch self {
            case .mini:
                return UIFont.systemFont(ofSize: 18, weight: .heavy)
            case .small:
                return UIFont.systemFont(ofSize: 25, weight: .heavy)
            case .medium:
                return UIFont.systemFont(ofSize: 30, weight: .heavy)
            case .def:
                return UIFont.systemFont(ofSize: 35, weight: .heavy)
            case .large:
                return UIFont.systemFont(ofSize: 40, weight: .heavy)
            case .huge:
                return UIFont.systemFont(ofSize: 45, weight: .heavy)
            }
        }
        
        
        static func getFont(rawValue: Int) -> UIFont  {
            if let fontType2 = FontType2(rawValue: rawValue) {
                return fontType2.contentHolderFont
            }
            return FontType2.mini.contentHolderFont
        }
    }
    
    //MARK:Placeholder Font size
    enum FontType: Int {
        case mini = 0, small, medium, def, large, huge
        
        var placeHolderFont: UIFont {
            switch self {
            case .mini:
                return UIFont.systemFont(ofSize: 8, weight: .heavy)
            case .small:
                return UIFont.systemFont(ofSize: 11, weight: .heavy)
            case .medium:
                return UIFont.systemFont(ofSize: 15, weight: .heavy)
            case .def:
                return UIFont.systemFont(ofSize: 20, weight: .heavy)
            case .large:
                return UIFont.systemFont(ofSize: 25, weight: .heavy)
            case .huge:
                return UIFont.systemFont(ofSize: 30, weight: .heavy)
            }
        }
        
        
        static func getFont(rawValue: Int) -> UIFont  {
            if let fontType = FontType(rawValue: rawValue) {
                return fontType.placeHolderFont
            }
            return FontType.mini.placeHolderFont
        }
    }
    
    
}


