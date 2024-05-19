//
//  ContentView.swift
//  Meditation
//
//  Created by Tony Buffard on 2024-05-19.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTimer: Int = UserDefaults.standard.integer(forKey: "selectedTimer")
    @State private var playMinuteSound: Bool = UserDefaults.standard.bool(forKey: "playMinuteSound")
    @State private var playAmbientSound: Bool = UserDefaults.standard.bool(forKey: "playAmbientSound")
    @State private var doNotDisturb: Bool = UserDefaults.standard.bool(forKey: "doNotDisturb")

    let timers = [5, 10, 15, 20, 30, 45, 60]
    
    var body: some View {
        VStack {
            Text("Select your options").font(.headline).padding(.bottom, 5)
            
            Picker(selection: $selectedTimer, label: Text("Select a timer:")) {
                ForEach(timers, id: \.self) {timer in
                    Text("\(timer)").tag(timer)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.bottom, 20)
            .onChange(of: selectedTimer) { oldValue, newValue in
                UserDefaults.standard.set(newValue, forKey: "selectedTimer")
            }
            
            Toggle(isOn: $playMinuteSound) {
                Text("Play a sound every minute")
            }
            .onChange(of: playMinuteSound) { oldValue, newValue in
                UserDefaults.standard.set(newValue, forKey: "playMinuteSound")
            }
            Toggle(isOn: $playAmbientSound) {
                Text("Play ambient sound")
            }
            .onChange(of: playAmbientSound) { oldValue, newValue in
                UserDefaults.standard.set(newValue, forKey: "playAmbientSound")
            }
            Toggle(isOn: $doNotDisturb) {
                Text("Activate do not disturb")
            }
            .onChange(of: doNotDisturb) { oldValue, newValue in
                UserDefaults.standard.set(newValue, forKey: "doNotDisturb")
            }
            Spacer().frame(height: 20)
            
            Button("Start") {
                print("A button was pressed!")
            }.buttonStyle(.borderedProminent)
        }
        .frame(width: 180)
        .padding()
        .onAppear {
            if !timers.contains(selectedTimer) {
                selectedTimer = timers.first ?? 1
            }
        }
    }
}

#Preview {
    ContentView()
}
