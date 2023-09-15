//
//  12 ContentView (Exercise - PhotoList).swift
//  SwiftUICounter
//
//  Created by Márcio Oliveira on 19/08/2023.
//

import SwiftUI

class ApiClient<T: Decodable> {
    var fetch: (String) async -> Result<T, Error> = { urlString in
        let url = URL(string: urlString)!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try .success(JSONDecoder().decode(T.self, from: data))
        } catch {
            return .failure(error)
        }
    }
}

struct Photo: Decodable, Identifiable {
    var id: String
    var author: String
    var width: Int
    var height: Int
    var url: String
    var download_url: String
}

class ViewModel: ObservableObject {
    let apiClient = ApiClient<[Photo]>()
    @Published var photoItems: [Photo]?
    @Published var clientError: String?

    func fetch(urlString: String) async {
        switch await apiClient.fetch(urlString) {
        case .success(let items):
            photoItems = items
            clientError = nil
        case .failure(let error):
            clientError = error.localizedDescription
            photoItems = nil
        }
    }
}

struct PhotoView: View {
    let urlString: String

    init(_ urlString: String) {
        self.urlString = urlString
    }

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.gray)
        }
    }
}

struct ContentView12: View {
    @ObservedObject var model = ViewModel()
    var body: some View {
        NavigationView {
            if let error = model.clientError {
                Text(error)
            } else if let photoItems = model.photoItems {
                List {
                    ForEach(photoItems) { photo in
                        NavigationLink(destination: PhotoView(photo.download_url),
                                       label: {
                            Text(photo.author)
                        })
                    }
                }
            } else {
                Text("Loading...")
            }
        }.task {
            await model.fetch(urlString: "https://picsum.photos/v2/list")
        }
    }
}

struct ContentView12_Previews: PreviewProvider {
    enum MockError: LocalizedError {
        case anError
        var errorDescription: String? { "Something went wrong" }
    }

    static var previews: some View {
        Group {
            getView(with: .success([
                stubPhoto(id: "1", author: "Márcio"),
                stubPhoto(id: "2", author: "Vanele")
            ]),
                    name: "Success")
            getView(with: .failure(MockError.anError),
                    name: "Failure")
            getView(with: .failure(MockError.anError),
                    name: "Loading",
                    loading: 2)
        }
    }

    static func getView(with result: Result<[Photo], Error>,
                        name: String,
                        loading: Int = 0) -> some View {
        let contentView = ContentView12()
        contentView.model.apiClient.fetch = { _ in
            try? await Task.sleep(for: .seconds(loading))
            return result
        }
        return contentView.previewDisplayName(name)
    }


    static func stubPhoto(id: String, author: String) -> Photo {
        Photo(id: id,
              author: author,
              width: 0,
              height: 0,
              url: "",
              download_url: "")
    }
}
