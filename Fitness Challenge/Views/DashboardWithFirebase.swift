//
//  DashboardWithFirebase.swift
//  Fitness Challenge
//
//  Created by Dave Pope on 28/12/2021.
//

import SwiftUI
import Firebase

struct DashboardWithFirebase: View {
    
    @ObservedObject var model = UserViewModel()
    
    init() {
        model.getData()
    }
    
    var body: some View {
        
        VStack{
            VStack (alignment: .center){
                Text("🏆")
                    .font(.system(size: 96))
                Text("January challenge")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Most time spent exercising")
                    .font(.title3)
                Text("30 days left")
                    .font(.body)
            }
            
            //Couldn't figure out how to display in a ForEach loop like what I had done in the "Dashboard" file
            if #available(iOS 15.0, *) {
                List (model.list.sorted {$0.position < $1.position}) { item in
                    HStack(spacing: 8){
                        Image(item.avatar)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        // How do I sort the list based of time spent exercising?
                        // How do I stretch the List so it is full width?
                        Text(item.name)
                        Spacer()
                        Text(item.time)
                    }
                    
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .listStyle(PlainListStyle())
                .refreshable{
                    model.getData()
                }
            }
            else {
                Text("Please update your iOS")
            }
        }
    }
}

struct DashboardWithFirebase_Previews: PreviewProvider {
    static var previews: some View {
        DashboardWithFirebase()
    }
}


