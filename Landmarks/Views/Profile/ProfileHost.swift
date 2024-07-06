//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15) {
      
                
                if editMode?.wrappedValue == .inactive {
                    ProfileSummary(profile: draftProfile)
                } else {
                    ProfileEditor(profile: $draftProfile)
                }
                
            }
         
        }
        .onChange(of: editMode!.wrappedValue, perform: { newValue in
            if newValue.isEditing {
                draftProfile = modelData.profile
            }
            else {
                modelData.profile = draftProfile
            }
        })
        .toolbar {
            EditButton()
                .submitLabel(SubmitLabel.done)
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
