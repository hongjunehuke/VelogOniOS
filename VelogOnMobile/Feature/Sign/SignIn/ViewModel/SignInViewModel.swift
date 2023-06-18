//
//  SignInViewModel.swift
//  VelogOnMobile
//
//  Created by 홍준혁 on 2023/06/18.
//

import Foundation

import RxSwift
import RxRelay

final class SignInViewModel: BaseViewModel {
    
    let realm = RealmService()
    
    // MARK: - Input
    
    let appleSignInButtonTapped = PublishRelay<Bool>()
    
    override init() {
        super.init()
        makeOutput()
    }
    
    private func makeOutput() {
        appleSignInButtonTapped
            .subscribe(onNext: { [weak self] didTapped in
                self?.realm.setAutoSignIn(didSignIn: true)
            })
            .disposed(by: disposeBag)
    }
}
