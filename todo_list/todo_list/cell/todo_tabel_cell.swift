//
//  todo_tabel_cell.swift
//  todo_list
//
//  Created by Sina Taherkhani on 6/20/1400 AP.
//

import UIKit

class todo_tabel_cell: UITableViewCell {

    @IBOutlet var check_lbl: UILabel!
    @IBOutlet var todo_lbl: UILabel!
    static let ID:String="todo_cell"
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .none
    }

}
