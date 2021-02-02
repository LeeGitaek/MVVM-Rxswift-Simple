//
//  ViewController.swift
//  Mvvm-Rxswift-Simple
//
//  Created by gitaeklee on 2021/02/02.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var viewmodel:ViewModel!
    let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        // Do any additional setup after loading the view.
    }
    
    private func bind(){
        let input = ViewModel.Input(text: self.textfield.rx.text.orEmpty.asObservable())
        
        guard let text = label.text else {return}
        
        viewmodel = ViewModel(input: input, dependency: text)
        
        viewmodel.output.result
            .bind(to: label.rx.text)
            .disposed(by: disposebag)
        
        
    }


}

