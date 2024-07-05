//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Anna on 05.07.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

extension ProfileEditor {
    private enum Strings {
        static let userName = "Username"
        static let enableNotifications = "Enable Notifications"
        static let seasonalPhotos = "Seasonal Photos"
        static let date = "Date"
    }
}

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    private var dateRange: ClosedRange<Date> {
        let minDate = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let maxDate = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return minDate...maxDate
    }
    
    var body: some View {
        List {
            HStack {
                Text(ProfileEditor.Strings.userName)
                TextField(ProfileEditor.Strings.userName, text: $profile.username)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text(ProfileEditor.Strings.enableNotifications)
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            .pickerStyle(.segmented)
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text(ProfileEditor.Strings.date)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(Profile.default))
    }
}
