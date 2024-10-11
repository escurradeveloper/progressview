//
//  ContentView.swift
//  Clase14ProgressViewCustom
//
//  Created by Escurra Colquis on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    @State private var tapButton = false
    
    var body: some View {
        Text("ProgressView Custom")
            .bold()
            .foregroundStyle(.black)
            .font(.system(size: 30))
            .padding(.top, 20)
        Spacer()
        
        
        
        if tapButton {
            ZStack {
                Text("Cargando")
                    .font(.headline)
                    .bold()
                Circle()
                    .stroke(Color(.systemGray4), lineWidth: 12)
                    .frame(width: 120, height: 120)
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(.cyan, lineWidth: 6)
                    .frame(width: 120, height: 120)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: isLoading)
                    .onAppear {
                        isLoading.toggle()
                    }
            }
        }

        Button {
            tapButton.toggle()
            isLoading = false
        } label: {
            Text(tapButton ? "Ocultar progress" : "Mostrar progress")
        }
        .buttonStyle(.borderedProminent)
        .font(.system(size: 40))
        .tint(.red)
        .padding(.top, 30)
        Spacer()
        
        VStack {
            Text("Mi canal en Youtube y Github:")
            Text("@escurradeveloper")
                .font(.system(size: 30))
        }
    }
}

#Preview {
    ContentView()
}
