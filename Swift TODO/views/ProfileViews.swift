//
//  ProfileViews.swift
//  Swift TODO
//
//  Created by Abbas Chaudhary on 18/10/2023.
//

import SwiftUI

struct ProfileViews: View {
    @StateObject var viewmodel = ProfileViewVM()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewmodel.user{
                   profile(user: user)
                }else{
                    Text("Loading profile...")
                }
                
            }.navigationTitle("Profile")
    
        }.onAppear{
            viewmodel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user:User) -> some View {
        VStack{
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 125,height: 125)
                .padding()
            
            VStack(alignment:.leading){
                HStack{
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                }
                .padding()
                HStack{
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                .padding()
                HStack{
                    Text("Member Since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
                .padding()
            }
            .padding()
            
            Button{
                //
                viewmodel.logout()
            }label: {
                Text("Log out")
            }.foregroundColor(.red)
                .padding()
        }
        Spacer()
       
    }
}

#Preview {
    ProfileViews()
}
