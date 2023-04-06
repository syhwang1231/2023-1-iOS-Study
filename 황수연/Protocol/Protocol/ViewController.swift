//
//  ViewController.swift
//  Protocol
//
//  Created by Suyeon Hwang on 2023/03/31.
//

import UIKit

protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonGoNextVC(_ sender: Any) {
        // nextVC에 도착지인 SecondViewController를 정의해주기
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        // 다음 화면으로 넘어갈 때 previousViewController가 자신임을 넘겨줘야 함
        nextVC.previousViewController = self
        // 화면이 꽉 차 보이게 만들기 위해 fullScreen
        nextVC.modalPresentationStyle = .fullScreen
        
        // present를 통해 다음 화면으로 넘어가도록
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate: ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

