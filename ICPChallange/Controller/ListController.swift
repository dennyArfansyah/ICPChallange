//
//  ListController.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import UIKit
import LBTAComponents

class ListController: UITableViewController {
    
    lazy var noRecordsFound = UILabel()
    private var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        
        viewModel.getBooks { response in

            switch response {
            case .success(let result):
                if result.status_code == 200 {
                    if let books = result.data.books, books.count > 0 {
                        self.setupNoRecords(message: "")
                        for book in books {
                            self.viewModel.books.append(book)
                        }
                        self.tableView.reloadData()
                    } else {
                        self.setupNoRecords(isHidden: false, message: "No records found")
                    }
                } else {
                    self.setupNoRecords(isHidden: false, message: result.description)
                }
            case .failure(let err):
                let er = err as NSError
                self.setupNoRecords(isHidden: false, message: er.domain)
            }

        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = viewModel.books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = book.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = viewModel.books[indexPath.row]
        let controller = CreateBookController()
        controller.isCreate = false
        controller.book = book
        navigationController?.pushViewController(controller, animated: true)
    }
}
