//
//  GameViewController.swift
//  BipBop
//
//  Created by Максим Атюцкий on 02.09.2018.
//  Copyright © 2018 Atyutskiy. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bipField: UITextField!
    @IBOutlet weak var bopField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bipField.keyboardType = .decimalPad
        bopField.keyboardType = .decimalPad
        
        bipField.layer.borderColor = UIColor(red: 0.39, green: 0.45, blue: 0.95, alpha: 1.0).cgColor
        bipField.layer.borderWidth = 1
        bipField.layer.cornerRadius = 4
        
        bopField.layer.borderColor = UIColor(red: 0.79, green: 0.27, blue: 0.92, alpha: 1.0).cgColor
        bopField.layer.borderWidth = 1
        bopField.layer.cornerRadius = 4
        
        bipField.tag = 1
        bipField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        bopField.tag = 2
        bopField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        // tags:
        // 1 - bip
        // 2 - bop
        
        self.tableView.reloadData()
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = String(indexPath.item + 1)
        if let bip = Int(bipField.text!) {
            if (indexPath.item + 1) % bip == 0 {
                cell.textLabel?.text = (cell.textLabel?.text)! + " Bip"
            }
        }
        if let bop = Int(bopField.text!) {
            if (indexPath.item + 1) % bop == 0 {
                cell.textLabel?.text = (cell.textLabel?.text)! + " Bop"
            }
        }
        return cell
    }
}
