//
//  GTTimerViewModel.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/10/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import UIKit

class GTTimerViewModel: NSObject {
    
    var counter: Int?
    convenience init(counter: Int?){
        self.init()
        self.counter = counter
    }
}
