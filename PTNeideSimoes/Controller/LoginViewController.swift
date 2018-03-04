//
//  ViewController.swift
//  PTNeideSimoes
//
//  Created by Nuno Nunes on 27/02/2018.
//  Copyright © 2018 Nuno Nunes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emalTextFieldNib: EmailTextFieldNib!
    @IBOutlet weak var loginBorderUIButton: BorderUIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func registerUIButtonPressed(_ sender: Any) {
        
        if let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController{
            present(vc, animated: true, completion: nil)
        }
        
    }
}

