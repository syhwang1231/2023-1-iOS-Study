//
//  SecondViewController.swift
//  Protocol
//
//  Created by 장나리 on 2023/04/02.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController?
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true, completion: nil)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousViewController?.delegate = self
    }
    



}
