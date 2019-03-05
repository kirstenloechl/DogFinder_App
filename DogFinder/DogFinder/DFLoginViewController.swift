//
//  DFLoginViewController.swift
//  DogFinder
//
//  Created by Kirsten M Loechl on 1/24/19.
//  Copyright © 2019 Kirsten Loechl. All rights reserved.
//

import UIKit
import Firebase

class DFLoginViewController: UIViewController {
    
    //*********SIGN UP VIEW CONRTOLLER*********
    
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
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let purpleColor = hexStringToUIColor(hex: "#BCA5FF")
        logo.image = #imageLiteral(resourceName: "logo.png")
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginbutton.layer.cornerRadius = 3
        loginbutton.layer.borderWidth = 1
        loginbutton.layer.borderColor = purpleColor.cgColor
    }
    

    @IBAction func loginbutton(_ sender: Any) {
        if usernameField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: usernameField.text!, password: passwordField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
