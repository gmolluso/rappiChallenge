//
//  MovieSearchView.swift
//  rappiChallenge
//
//  Created by Gustavo Molluso on 03/05/2022.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieSearchState: MovieSearchState
    init() {
        self._movieSearchState = ObservedObject(wrappedValue: MovieSearchState())
    }
    
    
    
    var body: some View {
        NavigationView {
            List {
//                SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
//                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    Task {
                        await self.movieSearchState.search(query: self.movieSearchState.query)
                    }
                }
                
                if self.movieSearchState.movies != nil {
                    ForEach(self.movieSearchState.movies!) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                Text(movie.yearText)
                            }
                        }
                    }
                }
                
            }
            .searchable(text: self.$movieSearchState.query)
            .onAppear {
                self.movieSearchState.startObserve()
            }
            .navigationBarTitle("Search")
        }
        .navigationViewStyle(.stack)
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
