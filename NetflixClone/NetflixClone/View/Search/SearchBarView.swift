//
//  SearchBarView.swift
//  NetflixClone
//
//  Created by Apple on 9/12/20.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var becomeFirstResponder: Bool
    @State private var text: String = ""
    @State private var isEditTextField = false

    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    print("Clear text")
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.black)
                })
                    .padding(.leading, 8)

                CustomTextField(becomeFirstResponder: $becomeFirstResponder, text: $text, isEdit: $isEditTextField)
                    .configure {
                        $0.tintColor = .gray
                        $0.textColor = .white
                    }
                    .frame(height: 40)

                if isEditTextField {
                    Button(action: {
                        text = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                    })
                        .padding(.trailing, 8)
                }
            }
            .background(Color.gray)
            .cornerRadius(8)

            Button(action: {
                becomeFirstResponder = false
            }, label: {
                Text("Cancel")
                    .font(.title2)
                    .foregroundColor(.white)
            })
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBarView(becomeFirstResponder: .constant(true))
        }
    }
}
