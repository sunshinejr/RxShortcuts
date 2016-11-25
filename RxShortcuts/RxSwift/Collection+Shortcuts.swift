//
//  Collection+Shortcuts.swift
//  RxShortcuts
//
//  Created by sunshinejr on 25.11.2016.
//  Copyright (c) 2016 sunshinejr. All rights reserved.
//

import RxSwift

public extension Collection where Iterator.Element: ObservableType {
    
    /**
     Merges elements from all observable sequences in the given enumerable sequence into a single observable sequence.
     
     - seealso: [merge operator on reactivex.io](http://reactivex.io/documentation/operators/merge.html)
     
     - returns: The observable sequence that merges the elements of the observable sequences.
     */
    func merge() -> Observable<Self.Iterator.Element.E> {
        return Observable.from(self).merge()
    }

    /**
     Merges the specified observable sequences into one observable sequence by using the selector function whenever any of the observable sequences produces an element.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter resultSelector: Function to invoke whenever any of the sources produces an element.
     - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
     */    
    func combineLatest<T>(resultSelector: @escaping ([Self.Iterator.Element.E]) throws -> T) -> Observable<T> {
        return Observable.combineLatest(self, resultSelector)
    }
    
    /**
     Merges the specified observable sequences into one observable sequence by using the selector function whenever all of the observable sequences have produced an element at a corresponding index.
     
     - seealso: [zip operator on reactivex.io](http://reactivex.io/documentation/operators/zip.html)
     
     - parameter resultSelector: Function to invoke for each series of elements at corresponding indexes in the sources.
     - returns: An observable sequence containing the result of combining elements of the sources using the specified result selector function.
     */
    func zip<T>(resultSelector: @escaping ([Self.Iterator.Element.E]) throws -> T) -> Observable<T> {
        return Observable.zip(self, resultSelector)
    }
    
    /**
     Concatenates all inner observable sequences, as long as the previous observable sequence terminated successfully.
     
     - seealso: [concat operator on reactivex.io](http://reactivex.io/documentation/operators/concat.html)
     
     - returns: An observable sequence that contains the elements of each observed inner sequence, in sequential order.
     */
    func concat() -> Observable<Self.Iterator.Element.E> {
        return Observable.from(self).concat()
    }
}
