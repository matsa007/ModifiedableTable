//
//  ViewController.swift
//  ModifiedableTable
//
//  Created by Сергей Матвеенко on 24.05.23.
//

import UIKit
import SnapKit

final class TableListViewController: UIViewController {
    
    // MARK: - Parameters
    
    private let logosList: [String]
    
    private var displayData: [DisplayData] = [] {
        didSet {
            self.logosTitlesDescriotionsTable.reloadData()
        }
    }
    
    // MARK: - GUI
    
    private lazy var logosTitlesDescriotionsTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .red
        return table
    }()
    
    // MARK: - Initialisation
    
    init(logosList: LogosList) {
        self.logosList = logosList.getLogosList()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.logosTitlesDescriotionsTable)
        self.logosTitlesDescriotionsTable.frame = self.view.bounds
        self.logosTitlesDescriotionsTable.register(TableViewListCell.self, forCellReuseIdentifier: "tableViewCell")
        self.logosTitlesDescriotionsTable.dataSource = self
        self.logosTitlesDescriotionsTable.delegate = self
        
    }

}

// MARK: - Extensions

extension TableListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewListCell else { return UITableViewCell() }
        return cell
    }
}

extension TableListViewController {
    struct DisplayData {
        var logoName: String
        var title: String
        var description: String
    }
}
