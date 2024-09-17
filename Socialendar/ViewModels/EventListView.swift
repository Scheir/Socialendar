import SwiftUI

struct EventListView: View {
    @State private var events: [String] = ["Meeting with Bob", "Dinner with Alice", "Gym"]

    var body: some View {
        NavigationView {
            List {
                ForEach(events, id: \.self) { event in
                    Text(event)
                }
                .onDelete(perform: deleteEvent)
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addEvent) {
                        Label("Add Event", systemImage: "plus")
                    }
                }
            }
        }
    }

    func addEvent() {
        // Example logic to add a new event
        events.append("New Event")
    }

    func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}

