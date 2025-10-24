//
//  TrekdarApp.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/20/25.
// The main.swift file

import SwiftUI

@main
struct TrekrApp: App {
// @State works fine with stuct however for class we need @StateObject for a class instantiated object
    @StateObject var locations = Locations()

    var body: some Scene {
        WindowGroup {
            TabView { //needed for tabs in home screen
// The NavigationView allows the app to not crowd the top of the screen when scrolling down.
// This is supper useful for apps where we dont want clunky overlap of text with the notification bar
                NavigationView {
                    ContentView(location: locations.primary)// location.primary is the first location in the array (The Highlands)
                }
// The following tab items contain the name of each tab (Discover, Locations, and Tips)
// Above each tab name there is a small icon which is the Image(systemName: " ")
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Discover")
                }
//
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
// .environmentObject(locations) basically takes the location object we created and puts in
// in our local environment. this is used mainly in WorldView.swift at @EnvironmentObject var locations
            .environmentObject(locations)
        }
    }
}
