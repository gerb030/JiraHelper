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
    
    let allOldVersions = "6.0.x%2C%206.x%2C%206.0.1%2C%206.0.2%2C%206.0.3%2C%206.0.4%2C%206.0.5%2C%206.0.6%2C%206.0.7%2C%206.0.8%2C%206.0.9%2C%206.0.10%2C%206.0.11%2C%206.0.12%2C%206.0.13%2C%206.0.14%2C%206.0.15%2C%206.0.15.1%2C%206.0.15.2%2C%206.0.16%2C%206.0.17%2C%206.0.18%2C%206.0.19%2C%206.0.19.1%2C%206.0.20%2C%206.0.21%2C%206.0.21.1%2C%206.0.22%2C%206.0.23%2C%206.0.23.1%2C%206.0.23.2%2C%206.0.24%2C%206.0.24.1%2C%20%22CX%206.0.24.2%22%2C%20%22CX%206.0.24.3%22%2C%20%22CX%206.0.24.4%22%2C%20%22CX%20CX 6.0.24.5%22%2C%20%22CX%206.1.0%22%2C%20%22CX%206.1.0-beta%22%2C%20%22CX%206.1.0%22%2C%20%22CX%206.1.1%22%2C%20%22CX%206.1.1%22%2C%20%22CX%206.1.2%22%2C%20%22CX%206.1.3%22%2C%20%22CX%206.1.4%22%2C%20%22CX%206.1.5%22%2C%20%22CX%206.2.0%22"
    var release = "CX%206.2.0"

    @IBOutlet weak var colossusBoard: NSMenuItem!
    

    @IBAction func ticketsInReleaseClicked(_ sender: Any) {
        let jql = "(project%20IN%20(Lean%2C%20Cloud%2C%20Content%2C%20%22CX%20Marketing%22%2C%20CXMODEL%2C%20CXPROV)%20OR%20project%20%3D%20MAINT%20and%20%22Backlog%20Link%22%20IN%20(%22Experience%20Model%22%2C%20%22Provisioning%20%26%20SDLC%22%2C%20%22CX%20Marketing%22%2C%20Content%2C%20Cloud%2C%20%22Lean%20Client%22)%20)%20AND%20issuetype%20NOT%20IN%20(Document)%20AND%20fixversion%20%3D%20%22" + release + "%22%20"
        openJiraSearchQuery(jql: jql);
    }

    
    @IBAction func openDocTickets(_ sender: Any) {
        let jql = "project%20in%20(backlog%2C%20DOC%2C%20maint)%20AND%20affectedVersion%20in%20("+allOldVersions+")%20AND%20status%20NOT%20IN%20(Resolved%2C%20Done%2C%20Closed)%20AND%20issuetype%20%3D%20Document%20ORDER%20BY%20priority"
        openJiraSearchQuery(jql: jql);
    }

    
    @IBAction func blockersClicked(_ sender: Any) {
        let jql = "priority%20%3D%20Blocker%20AND%20(affectedVersion%20in%20("+allOldVersions+"))%20AND%20status%20not%20in%20(Done%2C%20Resolved%2C%20Closed)%20AND%20issuetype%20not%20in%20(Epic)%20ORDER%20BY%20created%20ASC"
        openJiraSearchQuery(jql: jql);
    }
    

    @IBAction func codeFreezeCheckClicked(_ sender: Any) {
        let jql = "(project%20IN%20(Lean%2C%20Cloud%2C%20Content%2C%20%22CX%20Marketing%22%2C%20CXMODEL%2C%20CXPROV)%20OR%20project%20%3D%20MAINT%20AND%20(%22Backlog%20Link%22%20IN%20(%22Product%20Backlog%22%2C%20Content%2C%20%22Experience%20Model%22%2C%22Provisioning%20%26%20SDLC%22%2CCloud%2C%22CX%20Marketing%22%2C%20%22CX%20Untrack%22%20)))%20AND%20issuetype%20NOT%20IN%20(Document)%20AND%20fixversion%20%3D%20%22" + release + "%22%20AND%20status%20NOT%20IN%20(Done%2C%20Closed%2C%20Resolved)";        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func trueFixesClicked(_ sender: Any) {
        let jql =
           "project%20IN%20(BACKLOG%2C%20MAINT%2C%20GROCX%2C%20%22Experience%20Model%22%2C%20CXMF%2C%20%22CX%20Marketing%22%2C%20Content%2C%20%22Provisioning%20%26%20SDLC%22%2C%20Cloud)%20AND%20issuetype%20!%3D%20Epic%20AND%20fixVersion%20%3D%20%22" + release + "%22%20AND%20Status%20in%20(Done%2C%20Closed%2C%20Resolved)%20AND%20resolution%20IN%20(Fixed%2C%20Resolved)%20order%20by%20lastViewed%20DESC"
        openJiraSearchQuery(jql: jql);
    }
    
    @IBAction func last1WeekMaintClicked(_ sender: Any) {
        let jql = "project%20%3D%20Maintenance%20AND%20filter%20in%20(55444%2C%2055462%2C%2055443%2C%2055463)%20AND%20status%20not%20in%20(Done%2C%20Closed%2C%20Resolved)%20AND%20created%20%3E%20-7d"
        openJiraSearchQuery(jql: jql);
    }

    
    @IBAction func docsCurrentReleaseClicked(_ sender: Any) {
        let url = URL(string:"https://backbase.atlassian.net/issues/?filter=54443")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func productRequirementsClicked(_ sender: Any) {
        let url = URL(string:"https://backbase.atlassian.net/wiki/spaces/PrM/pages/133431577/Product%2BRequirements")
        NSWorkspace.shared.open(url!)
    }
    
    func openJiraSearchQuery(jql: String) {
        let url = URL(string: "https://backbase.atlassian.net/issues/?jql=" + jql)
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func contentBoardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1095&projectKey=CONTENT")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func modelClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1093")
        NSWorkspace.shared.open(url!)
    }
    
    
    @IBAction func marketingClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1078&view=planning.nodetail")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func springBootBacklogViewClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1012&view=planning.nodetail")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func provisioningBacklogViewClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1092&view=planning.nodetail")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func grocxViewClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1134&view=planning.nodetail")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func devopsBacklogViewClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=1092&view=planning&quickFilter=6814")
        NSWorkspace.shared.open(url!)
    }
        
    
    @IBAction func maintReleasesClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/projects/MAINT?contains=%22" + release + "%22&orderField=RANK&selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=unreleased")
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
    
    @IBAction func releaseList(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/projects/CX?orderField=RANK&selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=unreleased")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func pocBoardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=865")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func cxQABoardClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/RapidBoard.jspa?rapidView=853&view=planning.nodetail")
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
    
    @IBAction func jenkinsClicked(_ sender: Any) {
        let url = URL(string: "https://jenkins.backbase.eu/blue/organizations/jenkins/Tribe%20X%2FCXP-AUTO%2Fcx-ondemand-env/activity/")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func gocdClicked(_ sender: Any) {
        let url = URL(string: "https://gocd.backbase.com")
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
    
    @IBAction func communityRetirementClicked(_ sender: Any) {
        let url = URL(string: "https://community.backbase.com/d/retirement/")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func expensesClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/RND/pages/306050644/Expensify+-+How+to+charge+expenses")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func slaClicked(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1rwjJV5LoT8W-ed1KtijKSoiFuCAFfxixo6-OTaE2nnk/edit#gid=1642126855")
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
    
    @IBAction func confluenceIdentity(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/ID/overview")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func confluenceCX(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/development/overview")
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

