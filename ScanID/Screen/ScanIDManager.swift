//
//  File.swift
//  ScanID
//
//  Created by Pham Kien on 27.03.22.
//

import Foundation
import UIKit
protocol ScanIDProtocol:AnyObject {
    
}
public class ScanIDManager {
    
    public init() {
        
        
        
        if let fileURL = Bundle.main.url(forResource: "ScanIDResource", withExtension: "bundle") {
            print("file url ----- \(fileURL)")
            // we found the file in our bundle!
        } else {
            print("not found")
        }
    }
//    let share:ScanIDManager = ScanIDManager()
    public func  showVC(viewController:UIViewController) {
        
        let scanVC = ScanIDCameraVC()
        scanVC.modalPresentationStyle = .fullScreen
        viewController.present(scanVC, animated: true, completion: nil)
    }
}
