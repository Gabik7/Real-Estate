import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_Status = false
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        if currentPage > totalPages {
            if log_Status {
                Home()
            } else {
                Login()
            }
        } else {
            WalkThrough()
        }
    }
}

struct WalkThrough: View {
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack {
            if currentPage == 1 {
            WalkThroughPage(image: "house1", title: "Discover the best property", description: "Find the best property you want by your location or neighbourhood.")
                .transition(.scale)
            }
            
            if currentPage == 2 {
            WalkThroughPage(image: "house2", title: "Discover the best property", description: "Find the best property you want by your location or neighbourhood.")
                .transition(.scale)
            }
            
            if currentPage == 3 {
            WalkThroughPage(image: "house3", title: "Discover the best property", description: "Find the best property you want by your location or neighbourhood.")
                .transition(.scale)
            }
        }.overlay(
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(currentPage == 1 ? Color(#colorLiteral(red: 0.08087431639, green: 0.2188317478, blue: 0.5864536762, alpha: 1)) : Color(#colorLiteral(red: 0.8195264935, green: 0.8196648955, blue: 0.8195083141, alpha: 1)))
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(currentPage == 2 ? Color(#colorLiteral(red: 0.08087431639, green: 0.2188317478, blue: 0.5864536762, alpha: 1)) : Color(#colorLiteral(red: 0.8195264935, green: 0.8196648955, blue: 0.8195083141, alpha: 1)))
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(currentPage == 3 ? Color(#colorLiteral(red: 0.08087431639, green: 0.2188317478, blue: 0.5864536762, alpha: 1)) : Color(#colorLiteral(red: 0.8195264935, green: 0.8196648955, blue: 0.8195083141, alpha: 1)))
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage+=1
                    }
                }) {
                    Image(systemName: "arrow.forward")
                        .foregroundColor(Color.white)
                        .padding()
                }
                .background(Color(#colorLiteral(red: 0.08087431639, green: 0.2188317478, blue: 0.5864536762, alpha: 1)))
                .cornerRadius(8)
            }
            .offset(y: 250)
            .padding()
            , alignment: .bottom)
    }
}

struct WalkThroughPage: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        VStack() {
            Image(image)
                .frame(width: UIScreen.main.bounds.width, height: 130)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .offset(y: -180)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text(description)
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(Color.gray)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

var totalPages = 3
