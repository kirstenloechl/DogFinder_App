//
//  ViewController.swift
//  DogFinder
//
//  Created by Kirsten M Loechl on 1/23/19.
//  Copyright © 2019 Kirsten Loechl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let loginbutton : FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var dogfinderloginbutton: UIButton!
    @IBOutlet weak var signupbutton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let purpleColor = hexStringToUIColor(hex: "#BCA5FF")
        logo.image = #imageLiteral(resourceName: "logo.png")
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.addSubview(loginbutton)
        loginbutton.center.x = view.center.x
        loginbutton.center.y = 560
        
        dogfinderloginbutton.layer.cornerRadius = 3
        dogfinderloginbutton.layer.borderWidth = 1
        dogfinderloginbutton.layer.borderColor = purpleColor.cgColor
        
        signupbutton.layer.cornerRadius = 3
        signupbutton.layer.borderWidth = 1
        signupbutton.layer.borderColor = purpleColor.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

