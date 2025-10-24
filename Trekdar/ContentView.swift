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
                .font(.title3)// Slightly smaller title font but still bold
                .bold()
                .padding(.top)// Only add padding to the top of "Did you know?"

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
// The static is needed here since the example is included in the ContentView data structure
// This normally would lead to a recursive explosion but if we put static that stops this from happening.
// Static says that example is created only once and is shared everywhere. don't make infinite copied of example
    static var previews: some View {
// The NavigationView allows the app to not crowd the top of the screen when scrolling down.
// This is supper useful for apps where we dont want clunky overlap of text with the notification bar
        NavigationView {
            ContentView(location: Location.example)
        }
    }
}
