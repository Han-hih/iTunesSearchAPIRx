//
//  DetailViewModel.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/15/23.
//

import Foundation
import RxSwift
//import RxCocoa

class DetailViewModel {
 
    var items: Results?
    
    
    var disposeBag = DisposeBag()
    
    struct Input {

    }
    
    struct Output {
        let outputselected: BehaviorSubject<Results?>
    }
    
    func transform() -> Output {
        let outputselected = BehaviorSubject<Results?>(value: items)
        
        return Output(outputselected: outputselected)
    }
            
    
}
