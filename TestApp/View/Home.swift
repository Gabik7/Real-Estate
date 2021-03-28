import SwiftUI

struct Home: View {
    @State var show = false
    
    @AppStorage("log_status") var log_Status = false
    
    @State var selectedTab = "house.fill"
    
    init() {
        UITabBar.appearance().isHidden = true;
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView(show: $show)
                .tag("house.fill")
            
            Text("Location")
                .tag("location.fill")
            
            Text("Favorites")
                .tag("heart.fill")
            
            Text("User")
                .tag("person.fill")
        }.overlay(
            VStack(spacing: 12) {
                Divider()
                    .padding(.horizontal, -15)
                
                HStack(spacing: 0) {
                    TabBarButton(image: "house.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "location.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "heart.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    
                    TabBarButton(image: "person.fill", selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, edges?.bottom ?? 15)
            .background(Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)))
            .opacity(show ? 0 : 1)
            , alignment: .bottom)
        .ignoresSafeArea()
    }
}

struct HomeView: View {
    @State var selected = tabs[0]
    @Namespace var animation
    
    @State var selectedProperty: Property = properties[0]
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    })
                    
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("32")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 45, height: 45)
                            .cornerRadius(15)
                    })
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                
                ScrollView{
                    VStack{
                        HStack{
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Find Your Perfect")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                                
                                Text("Property")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                ForEach(tabs, id: \.self){tab in
                                    TabButton(title: tab, selected: $selected, animation: animation)
                                    
                                    if tabs.last != tab{
                                        Spacer(minLength: 0)
                                    }
                                }
                            }
                            .padding()
                            .padding(.top, 5)
                        }
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 1), spacing: 0) {
                            ForEach(properties) { property in
                                CardView(property: property, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedProperty = property
                                            show.toggle()
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .opacity(show ? 0 : 1)
        
            if show {
                Detail(selectedProperty: $selectedProperty, show: $show
                       , animation: animation)
            }
        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            selectedTab = image
        }, label: {
            Image(systemName: image)
                .font(.system(size: 17))
                .foregroundColor(selectedTab == image ? Color(#colorLiteral(red: 0.08087431639, green: 0.2188317478, blue: 0.5864536762, alpha: 1)) : Color(#colorLiteral(red: 0.8195264935, green: 0.8196648955, blue: 0.8195083141, alpha: 1)))
        })
    }
}

var tabs = ["All", "Residential", "Commercial", "Rural"]

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var edges = UIApplication.shared.windows.first?.safeAreaInsets
