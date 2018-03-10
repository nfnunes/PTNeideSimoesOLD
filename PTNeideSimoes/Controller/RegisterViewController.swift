//
//  RegisterViewController.swift
//  PTNeideSimoes
//
//  Created by Nuno Nunes on 04/03/2018.
//  Copyright © 2018 Nuno Nunes. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextFieldNib: NameTextFieldNib!
    @IBOutlet weak var surnameTextFieldNib: NameTextFieldNib!
    @IBOutlet weak var mobiletextFieldNib: PhoneTextFieldNib!
    @IBOutlet weak var emailTextFieldNib: EmailTextFieldNib!
    @IBOutlet weak var passwordTextFieldNib: PasswordTextFieldNib!
    @IBOutlet weak var confirmPasswordTextFieldNib: PasswordTextFieldNib!
    @IBOutlet weak var souPTUISwitch: UISwitch!
    @IBOutlet weak var codigoPTUITextField: PasswordTextFieldNib!
    @IBOutlet weak var codigoPTSpaceUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        surnameTextFieldNib.nameTextField.placeholder = "Apelido"
        confirmPasswordTextFieldNib.passwordTextField.placeholder = "Confirmar Password"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func souPTUISwitchChanged(_ sender: Any) {
        if (souPTUISwitch.isOn){
            codigoPTUITextField.isHidden = false
            codigoPTSpaceUIView.isHidden = true
        } else {
            codigoPTUITextField.isHidden = true
            codigoPTSpaceUIView.isHidden = false
        }
    }
    
    @IBAction func exitUIButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerBtnPressed(_ sender: Any) {

        guard let email = self.emailTextFieldNib.emailTextField?.text else { return }
        guard let password = self.passwordTextFieldNib.passwordTextField?.text else { return }
        guard let name = self.nameTextFieldNib.nameTextField?.text, name != ""  else { return }
        guard let surname = self.surnameTextFieldNib.nameTextField?.text, surname != ""  else { return }
        guard let phone = self.mobiletextFieldNib.phoneTextField?.text else { return }
        
        AuthService.instance.registerUser(withName: name,
                                          andSurname: surname,
                                          andPhone: phone,
                                          andEmail: email,
                                          andPassword: password,
                                          andIsPT: souPTUISwitch.isOn,
                                          userCreationComplete: { (success, registrationError) in
                                            if success{
                                                
                                                AuthService.instance.loginUser(withEmail: self.emailTextFieldNib.emailTextField.text!, andPassword: self.passwordTextFieldNib.passwordTextField.text!, loginComplete: { (success, nil) in
                                                    let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
                                                    let SWRevealViewController = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
                                                    self.present(SWRevealViewController, animated: true, completion: {
                                                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                                                    })

                                                })
                                            } else {
                                                print(registrationError)
                                            }
        })
        
    }
    
}
