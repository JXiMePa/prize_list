//
//  Prize.swift
//  prize_list
//
//  Created by Tarasenko Jurik on 02.12.2020.
//

import Foundation
import RealmSwift

class Prize: Object {
    @objc dynamic var id = String()
    @objc dynamic var name = String()
    @objc dynamic var cost = Double()
    @objc dynamic var createdAt = Int()
    @objc dynamic var selectedIndex = 0
    
    override class func primaryKey() -> String? { return "id" }
}
