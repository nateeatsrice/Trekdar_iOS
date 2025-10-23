//
//  ContentView.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/20/25.
//

import SwiftUI

struct ContentView: View {
    let location: Location

    var body: some View {
        ScrollView {
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()

            Text(location.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            Text(location.country)
                .font(.title)
                .foregroundColor(.secondary)

            Text(location.description)
                .padding(.horizontal)

            Text("Did you know?")
//              Slightly smaller title font
                .font(.title3)
                .bold()
//            only add padding to the tip of the 
                .padding(.top)

            Text(location.more)
                .padding(.horizontal)
        }
// .navigationTitle() is an attached method on the NavigationView
// in TrekdarApp.swift, when scrolling down it fills in at the top
// of screen letting you know what section you are in.
        .navigationTitle("Discover")
    }
}
// The code below does not get uploaded to the app store when
// launched in production, it is used in xcode so we can see
// what the preview will look like.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
// The NavigationView allows the app to not crowd the top of the screen when scrolling down.
// This is supper useful for apps where we dont want clunky overlap of text with the notification bar
        NavigationView {
            ContentView(location: Location.example)
        }
    }
}
