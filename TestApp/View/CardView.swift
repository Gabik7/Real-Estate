import SwiftUI

struct CardView: View {
    var property: Property
    var animation: Namespace.ID
    
    var body: some View {
            ZStack {
                Image(property.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .frame(height: 80)
                            .offset(y: 50)
                            .opacity(0.3)
                            .shadow(color: Color(.black), radius: 10, x: 10, y: 5)
                      )
                    .matchedGeometryEffect(id: "image\(property.id)", in: animation);
                
                HStack {
                  Text("FOR SALE")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.white)
                    .padding(4)
                }
                .background(Color(#colorLiteral(red: 0.9895398021, green: 0.751301825, blue: 0.1393036246, alpha: 1)))
                .cornerRadius(3)
                .offset(x: -135, y: -70)
                
                    VStack {
                        HStack {
                            Text(property.title)
                                .font(.system(size: 16, weight: .heavy, design: .default))
                                .foregroundColor(Color.white)
                                
                            Spacer()
                                
                            Text(property.price)
                                .font(.system(size: 16, weight: .heavy, design: .default))
                                .foregroundColor(Color.white)
                            
                        }
                        .padding([.trailing, .leading], 10)
                        .padding(.bottom, 3)
                    
                        HStack {
                            HStack {
                                Image(systemName: "map")
                                    .foregroundColor(.white)
                                
                                Text(property.location)
                                    .font(.system(size: 13, weight: .medium, design: .default))
                                    .foregroundColor(Color.white)
                                
                                Image(systemName: "rectangle.3.offgrid")
                                    .foregroundColor(.white)
                                
                                Text("\(property.metrics) sq/m")
                                    .font(.system(size: 13, weight: .medium, design: .default))
                                    .foregroundColor(Color.white)
                            }
                                
                            Spacer()
                            
                            HStack(spacing: 1) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 13))
                                    
                                Text("\(property.rating) Reviews")
                                    .font(.system(size: 13, weight: .bold, design: .default))
                                    .foregroundColor(Color.white)
                            }
                            
                        }
                        .padding([.trailing, .leading], 10)
                }.offset(x: 0, y: 65)
            }.cornerRadius(10.0)

            Spacer(minLength: 30)
        }
}
