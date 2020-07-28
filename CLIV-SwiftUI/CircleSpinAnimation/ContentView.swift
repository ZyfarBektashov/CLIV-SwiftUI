//
//  ContentView.swift
//  CLIV-SwiftUI
//
//  Created by ZyfarBektashov on 7/25/20.
//  Copyright © 2020 ZyfarBektashov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomLoadingIndicatorView()
    }
}

struct CustomLoadingIndicatorView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(indicatorBackgroundColor)
                .frame(width: indicatorWidth * 2.5, height: indicatorHeight * 2.5)
                .shadow(radius: 5.0)
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(indicatorColor, style: StrokeStyle(lineWidth: indicatorLineWidth, lineCap: .round))
                .frame(width: indicatorWidth, height: indicatorHeight)
                .rotationEffect(self.isAnimating ? .degrees(360) : .degrees(0))
                .animation(Animation.linear(duration: indicatorAnimationDuration).repeatForever(autoreverses: false))
                .onAppear { self.isAnimating.toggle() }
        }
    }
    
    private let indicatorWidth: CGFloat = 50.0
    private let indicatorHeight: CGFloat = 50.0
    private let indicatorColor: Color = .blue
    private let indicatorLineWidth: CGFloat = 5.0
    private let indicatorBackgroundColor: Color = .white
    private let indicatorAnimationDuration: Double = 0.8
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
