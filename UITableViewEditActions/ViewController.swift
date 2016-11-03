//
//  ViewController.swift
//  UITableViewEditActions
//
//  Created by Maksim Vialykh on 03.11.16.
//  Copyright © 2016 Vialyx. All rights reserved.
//

import UIKit

let cellIdentifier = "tableCell"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnEdit: UIButton!
    
    let data: [String] = ["One", "Two", "Next"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //  MARK: - Actions

    @IBAction func toogleMode(_ sender: Any) {
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)
        
        if self.tableView.isEditing {
            btnEdit.setTitle("StandartMode", for: .normal)
        } else {
            btnEdit.setTitle("EditMode", for: .normal)
        }
    }
    
    
    //  MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
    
    
    //  MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        cell?.textLabel?.text = data[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

}

