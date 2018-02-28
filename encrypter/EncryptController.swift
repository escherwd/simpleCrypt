//
//  EncryptController.swift
//  encrypter
//
//  Created by Escher WD on 2/25/18.
//  Copyright © 2018 Escher WD. All rights reserved.
//

import Foundation
import Cocoa

class EncryptController: NSViewController {
    
    let NoCodeAlert = NSAlert()
    let NoTextAlert = NSAlert()
    let NoTextOrCodeAlert = NSAlert()

    @IBOutlet var TextToEncryptView: NSTextView!
    @IBOutlet var CodeWordView: NSTextField!
    
    override func viewDidLoad() {
        NoCodeAlert.alertStyle = .warning
        NoCodeAlert.messageText = "No Code Entered"
        NoCodeAlert.informativeText = "Use a code word you'll remember so that you can decrypt the text later"
        NoTextAlert.alertStyle = .warning
        NoTextAlert.messageText = "No Text Entered"
        NoTextAlert.informativeText = "Make sure to enter some text before encrypting"
        NoTextOrCodeAlert.alertStyle = .warning
        NoTextOrCodeAlert.messageText = "No Text or Code Entered"
        NoTextOrCodeAlert.informativeText = "Please enter some text and a code word you'll remember so you can decrypt the text later"
    }
    
    @IBAction func RandomWordButton(_ sender: Any) {
        CodeWordView.stringValue = Lorem.word
    }
    
    @IBAction func EncryptButton(_ sender: Any) {
        if CodeWordView.stringValue != "" && TextToEncryptView.string != "" {
            let encryptedText = Encrypt(text: TextToEncryptView.string, code: CodeWordView.stringValue)
            let finalText = numbersToString(numbers: encryptedText)
            let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
            let resultSheet = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("ResultSheet")) as! ResultSheet
            self.presentViewControllerAsSheet(resultSheet)
            resultSheet.setOutputText(finalText)
        } else if CodeWordView.stringValue == "" && TextToEncryptView.string != "" {
            NoCodeAlert.runModal()
        } else if CodeWordView.stringValue != "" && TextToEncryptView.string == "" {
            NoTextAlert.runModal()
        } else if  CodeWordView.stringValue == "" && TextToEncryptView.string == "" {
            NoTextOrCodeAlert.runModal()
        }
    }
    
    
}


class ResultSheet: NSViewController {
    
    override func viewDidLoad() {
        
    }

    @IBAction func saveTXT(_ sender: Any) {
        let saveSheet = NSSavePanel()
        saveSheet.message = "Choose a location for this file"
        saveSheet.allowedFileTypes = ["txt"]
        saveSheet.begin(completionHandler: { result in
            if result.rawValue == NSFileHandlingPanelOKButton {
                let filename = saveSheet.url
                do {
                    try self.TextOutputView.string.write(to: filename!, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    //Write failed
                }
                
            } else {
                
            }
        })
    }
    
    @IBAction func copyAction(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(TextOutputView.string, forType: NSPasteboard.PasteboardType.string)
    }
    
    func setOutputText(_ string:String) {
        TextOutputView.string = string
        TextOutputView.selectAll(nil)
    }
    
    @IBOutlet var TextOutputView: NSTextView!
    
    @IBAction func DoneButton(_ sender: Any) {
        self.dismissViewController(self)
    }
    
    override func viewDidAppear() {
        // any additional code
        view.window!.styleMask.remove(NSWindow.StyleMask.resizable)
    }
}
