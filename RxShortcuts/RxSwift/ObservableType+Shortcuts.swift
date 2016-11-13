//
//  ObservableType+Shortcuts.swift
//  RxShortcuts
//
//  Created by sunshinejr on 11/13/2016.
//  Copyright (c) 2016 sunshinejr. All rights reserved.
//

import RxSwift

public extension ObservableType {
    
    /**
     Invokes an action for each Next event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public func doOnNext(_ onNext: @escaping (E) throws -> Void) -> Observable<E> {
        return self.do(onNext: onNext)
    }
    
    /**
     Invokes an action for the Error event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public func doOnError(_ onError: @escaping (Swift.Error) throws -> Void) -> Observable<E> {
        return self.do(onError: onError)
    }
    
    /**
     Invokes an action for the Completed event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public func doOnCompleted(_ onCompleted: @escaping () throws -> Void) -> Observable<E> {
        return self.do(onCompleted: onCompleted)
    }
    
    /**
     Subscribes an element handler to an observable sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    // @warn_unused_result(message: "http://git.io/rxs.ud")
    public func subscribeNext(_ onNext: @escaping (E) -> Void) -> Disposable {
        return self.subscribe(onNext: onNext)
    }
    
    /**
     Subscribes an error handler to an observable sequence.
     
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    // @warn_unused_result(message: "http://git.io/rxs.ud")
    public func subscribeError(_ onError: @escaping (Swift.Error) -> Void) -> Disposable {
        return self.subscribe(onError: onError)
    }
    
    /**
     Subscribes a completion handler to an observable sequence.
     
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    // @warn_unused_result(message: "http://git.io/rxs.ud")
    public func subscribeCompleted(_ onCompleted: @escaping () -> Void) -> Disposable {
        return self.subscribe(onCompleted: onCompleted)
    }
}
