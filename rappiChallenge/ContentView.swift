//
//  ContentView.swift
//  rappiChallenge
//
//  Created by Gustavo Molluso on 28/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem{ Label("Movies", systemImage: "film")}
                .tag(0)
            MovieSearchView() 
                .tabItem{Label("Search", systemImage: "magnifyingglass")}
                .tag(1)
        }
//        FIXME: Todas las clases States las podemos pasar a una unica con las 3 funciones
//        FIXME: Cambiar Nombre
//        FIXME: Cambiar fuentes y agregar algun overlay
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
