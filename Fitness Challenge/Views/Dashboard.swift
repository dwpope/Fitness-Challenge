//
//  Dashboard.swift
//  Fitness Challenge
//
//  Created by Dave Pope on 21/10/2021.
//
// TEST

import SwiftUI
import Firebase

struct Dashboard: View {
    
    var athlete = ["Dave", "Chris", "Jena", "Jean", "Rachel", "Tom M", "Elle", "Tom P"]
    var images = ["Dave", "Dad", "Jena", "Mum", "Rachel", "TomM", "Elle", "TomP"]
    var medal = ["🥇", "🥈", "🥉", " ", " ", " ", " ", " "]
    var time = ["30hr 20min", "28hr 10min", "20hr 30min", "15hr 40min", "14hr 20min", "12hr 10min", "10hr 5min", "5hr 4min"]
    
    var body: some View {
        
        VStack{
            VStack (alignment: .center){
                Text("🏆")
                    .font(.system(size: 96))
                Text("November challenge")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Most time spent exercising")
                    .font(.title3)
                Text("7 days left")
                    .font(.body)
            }
            ScrollView (showsIndicators: false) {
                ForEach(0..<athlete.count) { index in
                    HStack{
                        ZStack{
                            Image(self.images[index])
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                            Text(self.medal[index])
                                .font(.title)
                                .fontWeight(.bold)
                                .offset(x: -30, y: 20)
                        }
                        Text(self.athlete[index]).offset(x: -10)
                        Spacer()
                        Text(self.time[index])
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.trailing)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
