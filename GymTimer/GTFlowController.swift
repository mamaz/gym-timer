//
//  GTFlowController.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/10/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import UIKit

class GTFlowController: NSObject {
    
    var navigationController: UINavigationController?
    
    convenience init(navigationController: UINavigationController?){
        self.init()
        self.navigationController = navigationController
    }
    
    public func configureSetupViewController(setupViewController: GTSetupViewController?,
                                      navigationController: UINavigationController?) {
        setupViewController?.goToTimerView = { setupViewModel in
            
            let timerViewModel = GTTimerViewModel(counter: (setupViewModel?.counter)!)
            let timerViewController = GTTimerViewController(viewModel: timerViewModel)
            navigationController?.pushViewController(timerViewController, animated: true)
        }
    }
}
