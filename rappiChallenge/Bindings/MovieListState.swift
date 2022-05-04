//
//  MovieListObservableObject.swift
//  rappiChallenge
//
//  Created by Gustavo Molluso on 03/05/2022.
//

import SwiftUI

@MainActor
class MovieListState: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: MovieService
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) async {
        self.movies = nil
        self.isLoading = true
        if NetworkManager().isConnected != true {
            switch endpoint {
            case .upcoming:
                self.movies = Movie.offlineUpcomigMovies
            case .topRated:
                self.movies = Movie.offlineTopRatedMovies
            case .popular:
                self.movies = Movie.offlinePopularMovies
            }
        }
        
        do{
            let movies = try await movieService.fetchMovies(from: endpoint)
            self.isLoading = false
            self.movies = movies
            
        } catch {
            self.isLoading = false
            self.error = error as NSError
        }
    }
    
}

