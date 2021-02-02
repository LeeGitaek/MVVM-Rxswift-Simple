//
//  ViewModel.swift
//  Mvvm-Rxswift-Simple
//
//  Created by gitaeklee on 2021/02/02.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input:Input { get }
    var output:Output { get }
}

class ViewModel:ViewModelType {
    let input:Input
    let output: Output
    
    init(input:Input,dependency:String) {
        self.input = input
        let rxResult = input.text.asObservable()
        self.output = Output(result: rxResult)
    }
}

extension ViewModel {
    struct Input {
        let text:Observable<String>
    }
    
    struct Output {
        let result:Observable<String>
    }
}
