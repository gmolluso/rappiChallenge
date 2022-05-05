//
//  MovieListStateTest.swift
//  rappiChallengeTests
//
//  Created by Gustavo Molluso on 04/05/2022.
//

import XCTest


@testable import rappiChallenge


class MovieListStateTest: XCTestCase {
    
@MainActor
    func test_movieList() async throws {
        let result =  MovieListState()
        await result.loadMovies(with: MovieListEndpoint.upcoming)
        XCTAssert(result.movies!.count > 0)
    }
}

