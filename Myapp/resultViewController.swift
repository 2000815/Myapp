//
//  resultViewController.swift
//  Myapp
//
//  Created by 市田圭司 on 2022/05/13.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet var outputLabel: UILabel!

    
    var outputValue : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        outputLabel.text = outputValue
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
