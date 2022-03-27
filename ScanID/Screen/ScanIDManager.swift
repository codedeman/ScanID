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
    
    public init() {}
//    let share:ScanIDManager = ScanIDManager()
    public func  showVC(viewController:UIViewController) {
        let scanVC = ScanIDCameraVC.initWithNib()
        viewController.present(scanVC, animated: true, completion: nil)
    }
}
