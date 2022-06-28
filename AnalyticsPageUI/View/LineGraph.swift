//
//  LineGraph.swift
//  AnalyticsPageUI
//
//  Created by MINH DUC NGUYEN on 28/06/2022.
//

import SwiftUI

// Custom View...
struct LineGraph: View {
    // Number of plots
    var data: [CGFloat]
    
    @State var currentPlot = ""
    @State var offset: CGSize = .zero
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                let height = proxy.size.height
                let width = proxy.size.width / CGFloat(data.count - 1)
                
                let maxPoints = (data.max() ?? 0) + 100
                // Getting progress and multiplyinh with height
                let points = data.enumerated().compactMap { item -> CGPoint in
                    let progress = item.element / maxPoints
                    // height
                    let pathHeight = progress * height
                    // width..
                    let pathWidth = width * CGFloat(item.offset)
                    // Since we need peak to top not bottom
                    return CGPoint(x: pathWidth, y: -pathHeight + height)
                }
                // Converting plot as points....
                
                // Path
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLines(points)
                }
                .strokedPath(StrokeStyle(lineWidth: 2.6, lineCap: .round, lineJoin: .round))
                .fill(
                    // Gradient...
                    LinearGradient(colors: [
                        Color("Gradient1"),
                        Color("Gradient2")
                    ], startPoint: .leading, endPoint: .trailing)
                )
                
                // Path Background Coloring ...
                FillBG()
                // Clipping the shape...
                .clipShape(
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLines(points)
                        path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                        path.addLine(to: CGPoint(x: 0, y: height))
                    }
                )
//                .padding(.top, 15)
            }
            .overlay(
                // Drag Indiccator...
                VStack(spacing: 0) {
                    Text(currentPlot)
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Color("Gradient1"), in: Capsule())
                }
            )
        }
        .padding(.horizontal, 10)
    }
    @ViewBuilder
    func FillBG() -> some View {
        LinearGradient(colors: [
        Color("Gradient2")
            .opacity(0.3),
        Color("Gradient2")
            .opacity(0.2),
        Color("Gradient2")
            .opacity(0.1)
        ]
        + Array(repeating: Color("Gradient1").opacity(0.1), count: 4)
        + Array(repeating: Color.clear, count: 2),
        startPoint: .top, endPoint: .bottom)
    }
}


struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
