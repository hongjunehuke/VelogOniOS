//
//  ScrapStorageViewModel.swift
//  VelogOnMobile
//
//  Created by 홍준혁 on 2023/05/29.
//

import Foundation

import RxRelay
import RxSwift

final class ScrapStorageViewModel: BaseViewModel {
    
    // MARK: - Output
    
    let dummyDto1 = FolderDTO(articleID: 0,folderName: "iOS", count: 2)
    let dummyDto2 = FolderDTO(articleID: 1,folderName: "iOS", count: 2)
    let dummyDto3 = FolderDTO(articleID: 2,folderName: "iOS", count: 2)
    
    var storageListOutput = PublishRelay<[FolderDTO]>()
    
    override init() {
        super.init()
        makeOutput()
    }
    
    private func makeOutput() {
        viewWillAppear
            .flatMapLatest( { [weak self] _ -> Observable<[FolderDTO]> in
                guard let self = self else { return Observable.empty() }
                return Observable<[FolderDTO]>.just([self.dummyDto1,self.dummyDto2,self.dummyDto3])
            })
            .subscribe(onNext: { [weak self] folderList in
                self?.storageListOutput.accept(folderList)
            })
            .disposed(by: disposeBag)
    }
}
