//
//  UserListView.swift
//  ListViewUserManager
//
//  Created by JWLK on 2021/04/15.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    var id = UUID()
    let name: String
    let age: String
    let registDate: String
    let settingState: Bool
    let checkState: Bool
}

class UserListModel: ObservableObject {
    @Published var users: [User] = [
        User(name: "TEST", age: "22", registDate: "2021.04.23", settingState: false, checkState: false),
        User(name: "TEST", age: "22", registDate: "2021.04.23", settingState: false, checkState: false),
        User(name: "TEST", age: "22", registDate: "2021.04.23", settingState: false, checkState: false),
        User(name: "TEST", age: "22", registDate: "2021.04.23", settingState: false, checkState: false)
    ]
}

struct UserListView: View {
    let user: User
    
    @Binding var settingkState: Bool
    @Binding var checkState: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 3){
                Image("UserProfile").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 48, minHeight: 48,  alignment: .center)
                Spacer()
                VStack{
                    HStack{
                        Text(user.name)
                            .font(.system(size: 13, weight: .medium))
                            .lineLimit(1)
                        Spacer().frame(width:10)
                        Text(user.age)
                            .font(.system(size: 12, weight: .regular))
                        
                        Spacer().frame(width: 3)
                        Text(user.registDate)
                            .font(.system(size: 12, weight: .regular))
                        Spacer()
                    }
                    Spacer().frame(height:5)
                    HStack{
                        Text("Registraion")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.grayC4C)
                        Text(user.registDate)
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.grayC4C)
                        Spacer()
                    }
                }
                if !settingkState {
                    HStack{
                        if !checkState {
                            Text("SELECT")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.green400)
                        } else {
                            Image(systemName: "checkmark").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth:50, maxHeight:20, alignment: .center)
                                .foregroundColor(.green400)
                        }
                        
                    }
                } else {
                    HStack{
                        ZStack {
                            Text("EDIT")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.gray707)
                                .frame(width: 50, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .background(Color.fadeWhite)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        ZStack {
                            Text("DLETE")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.whiteFFF)
                                .frame(width: 50, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .background(Color.red200)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    }
                }
                
            }
            Divider()
        }
        .padding(.top, 5)

    }
}
