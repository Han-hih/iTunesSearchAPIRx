//
//  SearchViewModel.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/8/23.
//

import Foundation
import RxSwift
import RxRelay

class SearchViewModel: ViewModelType {
    
   private let disposeBag = DisposeBag()
    
    struct Input {
        let searchButtonTap: Observable<Void>
        let searchText: Observable<String>
    }
    
    struct Output {
        let items: PublishSubject<[Results]>
    }
    
    func transform(input: Input) -> Output {
        let appList = PublishSubject<[Results]>()
        
        input.searchButtonTap
            .withLatestFrom(input.searchText) { _, query in
                return query
            }
            .flatMap { APIManager.fetchitunesData(term: $0) }
            .subscribe(with: self) { owner, value in
                let data = value.results
                appList.onNext(data)
            }
            .disposed(by: disposeBag)
        
        return Output(items: appList)
    }
}
