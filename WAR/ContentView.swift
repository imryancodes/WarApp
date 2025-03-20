//  Created by Ryan Kiapour on 2/19/24.

import SwiftUI

struct ContentView: View {
    
   @State var playerCard = "back"
   @State var cpuCard = "back"
    @State private var showAlert = false
   @State var playerScore = 0
   @State var cpuScore = 0
    @State private var showAlert2 = false
    @State private var showAlert3 = false
    @State var plays = 10
   @State var left = " turns left"
    @State var closeAlert = 0
    var body: some View {
        
        ZStack {
            Image("background-cloth")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
           
                    Button(action: {showAlert2 = true}, label: {
                        VStack {
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .cornerRadius(35)
                                .padding([.bottom], 20)
                        }
                    })
                
               
                .alert(isPresented: $showAlert2) {
                        Alert(
                            title: Text("New game?"),
                            message: Text("Are you sure you want to reset your game"),
                            primaryButton: .default(
                                Text("No"),
                                action: closePopUp
                            ),
                            secondaryButton: .destructive(
                                Text("Yes"),
                                action: newGame
                            )
                        )
                    }
                
                
                    
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Button(action: {deal()}, label: {
                    Text("DEAL")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .border(Color.white, width: 5)
                    
                })
                .padding()
                
                Text(String(plays) + left)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
               
                Button("􀁝") {
                        showAlert = true
                }
                .padding(10)
              
                
                .font(.largeTitle).foregroundColor(.white)
                .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("How to play"),
                                    message: Text("Press deal to start, your card is on the left and the CPU's is on the left. Whoever has the highest card gets a point. You have 10 attemps to get the most points!")
                                )
                            }
                
             
                
                    
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            
                            
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                         
                            
                            
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            
                    }
                    Spacer()
                }
                Button("CREDITS") {
                        showAlert3 = true
                    
                }
                .padding([.bottom], 7)
                .font(.body).foregroundColor(.white)
                .alert(isPresented: $showAlert3) {
                                Alert(
                                    title: Text("Credits"),
                                    message: Text(
                                        """
                                        
                                        Code Created By: Ryan Kiapour
                                        
                                        
                                        """)
                                )
                            }
            }
        }
        
       
    }

    
    func deal() {
        let playerValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerValue)
        // Randomize the player's card
        let cpuValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuValue)
        //Radomizes the cpu's card
        plays -= 1
        if playerValue > cpuValue {
            //add one to player
            playerScore += 1
        }else if cpuValue > playerValue{
            //add one to cpu
            cpuScore += 1
            //Update the score
            
            
        }
        
        if plays == 1 {
            left = " turn left"
        }else{
            left = " turns left"
        }
        
        if plays == -1 {
            newGame()
        }
        
        if plays == 0 {
            if playerScore > cpuScore {
                left = " turns left, you win!"
            }else if cpuScore > playerScore{
                left = " turns left, you lost :("
            }else if playerScore == cpuScore{
                left = " turns left, it's a tie"
            }
        }
        
    }
    
    func newGame() {
        playerScore = 0
        cpuScore = 0
        playerCard = "back"
        cpuCard = "back"
        plays = 10
        closeAlert = 0
        left = " turns left"
        
    }
    
    func closePopUp() {
        closeAlert += 1
        if closeAlert == 10 {
            playerScore = 999
        }
        if closeAlert > 10 {
            playerScore = 9
            cpuScore = 1
            plays = 1
            deal()
        }
    }
    
   
   
    
    
    
}

#Preview {
    ContentView()
}
