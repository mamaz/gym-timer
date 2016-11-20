//
//  ViewController.swift
//  GymTimer
//
//  Created by Hisma Mulya S on 11/10/16.
//  Copyright © 2016 mamaz. All rights reserved.
//

import UIKit
import SnapKit
import ReactiveCocoa
import ReactiveSwift

class GTSetupViewController: UIViewController {
    
    public var goToTimerView: ((_ setupViewModel: GTSetupViewModel?) -> Void)?
    
    private lazy var descriptionLabel = UILabel()
    private lazy var counterLabel = UILabel()
    private lazy var stepper = UIStepper()
    private lazy var startButton = UIButton()
    
    private weak var setupViewModel: GTSetupViewModel?
    private weak var flowController: GTFlowController?
    
    // the compiler for swift 2.3 / 3 
    // require this
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(flowController: GTFlowController?, viewModel: GTSetupViewModel?) {
        self.init()
        self.setupViewModel = viewModel
        self.flowController = flowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = "Setup"
        
        // setup style and postions for views
        self.setUpDescriptionLabel()
        self.setUpCounterLabel()
        self.setUpStepper()
        self.setUpStartButton()
        
        // change counter label when stepper is
        // incremented or decremented
        self.stepper.reactive.trigger(for: .valueChanged).observeValues { [unowned self] in
            let doubleValue: Double = (self.stepper.value as Double?)!
            let intValue: Int = Int(doubleValue)
            self.setupViewModel?.counter = intValue
            self.counterLabel.text = "\(intValue)"
        }
        
        // go to timer view 
        // when start button is tapped
        self.startButton.reactive.trigger(for: .touchUpInside)
        .observeValues { [unowned self] in
            if let goToTimer = self.goToTimerView {
                print("Go to timerView")
                goToTimer(self.setupViewModel)
            }
        }
        
        // observe counter
        let property = DynamicProperty<Int>(object: self.setupViewModel!, keyPath: "counter")
        property.producer.startWithValues { [unowned self] counter in
            print("counter: \(counter!)")
            self.startButton.isHidden = (counter! == 0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Views
    private func setUpDescriptionLabel() {
        self.descriptionLabel.text = "Please select how many reps you want to finish today:"
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.numberOfLines = 0
        self.view.addSubview(self.descriptionLabel)
        self.descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(70)
            make.height.greaterThanOrEqualTo(30.0)
        }
    }
    
    private func setUpCounterLabel() {
        self.counterLabel.text = "0"
        self.counterLabel.font = UIFont(name: "Avenir", size: 50)
        self.view.addSubview(self.counterLabel)
        
        self.counterLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(15)
            make.width.greaterThanOrEqualTo(30)
            make.height.equalTo(50)
        }
    }
    
    private func setUpStepper() {
        self.view.addSubview(stepper);
        
        self.stepper.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(self.counterLabel.snp.bottom).offset(10.0)
            make.centerX.equalTo(self.view)
        }
    }
    
    private func setUpStartButton() {
        let startText = "Start Training"
        self.startButton.setTitle(startText, for: .normal)
        self.startButton.setTitle(startText, for: .highlighted)
        self.startButton.setTitleColor(UIColor.black, for: .normal)
        self.startButton.setTitleColor(UIColor.gray, for: .highlighted)
        self.view.addSubview(self.startButton);
        
        self.startButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.top.equalTo(self.stepper.snp.bottom).offset(20.0)
            make.centerX.equalTo(self.stepper)
        }
    }

}
