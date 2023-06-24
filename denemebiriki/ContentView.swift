//
//  ContentView.swift
//  denemebiriki
//
//  Created by SUNGU on 24.06.2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State var showImmersiveSpace = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        NavigationSplitView {
            List {
                Text("İletişim")
                Text("Hakkımızda")
            }
            .navigationTitle("Asebay")
        } detail: {
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)

                Text("Asebay Limited Şirketi")

                Toggle("Siteye Giriş yap", isOn: $showImmersiveSpace)
                    .toggleStyle(.button)
                    .padding(.top, 50)
                    .onChange(of: showImmersiveSpace) { newvalue, oldvalue in
                        if newvalue {
                            openWebsite()
                        }else {
                            print("error")
                        }
                    }
            }
            .navigationTitle("Asebay Web sitesi giriş")
            .padding()
        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
    }
}
func openWebsite() {
    guard let url = URL(string: "https://asebay.com.tr") else { return }
    UIApplication.shared.open(url)
}

#Preview {
    ContentView()
}
