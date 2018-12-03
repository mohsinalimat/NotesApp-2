//
//  NoteTableViewCell.swift
//  NotesApp
//
//  Created by Mahmoud on 12/1/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import UIKit
import PopMenu

class NoteTableViewCell: UITableViewCell {

    var note:NoteModel?{
        didSet{
            noteLbl.text = note?.title
        }
    }
    
    @IBOutlet weak var noteLbl: UILabel!
    
    @IBOutlet weak var btnActions: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func btnActionsTapped(_ sender: Any) {
       
    }
}
