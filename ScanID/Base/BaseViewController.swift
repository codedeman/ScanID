//
//  BaseViewController.swift
//  CoreAnimation
//
//  Created by Pham Kien on 18.02.22.
//

import UIKit

class BaseViewController: UIViewController {

    var imgBG:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
      
        
//        let gradient = CAGradientLayer()
//        gradient.frame = (self.navigationController?.navigationBar.frame)!
//        gradient.colors = [UIColor.red.cgColor,UIColor.orange.cgColor]
//
//
//        self.navigationController?.navigationBar.setBackgroundImage(self.imageFromLayer(layer: gradient), for: UIBarMetrics.default)
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
//        gradient.locations =  [0.0,0.5,1.0]
////        self.navigationController.navigationBar.barStyle = .c;
//        self.navigationController?.isNavigationBarHidden = false
//        self.navigationController?.setNavigationBarHidden(false, animated: true)

//        [self.navigationController.navigationBar setBackgroundImage:[self imageFromLayer:gradient] forBarMetrics:UIBarMetricsDefault];

        
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//            gradient.frame = self.navigationController.navigationBar.frame;
//        gradient.colors = [BBCStyle sharedInstance].colorTitleBackgroundGradient;
//        [self.navigationController.navigationBar setBackgroundImage:[self imageFromLayer:gradient] forBarMetrics:UIBarMetricsDefault];
//
//        gradient.startPoint = CGPointMake(0.0, 0.5);
//        gradient.endPoint = CGPointMake(1.0, 0.5);
//        gradient.locations = @[@0.0, @0.5, @1.0];
//
    }
    

    class func initWithNib() -> Self {
        
        
        
        var  bundlerPath = Bundle(for: self)
        if  let url  = bundlerPath.url(forResource: "ScanIDResource", withExtension: "bundle") {
            bundlerPath = Bundle(url: url) ?? .main
        }
        print("over here",bundlerPath)
            
            
    
//        if let bundlePath = Bundle.main.path(forResource: "ScanIDResource", ofType: "bundle"),
//            let bundle = Bundle(path: bundlePath),
//            let path = bundle.path(forResource: "...", ofType: nil) {
//
//
//            print(path)
//        } else {
//            print("not found")
//        }
        
        let bundle = bundlerPath
        let fileManege = FileManager.default
        let nibName = String(describing: self)
        if let pathXib = bundle.path(forResource: nibName, ofType: "xib") {
            if fileManege.fileExists(atPath: pathXib) {
                return initWihtNibTemplate()
            }
        }
        
        if let pathStoryboard = bundle.path(forResource: nibName, ofType: "storyboard") {
            if fileManege.fileExists(atPath: pathStoryboard) {
                return initWithDefautlStoryboard()
            }
        }
        return initWihtNibTemplate()
    }
    
    class func initWithDefautlStoryboard() -> Self {
        let className = String(describing: self)
        return instantiateFromStoryboardHelper(storyboardName: className, storyboardId: className)
    }
    
    class func instantiateFromStoryboardHelper<T> (storyboardName:String,storyboardId:String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        return controller
    }

    
    func setUpBG(urlString:String) {
        
        imgBG = UIImageView()
        
        self.view.insertSubview(imgBG, at: 0)
        imgBG.translatesAutoresizingMaskIntoConstraints = false
        
        imgBG.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        imgBG.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0).isActive = true
        imgBG.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        imgBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {return}
                self.imgBG.image = UIImage(data: data)
            }
        }.resume()
        
    }
    func imageFromLayer(layer:CALayer) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: self.navigationController?.navigationBar.frame.size.height ?? 40)
        
        UIGraphicsBeginImageContext(rect.size)
        layer.render(in:  UIGraphicsGetCurrentContext()!)
        let outputImage =  UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = outputImage {
            return image
        }
        return UIImage()
        
    }
//    - (UIImage *)imageFromLayer:(CALayer *)layer
//    {
//
//        CGRect rect = CGRectMake(0, 0, 1, self.navigationController.navigationBar.frame.size.height);
//        UIGraphicsBeginImageContext(rect.size);
//
//        [layer renderInContext:UIGraphicsGetCurrentContext()];
//        layer.contentsGravity = kCAGravityBottomLeft;
//        UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
//
//        UIGraphicsEndImageContext();
//        return outputImage;
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIViewController {
    
    
    class func initWihtNibTemplate<T>()->T {
        
        var  bundlerPath = Bundle(for: self)
        if  let url  = bundlerPath.url(forResource: "ScanIDResource", withExtension: "bundle") {
            bundlerPath = Bundle(url: url) ?? .main
        }
        print("over here",bundlerPath)
        let nibName =  String(describing: self)
        let viewcontroller = self.init(nibName: nibName, bundle: bundlerPath)
        return viewcontroller as! T

    }
    
}


extension UIColor {
    
    convenience init?(hexaRGB: String, alpha: CGFloat = 1) {
        var chars = Array(hexaRGB.hasPrefix("#") ? hexaRGB.dropFirst() : hexaRGB[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }
        case 6: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                alpha: alpha)
    }
}




