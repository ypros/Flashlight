//
//  ViewController.swift
//  Flashlight
//
//  Created by YURY PROSVIRNIN on 01.03.2021.
//

import UIKit

class ViewController: UIViewController {

    var lightIsOn = true
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /// Changes view background color
    fileprivate func updateUI() {
        view.backgroundColor = lightIsOn ? .white : .black
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightIsOn.toggle()
        updateUI()
    }
    
}

