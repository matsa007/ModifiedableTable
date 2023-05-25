//
//  DisplayDataCreator.swift
//  ModifiedableTable
//
//  Created by Сергей Матвеенко on 25.05.23.
//

import Foundation

struct DisplayDataCreator {
    func createDisplaydataData(displayData: [TableListViewController.DisplayData], logosList: [String], titleText: String, descriptionText: String, maxCount: Int) -> [TableListViewController.DisplayData] {
        var modifiedArray = displayData
        for index in 0...maxCount {
            modifiedArray.append(TableListViewController.DisplayData(logoName: logosList[index % 10], title: titleText.createElementForArrayL(index: index), description: descriptionText.createElementForArrayL(index: index)))
        }
        return modifiedArray
    }
}
