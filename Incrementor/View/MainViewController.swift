//
//  ViewController.swift
//  AuraTestTask
//
//  Created by Dzhambulat Khasayev on 12.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    var viewModel:IncrementorViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController:IncrementNumberListener
{
    func numberUpdated(number:Int)
    {
        numberLabel.text = String(number)
    }
}

extension MainViewController:UIGestureRecognizerDelegate
{
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        viewModel.increment()
    }
}

