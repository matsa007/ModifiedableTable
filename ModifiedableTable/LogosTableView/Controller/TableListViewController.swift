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
        return table
    }()
    
    // MARK: - Initialization
    
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
        self.createDisplayData()
        self.view.addSubview(self.logosTitlesDescriotionsTable)
        self.logosTitlesDescriotionsTable.frame = self.view.bounds
        self.logosTitlesDescriotionsTable.register(TableViewListCell.self, forCellReuseIdentifier: "tableViewCell")
        self.logosTitlesDescriotionsTable.dataSource = self
        self.logosTitlesDescriotionsTable.delegate = self
        
    }
    
    // MARK: - DATA updating
    
    private func createDisplayData() {
        let displayDataCreator = DisplayDataCreator()
        self.displayData = displayDataCreator.createDisplaydataData(displayData: self.displayData, logosList: self.logosList, titleText: "Title", descriptionText: "Description", maxCount: 999)
    }
    
}

// MARK: - Extensions

extension TableListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.displayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewListCell else { return UITableViewCell() }
        let displayData = self.displayData[indexPath.row]
        cell.setCellView(displayData: DisplayData(logoName: displayData.logoName, title: displayData.title, description: displayData.description))
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.logosTitlesDescriotionsTable.beginUpdates()
            self.displayData.remove(at: indexPath.row)
            self.logosTitlesDescriotionsTable.deleteRows(at: [indexPath], with: .fade)
            self.logosTitlesDescriotionsTable.endUpdates()
        }
    }
}

extension TableListViewController {
    struct DisplayData {
        var logoName: String
        var title: String
        var description: String
    }
}
