//
//  todo.swift
//  todo_list
//
//  Created by Sina Taherkhani on 6/20/1400 AP.
//

import Foundation
import Realm
import RealmSwift
class todo: Object {
    @objc dynamic var ID=""
    @objc dynamic var todo=""
    @objc dynamic var done=false
}
