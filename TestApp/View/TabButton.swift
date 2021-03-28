//
//  TabButton.swift
//  TestApp
//
//  Created by Gabriel Falis on 13/03/2021.
//

import SwiftUI

struct TabButton: View {
    var title: String
    @Binding var selected: String
    
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }, label: {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(selected == title ? .white : Color(#colorLiteral(red: 0.5307152271, green: 0.5360976458, blue: 0.5711815953, alpha: 1)))
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    ZStack{
                        if selected == title {
                            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        } else {
                            Color(#colorLiteral(red: 0.8751199245, green: 0.8752670288, blue: 0.875100553, alpha: 1))
                                .clipShape(Capsule())
                        }
                    }
                )
        })
    }
}
