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
    @IBOutlet weak var releaseMenu: NSMenuItem!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    @IBOutlet weak var releases: NSMenuItem!
    
    let allOldVersions = "6.0.x%2C%206.x%2C%206.0.1%2C%206.0.2%2C%206.0.3%2C%206.0.4%2C%206.0.5%2C%206.0.6%2C%206.0.7%2C%206.0.8%2C%206.0.9%2C%206.0.10%2C%206.0.11%2C%206.0.12%2C%206.0.13%2C%206.0.14%2C%206.0.15%2C%206.0.15.1%2C%206.0.15.2%2C%206.0.16%2C%206.0.17%2C%206.0.18%2C%206.0.19%2C%206.0.20%2C%206.0.21%2C%206.0.22%2C%206.0.23%2C%206.0.24%2C%20%22CX%206.1.0%22%2C%20%22CX%206.1.1%22%2C%20%22CX%206.2.0%22"
    var release = "6.0.23"

    @IBOutlet weak var colossusBoard: NSMenuItem!
    
    @IBAction func boardColossusClicked(_ sender: Any) {
        let jql = ""
        openJiraSearchQuery(jql: jql);
    }
    @IBAction func genericOpenTicketsClicked(_ sender: Any) {
        let jql = "project%20IN%20(MAINT%2C%20Backlog)%20AND%20status%20not%20in%20(done%2C%20closed%2C%20resolved)%20ORDER%20BY%20priority%20DESC%2C%20updated%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    @IBAction func ticketsInReleaseClicked(_ sender: Any) {
        let jql = "project%20IN%20(Backlog%2C%20MAINT)%20AND%20issuetype%20!%3D%20Epic%20AND%20fixVersion%20%3D%20%22" + release + "%22%20order%20by%20lastViewed%20DESC"
        openJiraSearchQuery(jql: jql);
    }

    @IBAction func allTheseEpicsClicked(_ sender: Any) {
        let jql = "project%20IN%20(Backlog%2C%20MAINT%2C%20LEAN)%20AND%20issuetype%20%3D%20Epic%20AND%20labels%20IN%20(value-area-experience-platform%2C%20value-area-experience-platform)%20AND%20Status%20not%20in%20(Done%2C%20Closed%2C%20Resolved)%20order%20by%20priority%20DESC"
        openJiraSearchQuery(jql: jql);
    }

    
    @IBAction func openDocTickets(_ sender: Any) {
        let jql = "project%20in%20(backlog%2C%20DOC%2C%20maint)%20AND%20affectedVersion%20in%20(6.0.x%2C%206.x%2C%206.0.1%2C%206.0.2%2C%206.0.3%2C%206.0.4%2C%206.0.5%2C%206.0.6%2C%206.0.7%2C%206.0.8%2C%206.0.9%2C%206.0.10%2C%206.0.11%2C%206.0.12%2C%206.0.13%2C%206.0.14%2C%206.0.15%2C%206.0.15.1%2C%206.0.15.2%2C%206.0.16%2C%206.0.17%2C%206.0.18%2C%206.0.19%2C%206.0.20%2C%206.0.21%2C%206.0.22)%20AND%20status%20NOT%20IN%20(Resolved%2C%20Done%2C%20Closed)%20AND%20issuetype%20%3D%20Document%20ORDER%20BY%20priority"
        openJiraSearchQuery(jql: jql);
    }

    
    @IBAction func epicsInReleaseClicked(_ sender: Any) {
        let jql = "project%20IN%20(Backlog%2C%20MAINT)%20AND%20issuetype%20%3D%20Epic%20AND%20fixVersion%20%3D%20%22" + release + "%22%20order%20by%20lastViewed%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func backlogOpenClicked(_ sender: Any) {
        let jql = "project%20IN%20(BACKLOG)%20AND%20affectedVersion%20IN%20("+allOldVersions+")%20AND%20status%20NOT%20IN%20(Done%2C%20Resolved%2C%20Closed)%20order%20by%20priority%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func blockersClicked(_ sender: Any) {
        let jql = "priority%20%3D%20Blocker%20AND%20(affectedVersion%20in%20("+allOldVersions+"))%20AND%20status%20not%20in%20(Done%2C%20Resolved%2C%20Closed)%20AND%20issuetype%20not%20in%20(Epic)%20ORDER%20BY%20created%20ASC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func importantClonesClicked(_ sender: Any) {
        let jql = "project%20in%20(maint%2C%20backlog)%20AND%20summary%20~%20clone%20AND%20status%20not%20in%20(done%2C%20closed%2C%20resolved)%20AND%20issuetype%20not%20in%20(epic%2C%20subTaskIssueTypes())%20and%20priority%20in%20(critical%2C%20blocker)%20ORDER%20BY%20priority%20DESC%2C%20lastViewed%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func clonesClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/RND/pages/346587688")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func codeFreezeCheckClicked(_ sender: Any) {
        let jql = "project%20IN%20(BACKLOG%2C%20Maintenance)%20AND%20fixVersion%20%3D%20" + release + "%20AND%20status%20NOT%20IN%20(Done%2C%20Resolved%2C%20Closed)%20AND%20issuetype%20NOT%20IN%20(Epic%2C%20%22Spike%20Story%22%2C%20Document%2C%20%22Tools%20%26%20Build%22)%20order%20by%20priority%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func fixversionButNoVaClicked(_ sender: Any) {
        let jql = "project%20%3D%20BACKLOG%20AND%20issuetype%20!%3D%20Document%20AND%20NOT%20labels%20in%20(value-area-experience-platform%2C%20value-area-experience-management)%20AND%20fixversion%20%3D%20" + release + "%20ORDER%20BY%20lastViewed%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func trueFixesClicked(_ sender: Any) {
        let jql = "project%20IN%20(Backlog%2C%20MAINT)%20AND%20issuetype%20!%3D%20Epic%20AND%20fixVersion%20%3D%20%22" + release + "%22%20AND%20Status%20in%20(Done%2C%20Closed%2C%20Resolved)%20AND%20resolution%20IN%20(Fixed%2C%20Resolved)%20order%20by%20lastViewed%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func last1WeekMaintClicked(_ sender: Any) {
        let jql = "project%20in%20(maint)%20AND%20affectedVersion%20in%20("+allOldVersions+")%20AND%20status%20NOT%20IN%20(Resolved%2C%20Done%2C%20Closed)%20AND%20created%20%3E%20-7d%20ORDER%20BY%20priority"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func last2WeeksMaintClicked(_ sender: Any) {
        let jql = "project%20in%20(maint)%20AND%20affectedVersion%20in%20("+allOldVersions+")%20AND%20status%20NOT%20IN%20(Resolved%2C%20Done%2C%20Closed)%20AND%20created%20%3E%20-14d%20ORDER%20BY%20priority"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func platformMaintClicked(_ sender: Any) {
        let jql = "project%20in%20(maint)%20AND%20affectedVersion%20in%20("+allOldVersions+")%20AND%20status%20NOT%20IN%20(Resolved%2C%20Done%2C%20Closed)%20AND%20labels%20IN%20(value-area-experience-platform)%20AND%20created%20%3C%207d%20ORDER%20BY%20priority"
        openJiraSearchQuery(jql: jql);
    }
    
    func openJiraSearchQuery(jql: String) {
        let url = URL(string: "https://backbase.atlassian.net/issues/?jql=" + jql)
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func colossusBoardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=853")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func cmbeBoardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=842")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func bruceLeanBoard(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=872")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func releaseBoard(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=955&projectKey=CX")
    NSWorkspace.shared.open(url!)
}
    
    @IBAction func pocBoardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=865")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func backlogViewClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=853&view=planning.nodetail")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func springBootBacklogViewClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1012&view=planning.nodetail")
        NSWorkspace.shared.open(url!)
    }
    
    
    @IBAction func confluenceClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/my/recent-work")
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
    
    @IBAction func gocdClicked(_ sender: Any) {
        let url = URL(string: "https://gocd.backbase.com")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func checkmarxClicked(_ sender: Any) {
        let url = URL(string: "https://checkmarx.backbase.com")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func blackduckClicked(_ sender: Any) {
        let url = URL(string: "https://black-duck.backbase.com")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func sonarClicked(_ sender: Any) {
        let url = URL(string: "https://sonar.backbase.com")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func deliveryGuildSpaceClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/GUIL/pages/405438486/Delivery+Guild")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func netsuiteClicked(_ sender: Any) {
        let url = URL(string: "https://system.eu2.netsuite.com/app/center/card.nl?sc=-29&whence=")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func tribeStatusReportClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/RND/pages/346587688")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func cxBudgetting(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1dJl8dCv1w0IOITclt_y9Fc4YvxC41BDzQR0MgB9QkWk/edit#gid=364681628")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func staffingPlan(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1mQVkZL4QO6qLszjn8h8HkLMiVp7uA1bwxFBGJxYsPmg/edit#gid=1654045633")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func joinersLeaversList(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1EtZnT2AL5Ru3_0wqKtzXI4jGex9VgGAOA6E0NdhRgyo/edit?ts=5b55a2e9#gid=0")
        NSWorkspace.shared.open(url!)
    }
    
    
    @IBAction func recruitmentList(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1xOBRFlHnUxKXTUTcFL51ixsNi51Efs0hCNdapnIW4Jo/edit?usp=sharing")
        NSWorkspace.shared.open(url!)
    }

    
    @IBAction func confluencePeopleList(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/RND/pages/221938570/R+D+Members")
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

