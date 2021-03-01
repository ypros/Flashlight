//
//  ViewController.swift
//  Flashlight
//
//  Created by YURY PROSVIRNIN on 01.03.2021.
//

import UIKit

class ViewController: UIViewController {

    var currectColor = 0
    var colors: [UIColor] = [.white, .lightGray, .gray, .darkGray, .black]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /// Changes view background color
    fileprivate func updateUI() {
        if currectColor >= colors.count {
            currectColor = 0
        }
        view.backgroundColor = colors[currectColor]
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        currectColor += 1
        updateUI()
    }
    
}

