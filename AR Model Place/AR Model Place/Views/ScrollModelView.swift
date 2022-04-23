//
//  ScrollModelView.swift
//  AR Model Place
//
//  Created by uiskim on 2022/04/23.
//

import SwiftUI

struct ScrollModelView: View {
    
    var images = ["chair_swan", "flower_tulip", "gramophone", "teapot", "toy_biplane", "tv_retro"]
    
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(0..<images.count) { item in
                    PickerImageView(model: Image(images[item]))
                }
            }
        }.background(Color.black.opacity(0.5))
    }
}

struct ScrollModelView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollModelView()
    }
}
