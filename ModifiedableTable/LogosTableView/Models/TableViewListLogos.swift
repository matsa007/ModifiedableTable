//
//  TableViewListLogos.swift
//  ModifiedableTable
//
//  Created by Сергей Матвеенко on 25.05.23.
//

import Foundation

struct LogosList {
    private var logosList = ["pencil.tip.crop.circle",
                             "trash.slash.circle",
                             "paperplane",
                             "tray.fill",
                             "tray.and.arrow.down",
                             "internaldrive",
                             "externaldrive.connected.to.line.below",
                             "xmark.bin.circle",
                             "doc.badge.gearshape",
                             "calendar.day.timeline.left"]

    func getLogosList() -> [String] {
        self.logosList
    }
}
