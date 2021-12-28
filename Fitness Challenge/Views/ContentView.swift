//
//  ContentView.swift
//  Fitness Challenge
//
//  Created by Dave Pope on 21/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DashboardWithFirebase()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
             ContentView().preferredColorScheme($0)
        }
    }
}
