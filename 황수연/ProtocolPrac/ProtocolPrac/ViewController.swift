//
//  ViewController.swift
//  ProtocolPrac
//
//  Created by Suyeon Hwang on 2023/03/31.
//

import UIKit

protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

class Person: Flyable, Runnable {
    func fly() {
        print("날았다")
    }
    
    func run() {
        print("달렸다")
    }
}

class ViewController: UIViewController {

    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        person.fly()
        person.run()
    }


}

