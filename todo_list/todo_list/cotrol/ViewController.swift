//
//  ViewController.swift
//  todo_list
//
//  Created by Sina Taherkhani on 6/20/1400 AP.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var add_btn: UIButton!
    @IBOutlet var todo_text: UITextField!
    let todoSource=TodoData()
    var todos=[todo]()
    @IBOutlet var todo_tabelview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        todoSource.delegate=self
        add_btn.layer.cornerRadius=add_btn.frame.height / 16
    }
    @IBAction func btn_pressed(_ sender: Any) {
        todoSource.setData(todoo: todo_text.text ?? "")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.todoSource.readtodo()
    }
    

}
extension ViewController:TodoDataDeleget,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.todo_tabelview.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let closeActin=UIContextualAction(style: .normal, title: "done", handler:{        (ac:UIContextualAction,view:UIView,success:(Bool) -> ()) in
            self.todoSource.updatetodo(id: String(self.todos[indexPath.row].ID), done: true)
            success(true)
        })
        closeActin.backgroundColor = .green
        //closeActin.image=UIImage(named: "")
        return UISwipeActionsConfiguration(actions: [closeActin])
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let closeActin=UIContextualAction(style: .normal, title: "again", handler:{        (ac:UIContextualAction,view:UIView,success:(Bool) -> ()) in self.todoSource.updatetodo(id: String(self.todos[indexPath.row].ID), done: false)
            success(false)
        })
        closeActin.backgroundColor = .red
        //closeActin.image=UIImage(named: "")
        return UISwipeActionsConfiguration(actions: [closeActin])
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=todo_tabelview.dequeueReusableCell(withIdentifier: todo_tabel_cell.ID) as!
todo_tabel_cell ?? todo_tabel_cell()
        if (self.todos.count > 0){
            switch self.todos[indexPath.row].done {
            case true:
                cell.check_lbl.text="✅"
                break
            default:
                cell.check_lbl.text=""
                break
            }
            cell.todo_lbl.text=self.todos[indexPath.row].todo
        }
        return cell
    }
    
    func setTodo(Data: todo) {
        print("todo=\(Data)")
        todo_tabelview.reloadData()
        self.todo_text.text=nil
    }
    
    func getTodo(Data: [todo]) {
        print("todo=\(Data)")
        self.todos=Data
        self.todo_tabelview.reloadData()
    }
    
    func didFiald(Error: String) {
        print("error=\(Error)")
    }
    
    
}

