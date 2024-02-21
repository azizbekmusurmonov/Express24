//
//  StoriesViewController.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 19/02/24.
//

import SwiftUI
 

struct StoriesView: View {
    
    @StateObject var storyData = StoryViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    //showing  User Stories...
                    HStack(spacing: 12) {
                        
                        Button {
                            
                        } label: {
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(
                                    
                                    Image(systemName: "plus")
                                        .padding(7)
                                        .background(.blue, in:
                                                        Circle())
                                        .foregroundColor(.white)
                                        .padding(2)
                                        .background(.black, in: Circle())
                                        .offset(x: 10, y: 10)
                                    
                                    ,alignment: .bottomTrailing
                                    
                                    )
                        }
                        .padding(.trailing, 10)
                        
                        //stories 
                        ForEach($storyData.stories) { $bundle in
                            //Profile View ...
                            
                            ProfileVieww(bundle: $bundle)
                                .environmentObject(storyData)
                        }
                        
                        
                        
                        
                    }
                    .padding()
                    .padding(.top, 10)
                }
                
            }
            .navigationTitle("Express24")
        }
        .overlay(
            StoryView2()
                .environmentObject(storyData)
        )
        
//        .overlay(
//        
//            Button(action: {
//                withAnimation {
//                    storyData.showStory = false
//                }
//            }, label: {
//                Image(systemName: "xmark")
//                    .font(.title2)
//                    .foregroundColor(.black)
//            })
//            .padding()
//            
//            ,alignment: .topTrailing
//        )
    }
}

#Preview {
    StoriesView()
}

struct ProfileVieww: View {
    
    @Binding var bundle: StoryBundle
    
    @Environment(\.colorScheme) var scheme
    
    @EnvironmentObject var storyData: StoryViewModel
    
    var body: some View {
        Image(bundle.profileImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        
        // Progress Ring showing
        
            .padding(2)
            .background(scheme == .dark ? .black : .white, in:
            Circle())
            .padding(3)
            .background(
                
                LinearGradient(colors: [
                    .red,
                    .orange,
                    .red,
                    .orange
                ],
                startPoint: .top,
                endPoint: .bottom)
                .clipShape(Circle())
                .opacity(bundle.isSeen ? 0 : 1)
            )
            .onTapGesture {
                
                withAnimation {
                    bundle.isSeen = true
                    
                    storyData.currentStory = bundle.id
                    storyData.showStory = true
                }
            }
    }
}
