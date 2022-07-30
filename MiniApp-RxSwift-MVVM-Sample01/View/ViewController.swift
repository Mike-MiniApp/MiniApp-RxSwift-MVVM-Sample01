//
//  ViewController.swift
//  MiniApp-RxSwift-MVVM-Sample01
//
//  Created by 近藤米功 on 2022/07/30.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    // MARK: UI Parts
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var password1TextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var emailMessageLabel: UILabel!
    @IBOutlet weak var passwordMessageLabel: UILabel!

    private let disposeBag = DisposeBag()

    let registerViewModel = RegisterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
//        emailTextField.rx.text
//            .map{$0 ?? ""}
//            .map{$0.isValidEmail}
//            .subscribe(onNext: { [weak self] text in
//                print(text)
//            })
        setupBindings()
    }

    private func setupBindings(){
        let registerViewModelInputs = RegisterViewModelInput(emailTextFieldObservable: emailTextField.rx.text.map{$0 ?? ""}.asObservable(), password1TextFieldObservable: password1TextField.rx.text.map{$0 ?? ""}.asObservable(), password2TextFieldObservable: password2TextField.rx.text.map{$0 ?? ""}.asObservable(), signupButtonObservable: signupButton.rx.tap.asObservable())

        registerViewModel.setup(input: registerViewModelInputs)

        registerViewModel.emailMessageLabelSubject.subscribe(onNext: {[weak self] message in
            self?.emailMessageLabel.text = message
        })
        .disposed(by: disposeBag)

        registerViewModel.passwordMessageLabelSubject.subscribe(onNext: {[weak self] message in
            self?.passwordMessageLabel.text = message
        })
        .disposed(by: disposeBag)
    }
}

