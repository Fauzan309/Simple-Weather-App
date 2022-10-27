//
//  ContentView.swift
//  WeatherApp
//
//  Created by Fauzan Nugraha on 14/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false // boolean for change dark mode
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight) // color
            
            VStack {
                cityTextView(cityName: "Jakarta, ID")
                
                weatherMainContentView(weatherMainTemperature: 28, weatherMainStatus: "Mostly Cloudy", weatherMainImage: isNight ? "moon.stars.fill" : "cloud.fill")
                            
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.fill",
                                   temperature: 26)
                    
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 27)
                    
                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 30)
                    
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 28)
                    
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "cloud.rain.fill",
                                   temperature: 26)
                    
                    WeatherDayView(dayOfWeek: "Sun",
                                   imageName: "sun.max.fill",
                                   temperature: 31)
                }
                .padding(.top, 40)
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    weatherButton(title: "Change Day Time",
                                  backgroundColor: Color.white,
                                  foregroundColor: Color.blue)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color.white)
        }
    }
}

struct BackgroundView: View {
    
   @Binding var isNight: Bool // child of isNight state
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .trailing,
                       endPoint: .bottomLeading)
        .edgesIgnoringSafeArea(.all)
    }
}

struct cityTextView: View {
    
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 50)
    }
}

struct weatherMainContentView: View {
    
    var weatherMainTemperature: Int
    var weatherMainStatus: String
    var weatherMainImage: String
    var body: some View {
        Text("\(weatherMainTemperature)")
            .font(.system(size: 30, weight: .medium, design: .default))
            .foregroundColor(.white)
        Text(weatherMainStatus)
            .font(.system(size: 20))
            .foregroundColor(.white)
        Image(systemName: weatherMainImage)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    } // refactoring
}

