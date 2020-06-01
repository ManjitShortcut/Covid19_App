//
//  Encode.swift
//  Covid19App
//
//  Created by Manjit on 30/05/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation

public extension Encodable {
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
