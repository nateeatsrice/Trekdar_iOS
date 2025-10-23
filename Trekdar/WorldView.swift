//
//  WorldView.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/22/25.
//

import MapKit
import SwiftUI

struct WorldView: View {
    @EnvironmentObject var locations: Locations
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                NavigationLink(destination: ContentView(location: location)) {
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 80, height: 40)
                        .shadow(radius: 3)
                }
            }
        }
// .navigationTitle() is an attached method on the NavigationView
// in TrekdarApp.swift, when scrolling down it fills in at the top
// of screen letting you know what section you are in.
        .navigationTitle("Locations")
    }
}
// The code below does not get uploaded to the app store when
// launched in production, it is used in xcode so we can see
// what the preview will look like.
struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
