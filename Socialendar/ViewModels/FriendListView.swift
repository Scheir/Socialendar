import SwiftUI

struct FriendListView: View {
    @State private var friends: [String] = ["Alice", "Bob", "Charlie"]

    var body: some View {
        NavigationView {
            List {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                }
                .onDelete(perform: deleteFriend)
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addFriend) {
                        Label("Add Friend", systemImage: "plus")
                    }
                }
            }
        }
    }

    func addFriend() {
        // Example logic to add a new friend
        friends.append("New Friend")
    }

    func deleteFriend(at offsets: IndexSet) {
        friends.remove(atOffsets: offsets)
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}

