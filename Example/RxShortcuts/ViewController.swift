//
//  ViewController.swift
//  RxShortcuts
//
//  Created by sunshinejr on 11/13/2016.
//  Copyright (c) 2016 sunshinejr. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxShortcuts

enum TestError: Error {
    case test
}

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let driverSequence = Driver<Int>.of(5, 6, 7, 8)
        let sequence = Observable<Int>.of(1, 2, 3, 4)
        let errorSequence = Observable<Int>.error(TestError.test)
        
        driverSequence
            .doOnNext { number in
                print("driver doOnNext: \(number)")
            }
            .driveNext { number in
                print("driveNext: \(number)")
            }
            .addDisposableTo(disposeBag)
        
        driverSequence
            .doOnCompleted {
                print("driver doOnCompleted")
            }
            .driveCompleted { _ in
                print("driveCompleted")
            }
            .addDisposableTo(disposeBag)
        
        sequence
            .doOnNext { number in
                print("doOnNext: \(number)")
            }
            .subscribeNext { number in
                print("subscribeNext: \(number)")
            }
            .addDisposableTo(disposeBag)
        
        sequence
            .doOnCompleted {
                print("doOnCompleted")
            }
            .subscribeCompleted { _ in
                print("subscribeCompleted")
            }
            .addDisposableTo(disposeBag)
        
        errorSequence
            .doOnError { error in
                print("doOnError: \(error)")
            }
            .subscribeError { error in
                print("subscribeError")
            }
            .addDisposableTo(disposeBag)
    }
}

