//
//  CardView.swift
//  Memorize2021HW
//
//  Created by Vahtee Boo on 04.12.2021.
//

import SwiftUI

struct CardView: View {
    let emoji: String
    @State private var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(emoji).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}
