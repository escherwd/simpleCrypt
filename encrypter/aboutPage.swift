//
//  aboutPage.swift
//  encrypter
//
//  Created by Escher WD on 2/27/18.
//  Copyright © 2018 Escher WD. All rights reserved.
//

import Foundation
import Cocoa

class AboutPageController: NSViewController {
    
    @IBAction func viewProjectButton(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "https://escherwd.github.io/simpleCrypt")!)
    }
    
    @IBAction func OtherApps(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "https://escherwd.github.io/apps")!)
    }
    
    @IBAction func ReportIssue(_ sender: Any) {
        NSWorkspace.shared.open(URL(string: "mailto:escherwd@yahoo.com")!)
    }
    
    @IBOutlet var VersionNumber: NSTextField!
    
    override func viewDidLoad() {
        VersionNumber.stringValue = "v\(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")!)"
    }
    
}
