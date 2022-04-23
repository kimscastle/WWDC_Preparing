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
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(selectedModel: $selectedModel)
            ScrollModelView(models: modelData.models, selectedModel: $selectedModel)
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
