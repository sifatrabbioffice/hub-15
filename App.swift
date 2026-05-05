import SwiftUI
import SpriteKit

// MARK: - Main Application
@main
struct WinHubApp: App {
    var body: some Scene {
        WindowGroup {
            EmulatorCoreView()
        }
    }
}

// MARK: - Emulator Core Engine
struct EmulatorCoreView: View {
    var body: some View {
        ZStack {
            // 1. The Game Rendering Layer (Where the .exe output appears)
            Color.black.ignoresSafeArea()
            
            // Placeholder for the Windows VM / Stream Output
            VStack {
                Text("VIRTUAL MACHINE ACTIVE")
                    .font(.caption)
                    .foregroundColor(.green)
                Spacer()
            }

            // 2. The Virtual Gamepad Overlay
            VirtualGamepad()
        }
        .statusBar(hidden: true)
    }
}

// MARK: - Virtual Gamepad UI
struct VirtualGamepad: View {
    var body: some View {
        HStack {
            // Left Stick (Movement)
            JoystickView()
                .padding(.leading, 50)
            
            Spacer()
            
            // Right Buttons (Action: A, B, X, Y)
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    ActionButton(label: "Y", color: .yellow)
                }
                HStack(spacing: 40) {
                    ActionButton(label: "X", color: .blue)
                    ActionButton(label: "B", color: .red)
                }
                ActionButton(label: "A", color: .green)
            }
            .padding(.trailing, 50)
        }
        .padding(.bottom, 30)
    }
}

// Component for Action Buttons
struct ActionButton: View {
    let label: String
    let color: Color
    var body: some View {
        Circle()
            .fill(color.opacity(0.6))
            .frame(width: 60, height: 60)
            .overlay(Text(label).bold().foregroundColor(.white))
            .onTapGesture {
                print("Button \(label) pressed") // Map to Windows Key Events
            }
    }
}

// Component for Joystick
struct JoystickView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.2))
                .frame(width: 150, height: 150)
            Circle()
                .fill(Color.gray.opacity(0.8))
                .frame(width: 70, height: 70)
        }
    }
}
