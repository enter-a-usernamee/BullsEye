//
//  ContentView.swift
//  BullsEye
//
//  Created by Malachi James on 8/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = 50.0
    @State private var targetValueTwo = 0
    @State private var currentValueTwo = 0.0
    @State private var difference: Int = 0
    @State private var score = 0
    @State private var round: Int = 1
    @State private var isEditing = false
    @State private var alertTitle = ""
          
    var body: some View {
              VStack {
                        VStack {
                                  HStack {
                                            Label(/*@START_MENU_TOKEN@*/"1"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/)
                                                      .padding(.top)
                                            VStack {
                                                      HStack {
                                                                Label(/*@START_MENU_TOKEN@*/"Put the Bull's Eye as close as you can to:"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/)
                                                                          .padding(.bottom)
                                                                          .frame(width: 280.0)
                                                                Label(String(targetValue), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/)
                                                                          .padding(.bottom)
                                                                          .frame(width: 33.0)
                                                                          
                                                      }
                                                      Slider(
                                                            value: $currentValue,
                                                            in: 0...100,
                                                            onEditingChanged: { editing in
                                                                isEditing = editing
                                                            }
                                                      )
                                                                .padding(.bottom)
                                                                .frame(width: 350.0, height: 75.0)
                                            }
                                            Label(/*@START_MENU_TOKEN@*/"100"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/)
                                                      .padding(.top)
                                  }
                                  Button("Hit Me!") {
                                      showAlert = true
                                      calculateDifference()
                                      determineTitle()
                                      score += 100 - difference
                                      holdValue()
                                      startNewRound()
                                  }
                                  .padding(.bottom, 30.0)
                                  .alert(isPresented: $showAlert) {
                                      Alert(
                                        title: Text(alertTitle),
                                        message: Text("The value of the slider is: \(lroundf(Float(currentValueTwo)))" + "\nThe target value is \(targetValueTwo)" + "\nThe difference is \(difference)" + "\nYou scored \(100 - difference) points")
                                        
                                )
                  }
                        }
                        .padding(.bottom)
                        HStack {
                                  HStack {
                                            HStack {
                                                      HStack {
                                                                Button(/*@START_MENU_TOKEN@*/"Start Over"/*@END_MENU_TOKEN@*/) {
                                                                    startNewGame()
                                                                }
                                                                .padding(.trailing)
                                                                Label(/*@START_MENU_TOKEN@*/"Score:"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/)
                                                                          .padding(.leading)
                                                      }
                                                      Label(String(score), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/)
                                                                .padding(.trailing)
                                                      Label(/*@START_MENU_TOKEN@*/"Round:"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/)
                                                                .padding(.leading)
                                            }
                                            Label(String(round), systemImage: /*@START_MENU_TOKEN@*/""/*@END_MENU_TOKEN@*/)
                                                      .padding(.trailing)
                                  }
                                  Button(/*@START_MENU_TOKEN@*/"!"/*@END_MENU_TOKEN@*/) {
                                  }
                                  .padding(.leading)
                        }
              }
    }
          
          func startNewRound() {
              targetValue = Int.random(in: 1...100)
              currentValue = 50.0
              round += 1
          }
          
          func calculateDifference() {
                    if (Int(currentValue) > targetValue) {
                              difference = Int(currentValue) - targetValue
                      } else if targetValue > Int(currentValue) {
                        difference = targetValue - Int(currentValue)
                    } else {
                        difference = 0
                      }
          }
          
          func determineTitle() {
                    if difference == 0 {
                        alertTitle = "Perfect!"
                      } else if difference < 5 {
                        alertTitle = "You almost had it!"
                      } else if difference < 10 {
                        alertTitle = "Pretty good!"
                    } else {
                        alertTitle = "Not even close..."
                      }
          }
          
          func startNewGame() {
              score = 0
              round = 0
              startNewRound()
          }
          
          func holdValue() {
              targetValueTwo = targetValue
              currentValueTwo = currentValue
          }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
              ContentView()
                        .padding()
                        .frame(width: 500.0, height: 250.0)
                        
    }
}
