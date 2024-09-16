//
//  CalendarView.swift
//  Socialendar
//
//  Created by Andre Scheir Johansson on 2024-09-16.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Date = Date()
    @State private var events: [Event] = [] // Replace with your data model

    var body: some View {
        VStack {
            // Display the current month
            Text(getMonthYear(from: selectedDate))
                .font(.headline)
                .padding()
            
            // Calendar grid
            CalendarGrid(selectedDate: $selectedDate, events: events)
                .padding()
            
            // Event List
            EventList(selectedDate: selectedDate, events: events)
                .padding()
        }
        .onAppear {
            fetchEvents(for: selectedDate)
        }
    }

    private func getMonthYear(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }

    private func fetchEvents(for date: Date) {
        // Fetch events from your data source
        // Example placeholder code
        self.events = [] // Replace with actual fetch logic
    }
}

struct CalendarGrid: View {
    @Binding var selectedDate: Date
    var events: [Event]
    
    var body: some View {
        // Example grid layout
        // This should be replaced with actual calendar logic
        VStack {
            // Header with days of the week
            HStack {
                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }
            // Calendar days
            ForEach(1...30, id: \.self) { day in
                Text("\(day)")
                    .frame(width: 40, height: 40)
                    .background(self.isEventDay(day) ? Color.red : Color.clear)
                    .cornerRadius(5)
                    .onTapGesture {
                        // Handle date selection
                        self.selectedDate = self.dateForDay(day)
                    }
            }
        }
    }
    
    private func isEventDay(_ day: Int) -> Bool {
        // Determine if there is an event on this day
        return false // Replace with actual logic
    }
    
    private func dateForDay(_ day: Int) -> Date {
        // Convert day to date
        return Date() // Replace with actual logic
    }
}

struct EventList: View {
    var selectedDate: Date
    var events: [Event]
    
    var body: some View {
        List {
            ForEach(eventsForDate(selectedDate), id: \.id) { event in
                Text(event.title)
            }
        }
    }
    
    private func eventsForDate(_ date: Date) -> [Event] {
        // Filter events for the selected date
        return events.filter { event in
            // Replace with actual date comparison
            return true
        }
    }
}

// Example Event model
struct Event {
    var id: UUID
    var title: String
    var date: Date
}
