//
//  MovieListView.swift
//  rappiChallenge
//
//  Created by Gustavo Molluso on 03/05/2022.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var upcomingState: MovieListState
    @ObservedObject private var topRatedState: MovieListState
    @ObservedObject private var popularState: MovieListState
//    MARK: Search bar
    @ObservedObject private var movieSearchState: MovieSearchState
    
    init() {
        self._upcomingState = ObservedObject(wrappedValue: MovieListState())
        self._topRatedState = ObservedObject(wrappedValue: MovieListState())
        self._popularState = ObservedObject(wrappedValue: MovieListState())
        
        self._movieSearchState = ObservedObject(wrappedValue: MovieSearchState())
    }
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    if upcomingState.movies != nil {
                        MovieThumbnailCarouselView(title: "Upcoming", movies: upcomingState.movies!, thumbnailType: .poster())
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            Task {
                                await self.upcomingState.loadMovies(with: .upcoming)
                            }
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .listRowSeparator(.hidden)
                
                Group {
                    if topRatedState.movies != nil {
                        MovieThumbnailCarouselView(title: "Top Rated", movies: topRatedState.movies!, thumbnailType: .backdrop)
                        
                    } else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            Task {
                                await self.topRatedState.loadMovies(with: .topRated)
                            }
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .listRowSeparator(.hidden)
                
                Group {
                    if popularState.movies != nil {
                        MovieThumbnailCarouselView(title: "Popular", movies: popularState.movies!, thumbnailType: .backdrop)
                        
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            Task {
                                await self.popularState.loadMovies(with: .popular)
                            }
                            
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                .listRowSeparator(.hidden)
            }
            .searchable(text: self.$movieSearchState.query)
            .listStyle(.plain)
            .navigationBarTitle("Rappi Challenge")
        }
        .onAppear {
            Task {
                await self.upcomingState.loadMovies(with: .upcoming)
                await self.topRatedState.loadMovies(with: .topRated)
                await self.popularState.loadMovies(with: .popular)
            }
           
           
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

