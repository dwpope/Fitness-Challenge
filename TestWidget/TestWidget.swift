//
//  TestWidget.swift
//  TestWidget
//
//  Created by Dave Pope on 31/12/2021.
//

import WidgetKit
import SwiftUI
import Intents
import Firebase

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct Fitness_Challenge_WidgetEntryView : View {
    var entry: Provider.Entry

    //Need two columns of data for the widget
    var athlete = ["Dave", "Chris", "Jena", "Jean", "Rachel", "Tom M", "Elle", "Tom P"]
    var images = ["Dave", "Chris", "Jena", "Jean", "Rachel", "TomM", "Elle", "TomP"]
    var medal = ["🥇", "🥈", "🥉", " ", " ", " ", " ", " "]
    var time = ["33h 20min", "28h 10min", "20h 30min", "15h 40min", "14h 20min", "12h 10min", "10h 5min", "5h 4min"]
    
    @ObservedObject var model = UserViewModel()
    
    init(entry: Provider.Entry) {
        self.entry = entry
        model.getData()
    }
    
    var body: some View {
        VStack{
            VStack{
                Text("7 days left")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Most exercise in November")
                    .font(.title3)
            }
            Spacer()
            
            //Placeholder display
            HStack {
                VStack (alignment: .leading) {
                    ForEach(model.list.sorted {$0.position < $1.position}) { user in
                        HStack{
                            ZStack{
                                Image(user.avatar)
                                    .resizable()
                                    .frame(width: 52, height: 52, alignment: .center)
                                Text(user.medal)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .offset(x: -16, y: 16)
                            }
                            Text(user.time)
                                .offset(x: -8)
                                .font(.body)
                        }
                    }
                }
                Spacer()
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 0.5, height: 240)
                Spacer()
                VStack (alignment: .leading){
                    ForEach(4..<athlete.count) { index in
                        HStack{
                            ZStack{
                                Image(self.images[index])
                                    .resizable()
                                    .frame(width: 52, height: 52, alignment: .center)
                                Text(self.medal[index])
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .offset(x: -16, y: 20)
                            }
//                            Text(self.athlete[index]).offset(x: -10)
//                            Spacer()
                            Text(self.time[index])
                                .offset(x: -8)
                                .font(.body)
                        }
                    }
                }
            }
        }.padding(16)
    }
}

@main
struct TestWidget: Widget {
    let kind: String = "TestWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Fitness_Challenge_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TestWidget_Previews: PreviewProvider {
    static var previews: some View {
        Fitness_Challenge_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
