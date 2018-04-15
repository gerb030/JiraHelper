//
//  AppDelegate.swift
//  JiraHelper
//
//  Created by Gerben de Graaf on 15/04/2018.
//  Copyright © 2018 Gerben de Graaf. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    @IBOutlet weak var colossusBoard: NSMenuItem!
    
    @IBAction func boardColossusClicked(_ sender: Any) {
        let jql = ""
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
    
    func openJiraSearchQuery(jql: String) {
        let url = URL(string: "https://www.google.com" + jql)
        NSWorkspace.shared().open(url)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.title = "Jira Helper"
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

