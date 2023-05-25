//
//  String+Ex.swift
//  ModifiedableTable
//
//  Created by Сергей Матвеенко on 25.05.23.
//

import Foundation

extension String {
    func createElementForArrayL(index: Int) -> String {
        self + " " + String(index + 1)
    }
}
