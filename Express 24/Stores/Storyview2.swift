//
//  Storyview2.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 21/02/24.
//

import SwiftUI

struct StoryView2: View {
    
    @EnvironmentObject var storyData: StoryViewModel
    
    var body: some View {

        if storyData.showStory {
            TabView(selection: $storyData.currentStory){
                
                //Stories...
                ForEach($storyData.stories) { $bundle in
                    
                    StoryCardView2(bundle: $bundle)
                        .environmentObject(storyData)

                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
     
            // Transition from bottom
            .transition(.move(edge: .bottom))
        }

    }
}

struct StoryView2_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of StoryViewModel to use as an environment object
        let storyViewModel = StoryViewModel()
        
        // Pass the environment object to the view
        StoryView2().environmentObject(storyViewModel)
    }
}


struct StoryCardView2:  View {
   
    @Binding var bundle: StoryBundle
    
    @EnvironmentObject var storyData: StoryViewModel
    
    //Timer And Changing Stories Based On Timer ...
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    //Progress ...
    @State var timerProgress: CGFloat = 0
    
    var body: some View {
        
        GeometryReader {proxy in
            
            ZStack {
                
                // Getting Current Index ...
                
                //And Updating Data ...
                let index = min(Int(
                    timerProgress),
                    bundle.stories.count - 1)
                
                    
                Image(bundle.stories[index].imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
            
            //tapping..
            .overlay(
            
                HStack {
                    
                    Rectangle()
                        .fill(.black.opacity(0.01))
                        .onTapGesture {
                            if (timerProgress - 1) < 0 {
                                
                                updateStory(forward: false)
                            } else {
                                timerProgress = CGFloat(Int(timerProgress - 1))
                            }
                        }
                    
                    Rectangle()
                        .fill(.black.opacity(0.01))
                        .onTapGesture {
                            //
                            if (timerProgress + 1) > CGFloat(bundle.stories.count) {
                                updateStory()
                            } else {
                                timerProgress = CGFloat(Int(timerProgress + 1))
                            }
                        }
                }
            
            
            )
            // Close Button
            .overlay(
            
             //Top profile View ...
                HStack(spacing: 13) {
                    
                    Image(bundle.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    
                    Text(bundle.profileImage)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            storyData.showStory = false
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                    })
                }
                .padding()
                
                ,alignment: .topTrailing
            )
            //Top timer Capsule
            .overlay(
           
                HStack(spacing: 5) {
                    ForEach(bundle.stories.indices) { index in
                        
                        let width = proxy.size.width
                        
                        //getting progress by eliminating current index width progress ...
                        //so that remaining all will be at 0 when previous is loading ...
                        
                        // Setting max to 1...
                        // Min to 0...
                        // For perfect timer ...
                        let progress = timerProgress - CGFloat(index)
                        let perfectProgress = min(max(progress, 0), 1)
                        
                        Capsule()
                        .fill(.gray.opacity(0.5))
                        .overlay(
                            
                            Capsule()
                                .fill(.white)
                                .frame(width: width * perfectProgress)
                            
                            
                            ,alignment: .leading
                        
                        )
                    }
                }
                .frame(height: 1.4)
                .padding(.horizontal)
                
                ,alignment: .top
            )
            //Rotation ...
            .rotation3DEffect(
                getAngle(proxy: proxy),
                axis: (x: 0, y: 1, z: 0),
                anchor: proxy.frame(
                    in: .global).minX > 0 ? .leading : .trailing,
                perspective: 2.5)
        }
        // Resetting Timer ...
        .onAppear(perform: {
            timerProgress = 0
        })
        .onReceive(timer) { _ in
            //Updading Seen Status on Realtime ...
            if storyData.currentStory == bundle.id {
                if !bundle.isSeen {
                    bundle.isSeen = true
                }
                
                // Updating Timer ...
                if timerProgress < CGFloat(bundle.stories.count) {
                    
                    timerProgress += 0.03
                } else {
                    updateStory()
                }
            }
            
        }
        
    }
    
    //Updating On End
    func updateStory(forward: Bool = true) {
        
        let index = min(Int(timerProgress), bundle.stories.count - 1)
        
        let story = bundle.stories[index]
        
        if !forward {
            if let first = storyData.stories.first, first.id != bundle.id {
                let bundleIndex = storyData.stories.firstIndex { currentBundle in
                    return bundle.id == currentBundle.id
                } ?? 0
                withAnimation {
                    storyData.currentStory = storyData.stories[bundleIndex - 1].id
                }
            } else {
                timerProgress = 0
            }
        }
        
        //Checing it its  last ...
        if let last = bundle.stories.last,last.id == story.id {
            
            //if there is another story then moving to that ...
            //else closing view...
            if let lastBundle = storyData.stories.last, lastBundle.id == bundle.id {
                
                withAnimation {
                    storyData.showStory = false
                }
                
                timerProgress = 0
            }
            else {
                
                let bundleIndex = storyData.stories.firstIndex { currentBundle in
                    return bundle.id == currentBundle.id
                    
                } ?? 0
                
                withAnimation {
                    storyData.currentStory = storyData.stories[bundleIndex + 1].id
                }
            }
        }
    }
    
    func getAngle(proxy: GeometryProxy) -> Angle {
        
        
        //conveting Offset into 45 Deg rotation ...
        let progress = proxy.frame(in: .global).minX / proxy.size.width
        
        let rotationAngle: CGFloat = 45
        let degress = rotationAngle * progress
        
        return Angle(degrees: Double(degress))
    }
}
