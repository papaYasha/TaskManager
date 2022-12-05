import SwiftUI

struct IntroView: View {
    
    @State var showWalkthroughPage: Bool = false
    @State var currentIndex = 0
    
    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea()
            
            introScreen()
            
            walkThroughScreens()
            
            navBar()

            
        }
        .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85), value: showWalkthroughPage)
    }
    
    // MARK: Walkthrough screens
    @ViewBuilder
    func walkThroughScreens() -> some View {
        GeometryReader {
            let size = $0.size
            
            ZStack {
                // MARK: Walkthough content
                ForEach(intros.indices, id: \.self) { index in
                    screenView(size: size, index: index)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // MARK: Next Button
            .overlay(alignment: .bottom) {
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 55, height: 55)
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 30, style: .circular)
                            .fill(Color("Black"))
                    }
                    .onTapGesture {
                        currentIndex += 1
                    }
                    .offset(y: -110)
            }
            .offset(y: showWalkthroughPage ? 0 : size.height)
        }
    }
    
    
    @ViewBuilder
    func screenView(size: CGSize, index: Int) -> some View {
        let intro = intros[index]
        
        VStack(spacing: 10) {
            Text(intro.title)
                .font(.custom(Constants.sansBold, size: 28))
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Text(Constants.loremIpsum)
                .font(.custom(Constants.sansRegular, size: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)

            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
        }
    }
    
    // MARK: Nav Bar
    @ViewBuilder
    func navBar() -> some View {
        HStack {
            Button {
                if currentIndex > 0 {
                    currentIndex -= 1
                } else {
                    showWalkthroughPage.toggle()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Black"))
            }
            
            Spacer()
            
            Button("Skip") {
                
            }
            .font(.custom(Constants.sansRegular, size: 16))
            .foregroundColor(Color("Black"))
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: showWalkthroughPage ? 0 : -120)
    }
    
    // MARK: Intro Screen (fall down animation)
    @ViewBuilder
    func introScreen() -> some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 10) {
                Image("man1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height / 2)
                    .padding(.top, 80)
                
                Text("Clearhead")
                    .font(.custom(Constants.sansBold, size: 27))
                    .offset(y: -55)
                
                Text(Constants.loremIpsum)
                    .font(.custom(Constants.sansRegular, size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .offset(y: -50)
                
                Text("Let's Begin")
                    .font(.custom(Constants.sansSemiBold, size: 14))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 14)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(Color("Black"))
                    }
                    .onTapGesture {
                        showWalkthroughPage.toggle()
                    }
                
                    .padding(.top, -25)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .offset(y: showWalkthroughPage ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
