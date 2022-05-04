//
//  NetworkStatusView.swift
//  rappiChallenge
//
//  Created by Gustavo Molluso on 04/05/2022.
//

import SwiftUI

struct NetworkStatusView: View {
    @ObservedObject var networkStatus = NetworkManager()
    var body: some View {
        ZStack{
            Color.clear
            GeometryReader{ geo in
                VStack{
                Spacer()
                    ZStack{
                        HStack(alignment: .center){
                            Spacer()
                            Capsule()
                                .stroke()
                                .frame(width: geo.size.width / 5, height: geo.size.width / 15)
                            Spacer()
                        }
                        HStack(alignment: .center, spacing: 3){
                            Spacer()
                            Text(networkStatus.isConnected ? "online" : "offline")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                            Circle()
                                .fill(networkStatus.isConnected ? Color.green : Color.red)
                                .frame(width: geo.size.width/20, height: geo.size.width/20)
                                .padding(4)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct NetworkStatusView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkStatusView()
    }
}
