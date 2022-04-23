//
//  ContentView.swift
//  AR Model Place
//
//  Created by uiskim on 2022/04/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var modelData = ModelData()
    @State private var selectedModel: Model?
    @State private var isModelOnView = true
    var body: some View {
        
        let tap = TapGesture()
            .onEnded { _ in
                withAnimation {
                    isModelOnView.toggle()
                }
            }
        ZStack(alignment: .bottom) {
            ARViewContainer(selectedModel: $selectedModel).gesture(tap)
            if isModelOnView {
                ScrollModelView(models: modelData.models, selectedModel: $selectedModel)
                    .transition(.move(edge: .bottom))
            }else {
                AnimButton(selectedModel: $selectedModel)
                    .transition(.move(edge: .bottom))
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
