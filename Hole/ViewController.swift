//
//  ViewController.swift
//  Hole

import UIKit

class ViewController: UIViewController, ViewDelegate {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    let hole = SpotHelpView(frame: UIScreen.main.bounds)
    var flg = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hole.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.window?.addSubview(hole)
        
    }
    func touched() {
        if flg {
            hole.makeQuadrangle(rect: button.frame)
        } else {
            hole.makeHoleAt(point: button2.center, radius: button2.bounds.width / 2)
        }
        flg.toggle()
    }
    
}

