import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            if Constants.isAuthTokenValid {
                Home()
                    .navigationTitle("Task Manager")
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                IntroView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
