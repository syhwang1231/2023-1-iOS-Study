//
//  ProtocolParcticeViewController.swift
//  Protocol_Practice
//
//  Created by Seo Cindy on 2023/04/05.
//

import UIKit

protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

class Person : Flyable, Runnable{
    func run() {
        print("I'm Running!")
    }
    
    func fly() {
        print("I'm Flying!")
    }
    
    
}

class ProtocolParcticeViewController: UIViewController {
    
    let person = Person()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        person.fly()
        person.run()
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
