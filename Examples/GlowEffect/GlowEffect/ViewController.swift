//
//  ViewController.swift
//  GlowEffect
//
//  Created by Vignesh on 18/07/17.
//  Copyright © 2017 Vigneshuvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sqView: UIView!
    @IBOutlet weak var errorAnimation: UIButton!
    @IBOutlet weak var glowButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAction(_ sender: Any) {
        glowButton.startWaving();
        errorAnimation.startWaving()
        self.sqView.startWaving();

    }

    @IBAction func errorAction(_ sender: Any) {
        errorAnimation.startWaving();
        glowButton.startWaving()
        self.sqView.startWaving();
    }
    
}

