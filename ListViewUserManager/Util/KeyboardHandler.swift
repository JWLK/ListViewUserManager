//
//  KeyboardAdaptive.swift
//  ListViewUserManager
//
//  Created by JWLK on 2021/04/18.
//

import Foundation
import SwiftUI
import Combine

struct KeyboardHandler: ViewModifier {
    @State private var offset: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, offset)
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
                    let value = notif.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    let height = value.height
                    let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom
                    let customOffset: CGFloat = -10
                    self.offset = height - (bottomInset ?? 0) + customOffset
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notif in
                    self.offset = 0
                }
            }
    }
}

extension View {
    func keyboardHandler() -> ModifiedContent<Self, KeyboardHandler> {
        return modifier(KeyboardHandler())
    }
}

