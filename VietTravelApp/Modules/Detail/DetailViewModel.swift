//
//  DetailViewModel.swift
//  VietTravelApp
//
//  Created by Cát Bình Lê on 06/06/2021.
//

import RxCocoa
import RxSwift
import Action
import APIKit

protocol DetailViewModelInputs {

}

protocol DetailViewModelOutputs {
    var repository: GitHubRepository { get }
    var request: URLRequest { get }
    var navigationBarTitle: Observable<String> { get }
}

protocol DetailViewModelType {
    var inputs: DetailViewModelInputs { get }
    var outputs: DetailViewModelOutputs { get }
}

final class DetailViewModel: DetailViewModelType, DetailViewModelInputs, DetailViewModelOutputs {

    var inputs: DetailViewModelInputs { return self }
    var outputs: DetailViewModelOutputs { return self }

    // MARK: - Inputs

    // MARK: - Outputs
    let repository: GitHubRepository
    let request: URLRequest
    let navigationBarTitle: Observable<String>

    private let disposeBag = DisposeBag()

    init(repository: GitHubRepository) {
        self.repository = repository
        self.request = URLRequest(url: repository.url)
        self.navigationBarTitle = Observable.just(repository.fullName)
    }

}
