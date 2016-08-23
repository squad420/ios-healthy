//
//  ViewController.swift
//  Healthy
//
//  Created by Дмитрий on 08.07.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hey now")
        NetworkLayerConfiguration.setup()
        performSignUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func performSignUp() {
        
        let loadDrugsOperation = LoadDrugsOperation()
        loadDrugsOperation.success = { drugs in
            print(drugs.debugDescription)
        }
        loadDrugsOperation.failure = { error in print(error.localizedDescription) }
        
        NetworkQueue.shared.addOperation(loadDrugsOperation)
    }

}

