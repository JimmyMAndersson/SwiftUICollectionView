import PlaygroundSupport
import SwiftUI

struct ContentView: View {
  @State var data: [Int]
  
  var body: some View {
    VStack {
      CollectionView<CollectionViewCell>(items: $data)
      
      Button("Tap to add data!") {
        self.data.append(.random(in: 1...10))
      }
      .padding(.bottom)
    }
    .navigationBarTitle("Hello, CollectionView!", displayMode: .inline)
  }
}

var data = [Int](repeating: .random(in: 1...10), count: 2)

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = UIHostingController(rootView:
  NavigationView {
    ContentView(data: data)
  }
)
