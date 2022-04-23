//
//  PickerimageView.swift
//  AR Model Place
//
//  Created by uiskim on 2022/04/23.
//

import SwiftUI

struct PickerImageView: View {
    var model: Image
    var body: some View {
        model
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .aspectRatio(contentMode: .fit)
            .background(Color.white)
            .cornerRadius(20)
            .padding()
    }
}

struct PickerImageView_Previews: PreviewProvider {
    static var previews: some View {
        PickerImageView(model: Image("chair_swan"))
    }
}
