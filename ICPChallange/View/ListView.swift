//
//  ListView.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import LBTAComponents

extension ListController {
    
    func setupView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(noRecordsFound)
        noRecordsFound.text = "No Records Found"
        noRecordsFound.font = UIFont.systemFont(ofSize: 13)
        noRecordsFound.anchorCenterSuperview()
        noRecordsFound.isHidden = true
        tableView.tableFooterView = UIView()
    }
    
    func setupNoRecords(isHidden: Bool = true, message: String){
        noRecordsFound.text = message
        noRecordsFound.isHidden = isHidden
    }
    
}
