//
//  Fitness_Challenge_Widget.swift
//  Fitness Challenge Widget
//
//  Created by Dave Pope on 29/12/2021.
//

import WidgetKit
import SwiftUI
import Intents

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

    //Placeholder data
    var athlete = ["Dave", "Chris", "Jena", "Jean", "Rachel", "Tom M", "Elle", "Tom P"]
    var images = ["Dave", "Chris", "Jena", "Jean", "Rachel", "TomM", "Elle", "TomP"]
    var medal = ["🥇", "🥈", "🥉", " ", " ", " ", " ", " "]
    var time = ["30h 20m", "28h 10m", "20h 30m", "15h 40m", "14h 20m", "12h 10m", "10h 5m", "5h 4m"]
    
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
                    ForEach(0..<athlete.count-4) { index in
                        HStack{
                            ZStack{
                                Image(self.images[index])
                                    .resizable()
                                    .frame(width: 56, height: 56, alignment: .center)
                                Text(self.medal[index])
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .offset(x: -16, y: 16)
                            }
//                            Text(self.athlete[index]).offset(x: -10)
//                            Spacer()
                            Text(self.time[index])
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
                                    .frame(width: 56, height: 56, alignment: .center)
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
struct Fitness_Challenge_Widget: Widget {
    let kind: String = "Fitness_Challenge_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Fitness_Challenge_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Fitness_Challenge_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Fitness_Challenge_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
