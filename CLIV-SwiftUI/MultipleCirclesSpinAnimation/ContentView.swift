//
//  ContentView.swift
//  CLIV-SwiftUI
//
//  Created by ZyfarBektashov on 7/27/20.
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
            ForEach(0..<5) { i in
                    Circle()
                        .foregroundColor(self.indicatorColor)
                        .frame(width: self.indicatorWidth * 0.25, height: self.indicatorHeight * 0.25)
                        .offset(y: -self.indicatorHeight * 0.5)
                        .rotationEffect(self.isAnimating ? .degrees(0) : .degrees(-360))
                        .animation(Animation.timingCurve(0.5, Double(i) * 0.3, 0.25, 1, duration: self.indicatorAnimationDuration).repeatForever(autoreverses: false))
                        .onAppear { self.isAnimating.toggle() }
            }
        }
    }
    
    private let indicatorWidth: CGFloat = 50.0
    private let indicatorHeight: CGFloat = 50.0
    private let indicatorColor: Color = .blue
    private let indicatorBackgroundColor: Color = .white
    private let indicatorAnimationDuration: Double = 1.5
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
