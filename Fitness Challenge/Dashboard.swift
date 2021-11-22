//
//  Dashboard.swift
//  Fitness Challenge
//
//  Created by Dave Pope on 21/10/2021.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        ScrollView (.vertical) {
            VStack{
                VStack (alignment: .center){
                    Text("🏆")
                        .font(.system(size: 140))
                    Text("November challenge")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Most time spent exercising")
                        .font(.title3)
                    Text("30 days left")
                        .font(.body)
                }
                VStack{
                    HStack{
                        ZStack{
                            Image("Dad")
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                            Text("🥇")
                                .font(.title)
                                .fontWeight(.bold)
                                .offset(x: -30, y: 20)
                        }
                        Text("Chris")
                        Spacer()
                        Text("1hr 27min")
                    }
                    HStack{
                        ZStack{
                            Image("Dave")
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                            Text("🥈")
                                .font(.title)
                                .fontWeight(.bold)
                                .offset(x: -30, y: 20)
                        }
                        Text("Dave")
                        Spacer()
                        Text("1hr 15min")
                    }
                    HStack{
                        ZStack{
                            Image("Jena")
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                            Text("🥉")
                                .font(.title)
                                .fontWeight(.bold)
                                .offset(x: -30, y: 20)
                        }
                        Text("Jena")
                        Spacer()
                        Text("1hr 10min")
                    }
                    HStack{
                        Image("Mum")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("Jean")
                        Spacer()
                        Text("50 min")
                    }
                    HStack{
                        Image("Elle")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("Elle")
                        Spacer()
                        Text("40min")
                    }
                    HStack{
                        Image("Rachel")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("Rachel")
                        Spacer()
                        Text("35min")
                    }
                    HStack{
                        Image("TomM")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("Tom M")
                        Spacer()
                        Text("20min")
                    }
                    HStack{
                        Image("TomP")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("Tom P")
                        Spacer()
                        Text("10min")
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.trailing)
            }
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
