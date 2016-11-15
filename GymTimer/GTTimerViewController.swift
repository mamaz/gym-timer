//
//  GTTimerViewController.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/10/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import Foundation
import UIKit


class GTTimerViewController: UIViewController {
    
    var timerViewModel: GTTimerViewModel?
    
    // the compiler for swift 2.3 / 3
    // require this
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(viewModel: GTTimerViewModel?) {
        self.init()
        self.timerViewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = "Timer"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
