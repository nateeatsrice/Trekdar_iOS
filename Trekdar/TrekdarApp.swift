//
//  TrekdarApp.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/20/25.
// The main.swift file

import SwiftUI

@main
struct TrekrApp: App {
    @StateObject var locations = Locations()

    var body: some Scene {
        WindowGroup {
            TabView {
// The NavigationView allows the app to not crowd the top of the screen when scrolling down.
// This is supper useful for apps where we dont want clunky overlap of text with the notification bar
                NavigationView {
                    ContentView(location: locations.primary)
                }
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Discover")
                }

                NavigationView {
                    WorldView()
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Locations")
                }

                NavigationView {
                    TipsView()
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tips")
                }
            }
            .environmentObject(locations)
        }
    }
}
