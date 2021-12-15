/*
  Statistics.swift
  
  By Zefeng Wang
  Created on December 7, 2021
  
  This program reads the three files, then calculates and displays the mean, median,
  and mode of the list of integers within those files. 
*/

// import the Foundation module
import Foundation

// Calculate the mean of all values in the array
func calcMean(arr: [Int]) -> Double {
	var sum = 0.0
	for num in arr {
		sum += Double(num)
	}
	return sum / Double(arr.count)
}

// Calculate the median of all values in the array
func calcMedian(arr: [Int]) -> Double {
	let midIndex = Double(arr.count-1) / 2.0
	// check if midIndex is an integer
	if midIndex.truncatingRemainder(dividingBy: 1.0) == 0 {
		return Double(arr[Int(midIndex)])
	} else {
		return Double(arr[Int(floor(midIndex))] + arr[Int(ceil(midIndex))]) / 2.0
	}
}
// Calculate the mode of all values in the array
func calcMode(arr: [Int]) -> Int {
	var maxValue = 0
	var maxCount = 0
	for index in arr {
		var count = 0
		for countIndex in arr where index == countIndex {
			count += 1
		}
		if count > maxCount {
			maxCount = count
			maxValue = index
		}
	}
	return maxValue
}

// Read the contents of a file and convert it into an integer array

	let text = try String(contentsOfFile: "/home/ubuntu/environment/files/Unit1-06/set3.txt")
	let strArr = text.components(separatedBy: "\n")

	var intArr = [Int]()
	for index in 0..<strArr.count {

		// Checks if each element can be cast into an Int
		if let element = Int(strArr[index]) {
			intArr.append(element)
			
			// Calls each function and displays the result for each
			if intArr.count == strArr.count {
				intArr.sort()

        			// Display the results
        			print("The Mean of the numbers in set1.txt is \(calcMean(arr: intArr))")
        			print("The Median of the numbers in set1.txt is \(calcMedian(arr: intArr))")
        			print("The Mode of the numbers in set1.txt is \(calcMode(arr: intArr))")
			}
		} else {
			print("This file contains an invalid value.")
			break
		}
	}
