//
//  AppDelegate.swift
//  Barmaid
//
//  Created by Steven J. Selcuk on 2.05.2022.
//

import Cocoa
import SwiftUI
@main
class AppDelegate: NSObject, NSApplicationDelegate {
    let invisibleWindow = NSWindow(contentRect: NSMakeRect(0, 0, 20, 5), styleMask: .borderless, backing: .buffered, defer: false)
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        invisibleWindow.backgroundColor = .red
        invisibleWindow.alphaValue = 0

        // Get SwiftUI View
        let contentView = Main()
        // Create a popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 300, height: 300)
        popover.behavior = .transient
        // Embed our SwiftUI view into the popover
        popover.contentViewController = NSHostingController(rootView: contentView)
        // Register it
        self.popover = popover
        self.popover.contentViewController?.view.window?.becomeKey()

        if let button = statusBarItem.button {
            // Set menubar icon
            button.image = NSImage(named: "menubar-icon")
            // Set menubar text
            button.title = "Barmaid"
            // Re-arrange status bar icon position
            button.imagePosition = NSControl.ImagePosition.imageLeft
            // Set font
            button.font = NSFont.monospacedDigitSystemFont(ofSize: 12.0, weight: NSFont.Weight.light)
            // Register click action
            // See Functions file
            button.action = #selector(togglePopover(_:))
            // Dispatch click states
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

