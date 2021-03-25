//
//  RotationAnimation.swift
//  DesignResearch
//
//  Created by Camille Khubbetdinov on 25.03.2021.
//

import Foundation
import SwiftUI

extension View {
    func rotationAnimation(isRotating: Binding<Bool>, lapTime: Binding<Double>) -> some View {
        self.modifier(RotationAnimation(lapTime: lapTime, isRotating: isRotating))
    }
}

struct RotationAnimation: ViewModifier {
    @Binding var lapTime: Double
    @Binding var isRotating: Bool
    func body(content: Content) -> some View {
        RotationView(isRotating: $isRotating, lapTime: $lapTime, content: {content})
    }
}

struct RotationView<Content>: View where Content: View {
    var content: Content
    @State var degrees = 0.0
    @Binding var lapTime: Double
    @Binding var isRotating: Bool
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    init(isRotating: Binding<Bool>, lapTime: Binding<Double>, @ViewBuilder content: () -> Content) {
        self._lapTime = lapTime
        self._isRotating = isRotating
        self.content = content()
    }
    var body: some View {
        content
            .rotationEffect(.init(degrees: degrees))
            .onReceive(timer, perform: { _ in
                if isRotating {
                    withAnimation(.linear(duration: 0.1)) {
                        self.degrees = degrees+36/(lapTime<=0 ? 0.01 : lapTime)
                    }
                }
            })
    }
}
