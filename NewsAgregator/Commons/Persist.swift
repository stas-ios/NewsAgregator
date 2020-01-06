//
//  Persist.swift
//  NewsAgregator
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

//PropertyWrapper для параметров, сохраняемых в UserDefaults
@propertyWrapper
struct Persist<T> {
  let key: String
  let defaultValue: T
 
  var wrappedValue: T {
    get {
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}
