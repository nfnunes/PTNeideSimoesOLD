//
//  UserMenuViewController.swift
//  PTNeideSimoes
//
//  Created by Nuno Nunes on 04/03/2018.
//  Copyright © 2018 Nuno Nunes. All rights reserved.
//

import UIKit

class UserMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuOptionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuOptionsTableView.delegate = self
        menuOptionsTableView.dataSource = self
        
//        let footer = UIView()
//        footer.alpha = 0
        
 //       self.menuOptionsTableView.tableFooterView = footer

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = menuOptionsTableView.dequeueReusableCell(withIdentifier: "menuOptionCell", for: indexPath) as? menuOptionCell{
            let option = ptMenuOptionsArray[indexPath.row]
            cell.configureCell(option: option)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ptMenuOptionsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
