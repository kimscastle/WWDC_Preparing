//
//  ContentView.swift
//  AR Model Place
//
//  Created by uiskim on 2022/04/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            ScrollModelView()
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
