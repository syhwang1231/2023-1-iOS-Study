//
//  ViewController.swift
//  Protocol_Practice
//
//  Created by Seo Cindy on 2023/04/05.
//

import UIKit
    
protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func buttonGoNextVC(_ sender: Any) {
        // 다음화면으로 전환
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else{return}

        // previous view controller가 자기 자신임을 전달
        nextVC.previousViewController = self

        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }

    // protocol 정의
    var delegate : ChangeLabelDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }


}

