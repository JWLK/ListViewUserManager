//
//  ContentView.swift
//  ListViewUserManager
//
//  Created by JWLK on 2021/04/12.
//

import SwiftUI
import PopupView

struct ContentView: View {
    //User Button Setting Value
    @State var settingkState: Bool = false
    
    //User List Setting Value
    @State var checkState: Bool = false
    
    //Popup Input Value
    @State var showingPopup : Bool = false
    @State var inputUserName: String = ""
    @State var inputUserAge: String = ""
    
    
    @StateObject var userListModel = UserListModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                //Spacer().background(Color.white).edgesIgnoringSafeArea(.top)
                ScrollView{
                    HStack(){
                        Text("User List")
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                        Button(action:{
                            showingPopup = true
                        }){
                            Image("UserAdd").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 24, minHeight: 24,  alignment: .center)
                                .foregroundColor(.dark333)
                        }
                        Spacer().frame(width: 20)
                        Button(action:{
                            
                        }){
                            Image("UserConfig").resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 24, minHeight: 24,  alignment: .center)
                                .foregroundColor(.dark333)
                        }
                    }
                    .background(Color.whiteFFF)
                    Spacer().frame(height:20)
                 
                    ForEach(userListModel.users) { users in
                        UserListView(user: users, settingkState: $settingkState, checkState: $checkState)
                    }
                }
                .padding(20)
                
                BackgroundFadeLayer(showingPopup: $showingPopup)
            }
            .navigationTitle("User Manager")
            .popup(isPresented: $showingPopup, type: .toast, position: .bottom, animation: Animation.spring(), closeOnTap: false, closeOnTapOutside: false) {
                UserAddViewPopup(showingPopup: $showingPopup, inputUserName: $inputUserName, inputUserAge: $inputUserAge )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct UserAddViewPopup: View {
    @Binding var showingPopup: Bool
    @Binding var inputUserName: String
    @Binding var inputUserAge: String

    var body: some View{
        ZStack{
            VStack {
                HStack{
                    Text("User Registration")
                        .foregroundColor(Color.dark333)
                        .font(.system(size: 21, weight: .bold))
                    Spacer()
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 50, minHeight: 70, alignment: .leading)
                
                
                VStack{
                    Text("User Name")
                        .foregroundColor(Color.gray707)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: UIScreen.main.bounds.width - 50, minHeight: 20, alignment: .leading)
                    VStack{
                        TextField("", text: $inputUserName )
                            .foregroundColor(Color.black)
                            .font(.system(size: 21, weight: .regular))
                        Spacer().frame(height:0)
                        Divider()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 50, minHeight: 30, alignment: .leading)
                    
                    Spacer().frame(height:30)
                    Text("User Age")
                        .foregroundColor(Color.gray707)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: UIScreen.main.bounds.width - 50, minHeight: 20, alignment: .leading)
                    VStack{
                        TextField("", text: $inputUserAge )
                            .foregroundColor(Color.black)
                            .font(.system(size: 21, weight: .regular))
                        Spacer().frame(height:0)
                        Divider()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 50, minHeight: 30, alignment: .leading)
                }
                
                Spacer()
                
                HStack{
                    Button(action: {
                        showingPopup = false
                    }) {
                        Text("Cancel")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.grayC4C)
                    }
                    .frame(width: UIScreen.main.bounds.width/3*1-25, height: 50)
                    .background(Color.fadeGray)
                    .cornerRadius(10.0)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Confirm")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.green400)
                    })
                    .frame(width: UIScreen.main.bounds.width/3*2-25, height: 50)
                    .background(Color.green200)
                    .cornerRadius(10.0)

                }
                
            }
            .padding(.top, 10)
            .padding(.bottom, 50)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 400)
            .background(Color.whiteFFF)
            .cornerRadius(20.0)
            .shadow(color: .shadowDark16, radius: 3, x: 0.0, y: -1.5)
            .edgesIgnoringSafeArea(.bottom)
        }
        .keyboardHandler()
        
        /*
        func addUserModel() {
            guard !inputUserName.trimmingCharacters(in: .whitespaces).isEmpty || !inputUserAge.isEmpty else {
                
                return
            }
            
//            let newUser = User(name: inputUserName, age: <#T##String#>, registDate: <#T##String#>, settingState: <#T##Bool#>, checkState: <#T##Bool#>)
        }*/
 
    }
}


struct BackgroundFadeLayer: View {
    @Binding var showingPopup: Bool
    var body: some View {
        GeometryReader { _ in
            EmptyView()
        }
        .background(Color.black.opacity(0.5))
        .opacity(showingPopup ? 1 : 0)
        .animation(Animation.easeIn)
        .onTapGesture {
            showingPopup = false
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
