#include <iostream>
#include <map>
#include <iterator>

int main()
{
    std::map<char, int> testOne;

    testOne['a'] = 1;
    testOne['b'] = 2;
    testOne['c'] = 3;
    //testOne.emplace('a', 50); //doesn't work bc a already exists
    testOne.emplace('e', 50);
    testOne.insert(std::pair<char, int> ('d', 10)); //inserts in order
    //will insert in order of value -> prints out a, b, c, d, e
    //testOne.insert(std::pair<char, int> ('f', 10));
    //^^also won't work bc 10 also already has a value
    testOne.emplace('f', 20); //just stacks on top

    for (auto& kv : testOne) {
        std::cout << kv.first << " has value " << kv.second << std::endl;
    }
        
    /*
     *std::map<char,int> testTwo (testOne.begin(),testOne.end());
     *
     *for (auto& kv : testTwo) {
     *    std::cout << kv.first << " has value " << kv.second << std::endl;
     *}
     *
     *std::map<char,int> testThree (testTwo);
     *
     *for (auto& kv : testThree) {
     *    std::cout << kv.first << " has value " << kv.second << std::endl;
     *}
     *this is just how to copy the maps if needed
     */


    /*
     *from what it looks like, the first column (a, b, c) are the actual
     *values from the map. 1, 2 , 3 do not coordinate where a, b, c would
     *be on a map like in an array. a, b, c simply hold the value given to it
     */

    //gonna start working on how to print it out like a 2d array...
}
