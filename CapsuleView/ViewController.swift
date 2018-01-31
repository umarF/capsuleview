//
//  ViewController.swift
//  CapsuleView
//
//  Created by Umar Farooque on 1/24/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sampleView: CapsuleView!
    @IBOutlet weak var sampleView2: CapsuleView!
    @IBOutlet weak var sampleView3: CapsuleView!
    @IBOutlet weak var sampleView4: CapsuleView!
    @IBOutlet weak var sampleView5: CapsuleView!
    @IBOutlet weak var sampleView6: CapsuleView!
    @IBOutlet weak var sampleView7: CapsuleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sampleView.setupView()
        sampleView2.setupView()
        sampleView3.setupView()
        sampleView4.setupView()
        sampleView5.setupView()
        sampleView6.setupView()
        sampleView7.setupView()
        
        //MARK: Use for adding view dynamically
        
        /*
         let capsuleViewFrame = CGRect(x: 50, y: 200, width: 300, height: 300)
         let capsuleView = CapsuleView(placeholderText: "Address", contentText: "31st street,\nPark Avenue,\n 46/6,\n New York,\n USA", cardColor: UIColor(red: 0.075, green: 0.561, blue: 0.325, alpha: 1.00), textColor: UIColor.white, shadowColor: UIColor.darkGray, shadowOpacity: 9, shadowRadius: 9, cardRadius: 9, shadowOffset: CGSize(width: 0, height: 0), textAllignment: 1, showCross: false, viewFrame: capsuleViewFrame,placeHolderSize:4,titleSize: 3)
         self.view.addSubview(capsuleView)
         self.view.bringSubview(toFront: capsuleView)
         */
        
    }
    
}

