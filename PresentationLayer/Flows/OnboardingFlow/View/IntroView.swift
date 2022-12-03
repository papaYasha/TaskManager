import SwiftUI

struct IntroView: View {
    
    @State var showWalkthroughPage: Bool = false
    
    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea()
            
            navBar()

            introScreen()
            
        }
        .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85), value: showWalkthroughPage)
    }
    
    // MARK: 
    @ViewBuilder
    func walkThroughScreens() -> some View {
        
    }
    
    // MARK: Nav Bar
    @ViewBuilder
    func navBar() -> some View {
        HStack {
            Button {
                showWalkthroughPage.toggle()
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
