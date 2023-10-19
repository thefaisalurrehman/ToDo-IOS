//
//  HeaderView.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle:String
    let angle:Double
    let background:Color
    var body: some View {
   
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top,80)
            
        }.frame(width: UIScreen.main.bounds.width*3,
                height: 350)
        .offset(y:-150)
        
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: Color.pink)
}
