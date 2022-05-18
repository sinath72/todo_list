//
//  todoView.swift
//  realm
//
//  Created by Sina Taherkhani on 6/18/1400 AP.
//

import Foundation
import UIKit
import RealmSwift
import Realm
protocol TodoDataDeleget:class {
    func setTodo(Data:todo)
    func getTodo(Data:[todo])
    func didFiald(Error:String)
}
class TodoData {
    weak var delegate:TodoDataDeleget?
    let realm = try! Realm()
    func setData(todoo:String) {
        if (todoo != "") {
            do {
                let date=Date()
                let callender = Calendar.current
                let year = callender.component(.year, from: date)
                let month = callender.component(.month, from: date)
                let day = callender.component(.day, from: date)
                let hour = callender.component(.hour, from: date)
                let min = callender.component(.minute, from: date)
                let sec = callender.component(.second, from: date)
                let newtodo = try todo()
                newtodo.ID="\(year)/\(month)/\(day) \(hour):\(min):\(sec)"
                newtodo.todo=todoo
                newtodo.done=false
                try! self.realm.write{
                    realm.add(newtodo)
                }
                self.delegate?.setTodo(Data: newtodo)
                self.readtodo()
            } catch let error {
                self.delegate?.didFiald(Error: error.localizedDescription)
            }
        } else {
            print("Fields are Empty")
        }
    }
    func readtodo() {
        var todos = [todo]()
        let theTodo = self.realm.objects(todo.self)//.filter("first_name == 'lll'")
        for todoo in theTodo{
            todos.append(todoo)
        }
        self.delegate?.getTodo(Data: todos)
    }
    func updatetodo(id:String,done:Bool) {
        let theTodo = self.realm.objects(todo.self).filter("ID == %@",id)
        if let todo=theTodo.first{
            try! realm.write{
              todo.done=done
            }
        }
        self.readtodo()
    }
}
