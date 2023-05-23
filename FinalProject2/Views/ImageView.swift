

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

}
