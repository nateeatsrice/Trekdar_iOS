//
//  TipsView.swift
//  Trekdar
//
//  Created by Nathaniel Rice on 10/23/25.
//

import SwiftUI

struct TipsView: View {
    let tips: [Tip]

    init() {
        let url = Bundle.main.url(forResource: "tips", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        tips = try! JSONDecoder().decode([Tip].self, from: data)
    }

    var body: some View {
        //if the tips from our list 
        List(tips, id: \.text, children: \.children) { tip in
            if tip.children != nil {
                Label(tip.text, systemImage: "quote.bubble")
                    .font(.headline)
            } else {
                Text(tip.text)//notice Last tip does not have children
            }
        }
// .navigationTitle() is an attached method on the NavigationView
// in TrekdarApp.swift, when scrolling down it fills in at the top
// of screen letting you know what section you are in.
        .navigationTitle("Tips")
    }
}
// The code below does not get uploaded to the app store when
// launched in production, it is used in xcode so we can see
// what the preview will look like.
struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
