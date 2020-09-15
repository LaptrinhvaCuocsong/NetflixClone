//
//  CustomPickerView.swift
//  NetflixClone
//
//  Created by Apple on 9/6/20.
//

import SwiftUI

struct CustomPickerView: View {
    var values: [String]
    @Binding var selectedIndex: Int
    @Binding var isShowPickerView: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(0 ..< values.count) { index in
                        let isSelected = selectedIndex == index

                        Button(action: {
                            self.selectedIndex = index
                        }, label: {
                            Text(values[index])
                                .font(.system(size: 28, weight: isSelected ? .bold : .regular))
                                .padding(.vertical, 16)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            
            Button(action: {
                self.isShowPickerView = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 60))
            })
        }
        .foregroundColor(.white)
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerView(values: ["Nguyen Manh Hung", "Nguyen Van Dat", "Nguyen Hai Dang", "Nguyen Vi Quynh", "Nguyen Dinh Hieu"], selectedIndex: .constant(0), isShowPickerView: .constant(true))
    }
}
