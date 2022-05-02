//
//  About.swift
//  Barmaid
//
//  Created by Steven J. Selcuk on 2.05.2022.
//

import Cocoa
import SwiftUI

struct AboutView: View {
    var nsObject: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as AnyObject

    var body: some View {
        let version = nsObject as! String
        VStack(alignment: .center, spacing: 10) {
            VStack(alignment: .center) {
                Image("Barmaid")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)

                Text("Barmaid \(version)")
                    .bold()
                    .font(.title)
                    .padding(.vertical, 5.0)
                    .accessibility(hint: Text("Rek \(version)"))

                Text("Created by Steven J. Selcuk")
                    .underline()
                    .onTapGesture {
                        let email = "https://github.com/stevenselcuk"
                        if let url = URL(string: email) {
                            NSWorkspace.shared.open(url)
                        }
                    }
                    .accessibility(hint: Text("This boilerplate created by Steven Selcuk. Opens developers GitHub profile on click."))
            }
            .padding(.vertical, 10.0)

            HStack {
                Text("Bug or Feature?")

                Button(action: {
                    let email = "https://twitter.com/hevalandsteven"
                    if let url = URL(string: email) {
                        NSWorkspace.shared.open(url)
                    }
                }) {
                    Text("Tell Me")
                }
            } .accessibility(hint: Text("Opens developers Twitter profile"))
        }.padding(.horizontal, 10.0)
            .background(Color.clear)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

class AboutWindowController {
    static func createWindow() {
        var windowRef: NSWindow
        windowRef = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 200, height: 280),
            styleMask: [
                .titled,
                .closable,
                .borderless],
            backing: .buffered, defer: false)
        windowRef.contentView = NSHostingView(rootView: AboutView())
        windowRef.title = "About Barmaid"
        windowRef.level = NSWindow.Level.screenSaver
        windowRef.isReleasedWhenClosed = false
        windowRef.makeKeyAndOrderFront(nil)
    }
}
