//
//  SecondViewController.swift
//  Protocol_Practice
//
//  Created by Seo Cindy on 2023/04/05.
//

import UIKit

class SecondViewController: UIViewController , ChangeLabelDelegate {
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
        //delegate 위임받았다는 것을 정의
        previousViewController?.delegate = self
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
