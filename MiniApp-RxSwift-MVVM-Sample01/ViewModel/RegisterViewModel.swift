//
//  RegisterViewModel.swift
//  MiniApp-RxSwift-MVVM-Sample01
//
//  Created by 近藤米功 on 2022/07/30.
//

import RxSwift
import RxCocoa

// MARK: Observable
struct RegisterViewModelInput{
    var emailTextFieldObservable: Observable<String?>
    var password1TextFieldObservable: Observable<String?>
    var password2TextFieldObservable: Observable<String?>
    var signupButtonObservable: Observable<Void>
}

class RegisterViewModel{

    var message = Message()

    private let disposeBag = DisposeBag()

    var emailMessageLabelSubject = PublishSubject<String>()
    var passwordMessageLabelSubject = PublishSubject<String>()


    func setup(input: RegisterViewModelInput){
        input.emailTextFieldObservable
            .map{$0?.isValidEmail}
            .subscribe(onNext: { validEmail in
                guard let validEmail = validEmail else { return }
                if validEmail{
                    self.emailMessageLabelSubject.onNext(self.message.getMessageValidEmail())
                }else{
                    self.emailMessageLabelSubject.onNext(self.message.getMessageNoValidEmail())
                }
                print("emailValid",validEmail)
            })
            .disposed(by: disposeBag)

        input.password1TextFieldObservable
            .map{$0?.isValidPassword}
            .subscribe(onNext: {validPass in
                guard let validPass = validPass else { return }
                if validPass{
                    self.passwordMessageLabelSubject.onNext(self.message.getMessagePassword())
                }else{
                    self.passwordMessageLabelSubject.onNext(self.message.getMessageNoPassword())
                }
                print("passwordValid",validPass)
            })
            .disposed(by: disposeBag)
    }
}


