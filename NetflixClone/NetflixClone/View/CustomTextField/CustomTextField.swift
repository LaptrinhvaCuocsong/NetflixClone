//
//  CustomTextField.swift
//  NetflixClone
//
//  Created by Apple on 9/12/20.
//

import Foundation
import SwiftUI

struct CustomTextField: UIViewRepresentable {
    @Binding var becomeFirstResponder: Bool
    @Binding var text: String
    @Binding var isEdit: Bool

    private let textField = UITextField()

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(parent: CustomTextField) {
            self.parent = parent
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.becomeFirstResponder = true
            }
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            DispatchQueue.main.async {
                self.parent.isEdit = true
            }
            return true
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.isEdit = false
            }
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.text = textField.text ?? ""
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator(parent: self)
        return coordinator
    }

    func makeUIView(context: Context) -> UITextField {
        textField.delegate = context.coordinator
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
//        if becomeFirstResponder {
//            uiView.becomeFirstResponder()
//        } else {
//            uiView.resignFirstResponder()
//            becomeFirstResponder = false
//        }
    }

    func configure(_ configure: (UITextField) -> Void) -> Self {
        configure(textField)
        return self
    }
}
