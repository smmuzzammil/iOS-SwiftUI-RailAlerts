//
//  HomeView.swift
//  RailAlerts
//
//  Created by Admin on 12/05/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Divider()
                    .background(Color.black.opacity(0.5))
                    .frame(height: 1)
                
                ForEach(0..<ConstantData.homeData.count, id: \.self) { i in
                    let rowData = ConstantData.homeData[i]
                    let rowHeight = UIScreen.main.bounds.size.width * (i == 1 ? 0.2 : 0.4)
                    HStack {
                        ForEach(0..<rowData.count, id: \.self) { j in
                            let item = rowData[j]
                            let title = item.title.rawValue
                            NavigationLink(destination: DetailView(homeData: item)) {
                                CustomImageView(image: Image(item.image.rawValue), title: title)
                                    .frame(height: rowHeight)
                            }
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .navigationBarItems(
                leading: HStack {
                    Text("Home")
                        .bold()
                        .padding(.leading)
                        .foregroundColor(.white)
                    Spacer()
                },
                trailing: HStack {
                    Spacer()
                    Button(action: {
                        print("Notification button tapped")
                    }) {
                        Image(systemName: "bell")
                    }
                    .padding(.trailing)
                    .tint(.white)
                }
            )
        }
    }
}

struct CustomImageView: View {
    let image: Image
    let title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            VStack {
                Spacer()
                HStack {
                    Text(title)
                        .foregroundColor(.white)
                        .bold()
                        .shadow(radius: 10)
                        .background(
                            Text(title)
                                .blur(radius: 10)
                                .foregroundColor(.gray) // Make the text transparent
                        )
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .background(
                            Image(systemName: "chevron.right")
                                .blur(radius: 10)
                                .foregroundColor(.gray) // Make the text transparent
                        )
                }
                .padding()
            }
        }
        .background(Color.brown)
        .cornerRadius(10)
    }
}
