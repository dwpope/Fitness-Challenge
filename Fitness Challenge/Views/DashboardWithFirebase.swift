//
//  DashboardWithFirebase.swift
//  Fitness Challenge
//
//  Created by Dave Pope on 28/12/2021.
//


import SwiftUI
import Firebase

struct DashboardWithFirebase: View {
    
    @ObservedObject var vm = UserViewModel()
    // code with chris called it "model" instead of "vm"
    
    init() {
        vm.getData()
        // code with chris called it "model" instead of "vm"
    }
    
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
            
            List (vm.list.sorted {$0.position < $1.position}) { item in
                HStack{
                    // How do I reference the Avatar image to display in the list?
                    // How do I sort the list based of time spent exercising?
                    Text(item.name)
                    Spacer()
                    Text(item.time)
                }
            }
        }
    }
}

struct DashboardWithFirebase_Previews: PreviewProvider {
    static var previews: some View {
        DashboardWithFirebase()
    }
}

