//
//  Box.swift
//  Newsfeed
//
//  Created by Naveenprabhu Arumugam on 11/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//


/**
 Dynamic class for data binding between Viewmodel and Contorller
 The call back listener is called immediately when the binding is setup
 */
import Foundation

final class Box<T> {
  typealias Listener = (T) -> Void
  var listener: Listener?
    
  var value: T {
    didSet {
      listener?(value)
    }
  }
    
  init(_ value: T) {
    self.value = value
  }

    func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}
