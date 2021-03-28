import SwiftUI

struct Property: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var rating: String
    var metrics: String
    var location: String
    var image: String
}

var properties = [
    Property(title: "Clinton Villa", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", price: "$2,3200.00", rating: "4.4", metrics: "4,200", location: "California", image: "house1"),
    Property(title: "Hilton House", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", price: "$2,3200.00", rating: "3.6", metrics: "4,200", location: "California",  image: "house2"),
    Property(title: "Ibe House", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", price: "$2,3200.00", rating: "5.0", metrics: "3,200", location: "California",  image: "house3")
]
