//
//  Result.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

enum ApıResult<Value> {
    case success(Value)
    case failure(Error)
}
