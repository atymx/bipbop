//
//  WelcomeScreenViewController.swift
//  BipBop
//
//  Created by Максим Атюцкий on 02.09.2018.
//  Copyright © 2018 Atyutskiy. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    @IBOutlet weak var round: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let colorTop = UIColor(red: 0.39, green: 0.45, blue: 0.95, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.79, green: 0.27, blue: 0.92, alpha: 1.0).cgColor

        let gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.locations = [0.0, 1.0]
        gl.frame = self.view.bounds

        self.view.layer.insertSublayer(gl, at: 0)
        
        round.layer.cornerRadius = round.frame.width / 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "toGame", sender: nil)
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
