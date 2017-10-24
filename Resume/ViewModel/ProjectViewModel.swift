//
//  ProjectViewModel.swift
//  Resume
//
//  Created by Odet Alexandre on 24/10/2017.
//  Copyright © 2017 Odet Alexandre. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ProjectViewModel: ViewModelProtocol {
  
  lazy var disposeBag = DisposeBag()
  
  var apiCommunication = GithubAPICommunication()
  
  var items = Variable<[GithubProject]>([])
  
  var observableItems: Observable<[GithubProject]> {
    return items.asObservable()
  }
  
  func cancelRequest() {
    apiCommunication.cancelRequest()
  }
  
  func fetchData() {
    apiCommunication.fetchProjects().subscribe({ [weak self] event -> Void in
      guard let `self` = self else { return }
      switch event {
      case .next(let projects):
        self.items.value.removeAll()
        self.items.value.append(contentsOf: projects)
      case .completed:
        return
      case .error(let error):
        print("\(error)")
        return
      }
    }).disposed(by: disposeBag)
  }
}
