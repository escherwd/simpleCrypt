//
//  DecryptController.swift
//  encrypter
//
//  Created by Escher WD on 2/25/18.
//  Copyright © 2018 Escher WD. All rights reserved.
//

import Foundation
import Cocoa

class DecryptController: NSViewController {
    
    let NoCodeAlert = NSAlert()
    let NoTextAlert = NSAlert()
    let NoTextOrCodeAlert = NSAlert()
    let DecryptErrorAlert = NSAlert()
    
    @IBOutlet var textToDecryptView: NSTextView!
    @IBOutlet var codeWordView: NSTextField!
    
    override func viewDidLoad() {
        NoCodeAlert.alertStyle = .warning
        NoCodeAlert.messageText = "No Code Entered"
        NoCodeAlert.informativeText = "A code word is required for decrypting"
        NoTextAlert.alertStyle = .warning
        NoTextAlert.messageText = "No Text Entered"
        NoTextAlert.informativeText = "Make sure to enter some encrypted text before decrypting"
        NoTextOrCodeAlert.alertStyle = .warning
        NoTextOrCodeAlert.messageText = "No Text or Code Entered"
        NoTextOrCodeAlert.informativeText = "Please enter some encrypted text and a code word for decryption"
        DecryptErrorAlert.alertStyle = .warning
        DecryptErrorAlert.messageText = "Could not decrypt"
        DecryptErrorAlert.informativeText = "There was an issue decrypting your text. Perhaps there is something wrong with your code word? Remember, the code word is case-sensitive."
    }
    
    @IBAction func DecryptButton(_ sender: Any) {
        if codeWordView.stringValue != "" && textToDecryptView.string != "" {
            let numbesToDecrypt = numbersFromString(textToDecryptView.string)
            if let decryptedText = Decrypt(text: numbesToDecrypt, code: codeWordView.stringValue) {
                let resultSheet = storyboard?.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("ResultSheet")) as! ResultSheet
                self.presentViewControllerAsSheet(resultSheet)
                resultSheet.setOutputText(decryptedText)
            } else {
                DecryptErrorAlert.runModal()
            }
        } else if codeWordView.stringValue == "" && textToDecryptView.string != "" {
            NoCodeAlert.runModal()
        } else if codeWordView.stringValue != "" && textToDecryptView.string == "" {
            NoTextAlert.runModal()
        } else if  codeWordView.stringValue == "" && textToDecryptView.string == "" {
            NoTextOrCodeAlert.runModal()
        }
    }
    
}
