//
//  NavbarView.swift
//  xshop
//
//  Created by AlexX on 2024-12-07.
//

import SwiftUI

struct NavbarView: View {
    @StateObject private var viewModel = NavbarViewModel()
    
    var body: some View {
        ZStack {
            // Main Navbar
            HStack {
                // Hamburger Menu Button
                Button(action: { viewModel.toggleMenu() }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding()
                }
                
                Spacer()
                
                // Title
                Text("My App")
                    .font(.headline)
                
                Spacer()
                
                // User Menu Button
                Button(action: { viewModel.toggleUserMenu() }) {
                    Image(systemName: "person.circle")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding()
                }
            }
            .frame(height: 60)
            .background(Color(.systemBackground))
            .shadow(radius: 2)
            
            // Side Menu
            if viewModel.isMenuOpen {
                SideMenuView(viewModel: viewModel)
                    .transition(.move(edge: .leading))
            }
            
            // User Menu
            if viewModel.isUserMenuOpen {
                UserMenuView(isOpen: $viewModel.isUserMenuOpen, userName: viewModel.userName)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

// SideMenuView.swift
struct SideMenuView: View {
    @ObservedObject var viewModel: NavbarViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Button(action: { viewModel.toggleMenu() }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .padding()
                    }
                    
                    MenuLink(icon: "house", title: "Home") {
                        viewModel.handleMenuAction(.home)
                    }
                    
                    MenuLink(icon: "person", title: "Profile") {
                        viewModel.handleMenuAction(.profile)
                    }
                    
                    MenuLink(icon: "gear", title: "Settings") {
                        viewModel.handleMenuAction(.settings)
                    }
                    
                    MenuLink(icon: "bell", title: "Notifications") {
                        viewModel.handleMenuAction(.notifications)
                    }
                    
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.75)
                .background(Color(.systemBackground))
                .shadow(radius: 5)
                
                Spacer()
            }
        }
        .background(Color.black.opacity(0.3))
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            viewModel.toggleMenu()
        }
    }
}

// UserMenuView.swift
struct UserMenuView: View {
    @Binding var isOpen: Bool
    let userName: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .trailing) {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text(userName)
                            .font(.headline)
                        Spacer()
                        Button(action: { isOpen.toggle() }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Divider()
                    
                    Button(action: {}) {
                        Label("View Profile", systemImage: "person")
                    }
                    
                    Button(action: {}) {
                        Label("Settings", systemImage: "gear")
                    }
                    
                    Button(action: {}) {
                        Label("Sign Out", systemImage: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(width: 200)
                .offset(y: 60)
                .padding()
                
                Spacer()
            }
        }
        .background(Color.clear)
        .edgesIgnoringSafeArea(.all)
    }
}

// MenuLink.swift
struct MenuLink: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: icon)
                .foregroundColor(.primary)
                .padding(.horizontal)
        }
    }
}

#Preview {
    NavbarView()
}
