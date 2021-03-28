import SwiftUI

struct Detail: View {
    @Binding var selectedProperty: Property
    @Binding var show: Bool

    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            ZStack {
                Image(selectedProperty.image)
                    .frame(width: UIScreen.main.bounds.width, height: 550)
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -150)
                    .padding(.bottom, -200)
                
                HStack {
                    Button(action: {
                        withAnimation(.spring()) {
                            show.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "bell")
                        .font(.system(size: 23))
                        .foregroundColor(.white)
                }
                .padding()
                .offset(y: -150)
                
                PropertyData(selectedProperty: $selectedProperty)
            }
            
            GeometryReader{ geo in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        AuthorData()
                        
                        ItemDescription(selectedProperty: $selectedProperty)
                    }
                }.padding(.top, 2)
            }
            .background(Color.white)
            .clipShape(Rounded())
            .padding(.top, -75)
        }
    }
}

struct PropertyData : View {
    @Binding var selectedProperty: Property
    
    var body: some View {
        HStack {
          Text("FOR SALE")
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.white)
            .padding(4)
        }
        .background(Color(#colorLiteral(red: 0.9895398021, green: 0.751301825, blue: 0.1393036246, alpha: 1)))
        .cornerRadius(3)
        .offset(x: -146, y: -5)
        
        HStack {
            Text(selectedProperty.title)
            .font(.system(size: 26, weight: .heavy))
            .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "heart")
                .font(.system(size: 23))
                .foregroundColor(.white)
        }
        .padding()
        .offset(x: 0, y: 30)
        
        HStack {
            HStack {
                Image(systemName: "map")
                    .foregroundColor(.white)
                
                Text("California")
                    .font(.system(size: 13, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                
                Image(systemName: "rectangle.3.offgrid")
                    .foregroundColor(.white)
                
                Text("4,100 sq/m")
                    .font(.system(size: 13, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
            }
                
            Spacer()
            
            HStack(spacing: 1) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 13))
                    
                Text("4.4 Reviews")
                    .font(.system(size: 13, weight: .bold, design: .default))
                    .foregroundColor(Color.white)
            }
            
        }
        .padding()
        .offset(x: 0, y: 65)
    }
}

struct AuthorData : View {
    var body: some View {
        HStack {
            Image("32")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 55, height: 55)
                .cornerRadius(15)
            
            VStack {
                Text("James Milner")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .bold))
                    .offset(x: -8)
                
                Text("Property Owner")
                    .foregroundColor(.gray)
                    .font(.system(size: 17, weight: .medium))
            }
            .padding(.leading, 5)
            
            Spacer()
            
            HStack {
                    Button(action: {}) {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.9895398021, green: 0.751301825, blue: 0.1393036246, alpha: 1)))
                            .padding(8)
                    }
                .background(Color(#colorLiteral(red: 0.9907606244, green: 0.9760382771, blue: 0.9415817857, alpha: 1)))
                .clipShape(Circle())
                
                Button(action: {}) {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0.9895398021, green: 0.751301825, blue: 0.1393036246, alpha: 1)))
                        .padding(8)
                }
                .background(Color(#colorLiteral(red: 0.9907606244, green: 0.9760382771, blue: 0.9415817857, alpha: 1)))
                .clipShape(Circle())
            }
            .padding()
        }
        .padding()
        .padding(.leading, 10)
    }
}

struct ItemDescription : View {
    @Binding var selectedProperty: Property
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.system(size: 17, weight: .bold))

            Spacer()

            Text(selectedProperty.description)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.gray)

            Spacer(minLength: 20)

            Text("Photos")
                .font(.system(size: 17, weight: .bold))

            Spacer()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3), spacing: 0) {
                ForEach(properties) { property in
                    Image(property.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                }
            }
        }
        .padding()
    }
}

struct Rounded : Shape {
    func path(in rect: CGRect) -> Path {
        //Bug IOS14
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30, height: 30))
        
        return Path(roundedRect: rect, cornerSize: CGSize(width: 30, height: 30))
    }
}
