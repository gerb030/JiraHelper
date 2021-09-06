//
//  AppDelegate.swift
//  JiraHelper
//
//  Created by Gerben de Graaf on 15/04/2018.
//  Copyright © 2018 Gerben de Graaf. All rights reserved.
//

import Cocoa
import os

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var releaseMenu: NSMenuItem!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    @IBOutlet weak var releases: NSMenuItem!
    
    let allOldVersions = "6.0.x%2C%206.x%2C%20%22CX%20CX 6.0.24.5%22%2C%20%22CX%206.1.0%22%2C%20%22CX%206.1.0-beta%22%2C%20%22CX%206.1.0%22%2C%20%22CX%206.1.1%22%2C%20%22CX%206.1.1%22%2C%20%22CX%206.1.2%22%2C%20%22CX%206.1.3%22%2C%20%22CX%206.1.4%22%2C%20%22CX%206.1.5%22%2C%20%22CX%206.2.0%22%2C%20%22CX%206.2.1%22%22%2C%20%22CX%206.2.2%22%22%2C%20%22CX%206.2.3%22%22%2C%20%22CX%206.2.4%22%22%2C%20%22CX%206.2.5%22%22%2C%20%22CX%206.2.5.1%22%22%2C%20%22CX%206.2.5.2%22%22%2C%20%22CX%206.2.5.3%22%22%2C%20%22CX%206.2.5.4%22%22%2C%20%22CX%206.2.5.5%22%22%2C%20%22CX%206.2.5.6%22%22%2C%20%22CX%206.2.5.7%22%22%2C%20%22CX%206.2.6%22%22%2C%20%22CX%206.2.6.1%22%22%2C%20%22CX%206.2.7%22%22%2C%20%22CX%206.2.8%22%22%2C%20%22CX%206.2.9%22%22%2C%20%22CX%206.2.9.1%22%22%2C%20%22CX%206.2.10%22%22%2C%20%22CX%206.2.10.1%22%22%2C%20%22CX%206.3.0%22%22%2C%20%22CX%206.3.0.1%22%22%2C%20%22CX%206.3.1%22%22%2C%20%22CX%206.3.1.1%22%22%2C%20%22CX%206.3.2%22%22%2C%20%22CX%206.3.3%22%22%2C%20%22CX%206.3.4%22"
    var release = "CX%206.3.3"

    @IBOutlet weak var colossusBoard: NSMenuItem!
    

    @IBAction func ticketsInReleaseClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/issues/?filter=55059")
        NSWorkspace.shared.open(url!)
    }

    
    @IBAction func openDocTickets(_ sender: Any) {
        let jql = "project%20in%20(DOC%2C%20maint)%20AND%20affectedVersion%20in%20("+allOldVersions+")%20AND%20status%20NOT%20IN%20(Resolved%2C%20Done%2C%20Closed)%20AND%20issuetype%20%3D%20Document%20ORDER%20BY%20priority"
        openJiraSearchQuery(jql: jql);
    }

    
    @IBAction func blockersClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/Dashboard.jspa?selectPageId=35186")
        NSWorkspace.shared.open(url!)
    }
    

    @IBAction func codeFreezeCheckClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/issues/?filter=55728")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func MaintDashboardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/Dashboard.jspa?selectPageId=35186")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func trueFixesClicked(_ sender: Any) {
        let jql =
           "project%20NOT%20IN%20(CX)%20AND%20issuetype%20!%3D%20Epic%20AND%20fixVersion%20%3D%20%22" + release + "%22%20AND%20Status%20in%20(Done%2C%20Closed%2C%20Resolved)%20AND%20resolution%20IN%20(Fixed%2C%20Resolved)%20order%20by%20lastViewed%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func last1WeekMaintClicked(_ sender: Any) {
        let jql = "filter%20in%20(56564)%20AND%20status%20not%20in%20(Done%2C%20Closed%2C%20Resolved)%20AND%20created%20%3E%20-7d"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func docsCurrentReleaseClicked(_ sender: Any) {
        let url = URL(string:"https://backbase.atlassian.net/issues/?filter=56109")
        NSWorkspace.shared.open(url!)
    }
        
    func openJiraSearchQuery(jql: String) {
        let url = URL(string: "https://backbase.atlassian.net/issues/?jql=" + jql)
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func maintReleasesClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/projects/MAINT?contains=%22" + release + "%22&orderField=RANK&selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=unreleased")
        NSWorkspace.shared.open(url!)
    }
    
    
    @IBAction func releaseBoard(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=955&projectKey=CX")
    NSWorkspace.shared.open(url!)
    }
    
    @IBAction func releaseList(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/projects/CX?orderField=RANK&selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=unreleased")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func maintDashboardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/Dashboard.jspa?selectPageId=35186")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func devsDashboardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/Dashboard.jspa?selectPageId=35297")
        NSWorkspace.shared.open(url!)
    }

    
    @IBAction func devsGoalsReportClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1580&projectKey=GROCX&view=reporting&chart=cumulativeFlowDiagram&swimlane=3093&swimlane=3092&column=14349&column=14350&column=14351")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func peakonPage(_ sender: Any) {
        let url = URL(string: "https://miro.com/app/board/o9J_l7P4n1M=/")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func devsTeamManagement(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1r3kk0RDWaGVTDctJ4FAxzqraXaanNYR_uDYBxsEook0/edit#gid=1176460641")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func devsGerbPeople(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1mHwA4Ku4tgRTGqYAdJyxdP_w1vF2OmK5HyReEOlF-LM/edit#gid=0")
        NSWorkspace.shared.open(url!)
    }

    
    @IBAction func confluenceClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/DE/overview")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func searchClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/dosearchsite.action?queryString=iets")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func personalPageClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/~gerbena/overview")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func jenkinsClicked(_ sender: Any) {
        let url = URL(string: "https://jenkins.backbase.eu/blue/organizations/jenkins/Tribe%20X%2FCXP-AUTO%2Fcx-ondemand-env/activity/")
        NSWorkspace.shared.open(url!)
    }
        
    @IBAction func blackduckClicked(_ sender: Any) {
        let url = URL(string: "https://black-duck.backbase.com")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func communityRetirementClicked(_ sender: Any) {
        let url = URL(string: "https://community.backbase.com/d/retirement/")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func expensesClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/RND/pages/306050644/Expensify+-+How+to+charge+expenses")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func slaClicked(_ sender: Any) {
        let url = URL(string: "https://community.backbase.com/documentation/cxs/latest/retirement")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func deliveryGuildSpaceClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/GUIL/pages/405438486/Delivery+Guild")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func netsuiteClicked(_ sender: Any) {
        let url = URL(string: "https://accounts.google.com/o/saml2/initsso?idpid=C01fqlfbi&spid=434587444047&forceauthn=false")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func FTEoverview(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1KUe3QJXPndtJhCox6XRj9m83nNIFzy2CABSEbQ74zyQ/edit?ts=5d822039#gid=473843856")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func confluencePeopleList(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/RND/pages/221938570/R+D+Members")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func confluenceDeSpace(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/DE/overview")
        NSWorkspace.shared.open(url!)
    }

    
    @IBAction func signUpSheet(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1jx8qoviNvp5CHv1Z2Cwp67MWT3maVso6JPSxdfC5IzA/edit#gid=954708331")
        NSWorkspace.shared.open(url!)
    }

    
    @IBAction func releasePicked(_ sender: NSMenuItem) {
//        for menuItem in releaseMenu.() as! [NSMenuItem] {
//            // Switches off the first (and unique) 'on' item
//            menuItem.state = NSControl.StateValue.off
//        }
        
//        for item in sender.parent!.menu!.items {
//            item.state = NSControl.StateValue.off
//        }
        
        sender.state = sender.state == NSControl.StateValue.on ? NSControl.StateValue.off : NSControl.StateValue.on
        release = sender.title;
    }
    
    
    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let icon = NSImage(named: NSImage.Name(rawValue: "jira-logo"))
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

