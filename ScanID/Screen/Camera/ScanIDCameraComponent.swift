//
//  ScanIDCameraComponent.swift
//  ScanID
//
//  Created by Pham Kien on 27.03.22.
//

import UIKit
import AVFoundation

extension ScanIDCameraVC {
    //MARK:- View Setup
    func setupView(){
       view.backgroundColor = .black
//       view.addSubview(viewCapture)
        
//       view.addSubview(captureImageButton)
//       view.addSubview(capturedImageView)
//       NSLayoutConstraint.activate([
//        viewCapture.widthAnchor.constraint(equalToConstant: 200),
//        viewCapture.heightAnchor.constraint(equalToConstant: 300),
//        viewCapture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//        viewCapture.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),])
//
//           captureImageButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//           captureImageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//           captureImageButton.widthAnchor.constraint(equalToConstant: 50),
//           captureImageButton.heightAnchor.constraint(equalToConstant: 50),
           
//           capturedImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//           capturedImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//           capturedImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
//           capturedImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -70)
//       ])
       
//       switchCameraButton.addTarget(self, action: #selector(switchCamera(_:)), for: .touchUpInside)
//       captureImageButton.addTarget(self, action: #selector(captureImage(_:)), for: .touchUpInside)
    }
    
    //MARK:- Permissions
    func checkPermissions() {
        let cameraAuthStatus =  AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch cameraAuthStatus {
          case .authorized:
            return
          case .denied:
            abort()
          case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler:
            { (authorized) in
              if(!authorized){
                abort()
              }
            })
          case .restricted:
            abort()
          @unknown default:
            fatalError()
        }
    }
}
