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

    
    @IBAction func MaintJiraDashboard(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/secure/Dashboard.jspa?selectPageId=35186")
        NSWorkspace.shared.open(url!)
    }
    

    @IBAction func techMaturitySheetClicked(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1XOXLf8QLKiSggHGK3OoxSmofuhKVz81_5gbhyBu7b98/edit#gid=0")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func DeVSBoardClicked(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1WVJ0z6j_edBRx8UI6Q_FZSnvAYZfU6DNBudbH_rcYDM/edit#gid=340895682")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func TMMCriteriaClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/GUIL/pages/3545399452/Reference+Technical+Maturity+Criteria")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func whosWhoClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/wiki/spaces/DE/pages/2369946220/Who+s+who+in+Developer+Enablement")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func gerbPeopleMgtClicked(_ sender: Any) {
        let url = URL(string:"https://docs.google.com/spreadsheets/d/1mHwA4Ku4tgRTGqYAdJyxdP_w1vF2OmK5HyReEOlF-LM/edit#gid=0")
        NSWorkspace.shared.open(url!)
    }
        
    func openJiraSearchQuery(jql: String) {
        let url = URL(string: "https://backbase.atlassian.net/issues/?jql=" + jql)
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func maintReleasesClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/projects/MAINT?&orderField=RANK&selectedItem=com.atlassian.jira.jira-projects-plugin%3Arelease-page&status=unreleased")
        NSWorkspace.shared.open(url!)
    }
    
    
    @IBAction func maintProjectConfigClick(_ sender: Any) {
        let url = URL(string: "https://backbase.atlassian.net/plugins/servlet/project-config/MAINT/people")
    NSWorkspace.shared.open(url!)
    }
    
    @IBAction func devsMtMiro(_ sender: Any) {
        let url = URL(string: "https://miro.com/app/board/uXjVOQC1aeU=/?moveToWidget=3458764518958265091&cot=14")
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
    
    @IBAction func recruitmentOverview(_ sender: Any) {
        let url = URL(string:
    "https://backbase.atlassian.net/wiki/spaces/BBREC/pages/1119223994/R+D+NL+Recruitment+Team+Portfolio")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func goalsWoWPage(_ sender: Any) {
        let url = URL(string:
    "https://backbase.atlassian.net/wiki/spaces/DE/pages/2572583992/Maintaining+and+Updating+the+Product+Plan")
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func devsTeamManagement(_ sender: Any) {
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1r3kk0RDWaGVTDctJ4FAxzqraXaanNYR_uDYBxsEook0/edit#gid=1176460641")
        NSWorkspace.shared.open(url!)
    }

    @IBAction func leapsomeClicked(_ sender: Any) {
        let url = URL(string: "https://www.leapsome.com/app/#/profile/60dc61f0483d305ef22bd29f?init=true")
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
        
    @IBAction func bambooClicked(_ sender: Any) {
        let url = URL(string: "https://backbase.bamboohr.com")
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
        let url = URL(string: "https://docs.google.com/spreadsheets/d/1GnBEFpa6s1oIbqtp-IBnKzxGsAvjDlpKDTw2hi5L4K0/edit#gid=1204833092")
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

