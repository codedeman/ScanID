//
//  ViewController.swift
//  ScanIDExample
//
//  Created by Pham Kien on 26.03.22.
//

import UIKit
import ScanID
class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTabOpenSdkBtn(_ sender: Any) {
        
//        let nav = UINavigationController(rootViewController: self)
        let scanID = ScanIDManager()
        scanID.showVC(viewController: self)
    }
    
}

