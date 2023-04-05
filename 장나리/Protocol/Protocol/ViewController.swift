//
//  ViewController.swift
//  Protocol
//
//  Created by 장나리 on 2023/04/02.
//

import UIKit

protocol ChangeLabelDelegate{
    func doChange()
}
protocol Flyable{
    func fly()
}
protocol Runnable{
    func run()
}
class Person : Flyable,Runnable{
    func fly() {
        print("날았다.")
    }
    func run(){
        print("달렸다.")
    }

}
class ViewController: UIViewController {
    
    let person = Person()
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }

    var delegate : ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        person.fly()
        person.run()
    }


}

