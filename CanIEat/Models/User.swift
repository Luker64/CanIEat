//
//  User.swift
//  CanIEat
//
//  Created by Student on 12/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class User {
    
    let name: String
    let restrictions : [Restriction]
    
    init(name: String, restrictions : [Restriction]){
        self.name = name
        self.restrictions = restrictions
    }
}

class UserDAO {
    
    static func getUser() -> User {
        return User(name: "Jurema", restrictions: [Restriction(name: "Lactose")])
    }
}
