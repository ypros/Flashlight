//
//  ViewController.swift
//  Flashlight
//
//  Created by YURY PROSVIRNIN on 01.03.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var currectColor = 0
    var colors: [UIColor] = [.white, .lightGray, .gray, .darkGray, .black]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        toggleTorch(currectColor)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /// Changes view background color
    fileprivate func updateUI() {
        if currectColor >= colors.endIndex {
            currectColor = 0
        }
        view.backgroundColor = colors[currectColor]
        
        toggleTorch(currectColor)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        currectColor += 1
        updateUI()
    }
    
    
    /// Turns torch On or Off by the light level
    /// - Parameter level: the brightness level of the torch
    func toggleTorch(_ level: Int) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { print("Torch isn't available"); return }

        let on: Bool = (level != colors.endIndex - 1)
        let maxLevel = min(AVCaptureDevice.maxAvailableTorchLevel.significand, 1.0)
        let step = Float(level)/Float(colors.count - 1) * maxLevel
        
        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            
            if on { try device.setTorchModeOn(level: maxLevel - step) }
            device.unlockForConfiguration()
        } catch {
            print("Torch can't be used")
        }
    }
    
}

