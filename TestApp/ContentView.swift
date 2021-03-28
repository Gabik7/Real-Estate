import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        if log_Status {
            Home()
        } else {
            Login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
