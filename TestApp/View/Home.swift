import SwiftUI

struct Home: View {
    @AppStorage("log_status") var log_Status = false
    
    @State var selected = tabs[0]
    @Namespace var animation
    
    @State var show = false
    @State var selectedProperty: Property = properties[0]
    
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

var tabs = ["All", "Residential", "Commercial", "Rural"]

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
