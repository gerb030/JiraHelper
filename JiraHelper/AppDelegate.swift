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
    @IBAction func ticketsInReleaseClicked(_ sender: Any) {
        let jql = "project%20IN%20(Backlog%2C%20MAINT)%20AND%20issuetype%20!%3D%20Epic%20AND%20fixVersion%20%3D%20%22" + "6.0.14" + "%22%20order%20by%20lastViewed%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
    
    func openJiraSearchQuery(jql: String) {
        let url = URL(string: "https://backbase.atlassian.net/issues/?jql=" + jql)
        NSWorkspace.shared.open(url!)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.title = "Jira Helper"
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

