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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginbutton)
        loginbutton.center = view.center
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

