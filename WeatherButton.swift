//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Fauzan Nugraha on 20/10/22.
//

import SwiftUI

struct weatherButton: View {
    
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
