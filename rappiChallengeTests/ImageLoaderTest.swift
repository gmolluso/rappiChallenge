//
//  ImageLoaderTest.swift
//  rappiChallengeTests
//
//  Created by Gustavo Molluso on 04/05/2022.
//

import XCTest
@testable import rappiChallenge

class ImageLoaderTest: XCTestCase {
    
    private var movie : Movie!
    private var imageLoader: ImageLoader!
    
    override func setUpWithError() throws {
        movie = Movie(id: 618529, title: "Doctor Strange in the Multiverse of Madness", backdropPath: "/5ZuctJh5uX5L2dz1CjA7WsTJwZk.jpg", posterPath: "/bm7UlW3ctMJAvD6NNXrCDdRyyKn.jpg", overview: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.", voteAverage: 7.6, voteCount: 48, runtime: 126, releaseDate: "2022-05-04", genres: [MovieGenre(name: "Fantasy"), MovieGenre(name: "Action"), MovieGenre(name: "Adventure")], credits: MovieCredit(cast: [MovieCast(id: 71580, character: "Stephen Strange / Sinister Strange / Defender Strange", name: "Benedict Cumberbatch")], crew: [MovieCrew(id: 531, job: "Original Music Composer", name: "Danny Elfman")]), videos: MovieVideoResponse(results: [MovieVideo(id: "626eede47cffda510ab17d14", key: "__Gugj6R8F0", name: "Change", site: "YouTube")]))
        
        imageLoader = ImageLoader()
    }
    
    override func tearDownWithError() throws {
        imageLoader = nil
    }
    
    func test_successful_load_image() async throws{

        XCTAssertNotNil(imageLoader.loadImage(with: movie.backdropURL))
    }
    
}
