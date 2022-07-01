//
//  Home.swift
//  AnalyticsPageUI
//
//  Created by MINH DUC NGUYEN on 28/06/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "slider.vertical.3")
                        .font(.title2)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
            }
            .padding()
            .foregroundColor(.black)
            
            VStack {
                Text("Total Balance")
                    .fontWeight(.bold)
                
                Text("$ 12 345")
                    .font(.system(size: 38, weight: .bold))
            }
            .padding()
            
            Button {
                
            } label: {
                HStack {
                    Text("Income")
                    Image(systemName: "chevron.down")
                }
                .font(.caption.bold())
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(.white, in: Capsule())
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
            }
            
            // Graph View...
            LineGraph(data: samplePlot)
            // Max Size
                .frame(height: 220)
                .padding(.top, 25)
            
            Text("Shorcuts")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    CardView(image: "bitcoin", title: "BITCOIN", price: "20000", color: Color.yellow)
                    CardView(image: "eth", title: "ETH", price: "1000", color: Color.green)
                    CardView(image: "XRP", title: "XRP", price: "200", color: Color.black.opacity(0.7))
                    CardView(image: "shiba", title: "SHIBA", price: "1", color: Color.orange)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"))
    }
}

//MARK: - Card View
@ViewBuilder
func CardView(image: String, title: String, price: String, color: Color) -> some View {
    VStack(spacing: 15) {
        Image(image)
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.white)
            .frame(width: 35, height: 35)
            .padding()
            .background(color, in: Circle())
        
        Text(title)
            .font(.title3.bold())
        
        Text("$ \(price)")
            .fontWeight(.semibold)
            .foregroundColor(.gray)
    }
    .padding(.vertical)
    .padding(.horizontal, 20)
    .background(.white, in: RoundedRectangle(cornerRadius: 15))
    .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
    .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Sample Plot For Graph....
let samplePlot: [CGFloat] = [300, 400, 700, 900, 1500, 1200, 600, 200, 500, 600, 900, 700, 1200, 1200, 1300, 1700, 1750]
