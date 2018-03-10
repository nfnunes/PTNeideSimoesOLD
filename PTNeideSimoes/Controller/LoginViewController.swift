//
//  ViewController.swift
//  PTNeideSimoes
//
//  Created by Nuno Nunes on 27/02/2018.
//  Copyright © 2018 Nuno Nunes. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFieldNib: EmailTextFieldNib!
    @IBOutlet weak var loginBorderUIButton: BorderUIButton!
    @IBOutlet weak var passwordTextFieldNib: PasswordTextFieldNib!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if emailTextFieldNib.emailTextField.text != nil && passwordTextFieldNib.passwordTextField.text != nil{
            AuthService.instance.loginUser(withEmail: emailTextFieldNib.emailTextField.text!, andPassword: passwordTextFieldNib.passwordTextField.text!, loginComplete: { (success, loginError) in
                if success{
                    
                    let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
                    let SWRevealViewController = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
                    self.present(SWRevealViewController, animated: true, completion: {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    })
                } else {
                    print(loginError)
                }
            })
        }
    }
    

    @IBAction func registerUIButtonPressed(_ sender: Any) {
        
        if let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController{
            present(vc, animated: true, completion: nil)
        }
        
    }
}

