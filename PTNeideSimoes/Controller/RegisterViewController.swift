//
//  RegisterViewController.swift
//  PTNeideSimoes
//
//  Created by Nuno Nunes on 04/03/2018.
//  Copyright © 2018 Nuno Nunes. All rights reserved.
//

import UIKit

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
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
    
}
