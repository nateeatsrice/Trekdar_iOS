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
//@State tells swift this is live state changing variable
    @State var region = MKCoordinateRegion( //MK stands for MapKit
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),//CL Core Location
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )

    var body: some View {
// $region tells swift that there is a 2way binding (read,write) of the region state variable
        Map(coordinateRegion: $region, annotationItems: locations.places) {
            location in
// MapAnnotation lets us modify the map of the earth
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                    NavigationLink(destination: ContentView(location: location)) {//allows us to click on flag and open Content View for current location
                        Image(location.country)//image of the flag and image properties
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
