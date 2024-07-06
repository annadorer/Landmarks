//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                VStack(spacing: 20) {
                    Text(profile.username)
                        .bold()
                        .font(.title)
                    Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                    Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                    Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                }
                .padding(.bottom, 15)
                
                Divider()
                
                Text("Complted Badges")
                    .font(.headline)
                
                ScrollView {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                    .padding(.bottom)
                }
            }
        }
        .padding(.all, 24)
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
