// VARIABLES IN SOLIDITY

pragma solidity >=0.7.0 <0.9.0; /* Pragma Is the directive used to specify the version of compiler for your solidity*/

contract Basics {
    /* Solidity has the following varaiable data types:
integer, string, bool, bytes arrays, enum, struct, mapping (dictionary in python)*/

    //INTEGERS
    /*int = signed integers, thus they can contain both positve and negative numbers*/

    int256 public a = 4; // default =0
    int8 public b = 10;
    /* To get the range of values = 2^8 = 256 (-128 to 128), thus int8 cant accept any value above 128 or below -128. uint8 = 256 - 0 to 255*/
    int16 public c = 20;

    /*uint = unsigned integers, they only accept positive values
    uint8 = 256 - 0 to 255 */

    uint8 public d = 30;
    uint256 public e = 19;

    /**Hint: Understanding the range of values of your numbers or variable will help you to write cost efficient smart contracts ie if the range of your numbers is 100, there is no need of using uint256,but use uint8 so that you will pay less gas fee and vice versa */

    //STRING
    string public name = "Mars"; //default is ""

    //BOOL
    bool public tf = true; //default is false

    //BYTES
    /*bytes, converts any string you put into hexadecimals
    www.AsciiTable.com
*/
    bytes public byteSample = "abc"; //0x616263
    bytes public byteSample2 = "ABC"; //0x414243

    //ARRAYS
    //arrays - combination of same type of data E.g, names of students in a class
    string[] public students = ["Mars", "Ifeanyi"]; //dynamic array
    string[10] public students2; //fixed length arrays.[10], implies you can only store a maximum of 10 names in the array
    uint256[] public sampleint = [1, 2, 3, 4];
    // The concept push, pop, length in array, are possible in solidity also

    //MAPPING
    /*mapping = Key Value pairs, is similar to dictionary in Python and Objects in JavaScript.
    In mapping any combination of keys to values is possible ie Keys or values can be of any data type*/
    mapping(string => bool) public map;

    //ENUMERATION
    /*enum - Enumeration - save storage, confine options for users you can use enum to set options that the users can pick from, thus the users can't select/put anything that is not in the enum. enum must always be of the same data type unlike mapping
    Enum is used when you have a constant list of items that do not change ie we use enum to create custom variable types*/
    enum Cities {
        LosAngeles,
        California,
        SanJose,
        Toronto
    }
    Cities public city1 = Cities.LosAngeles; //Creating new variable called city1 from the enum data type
    Cities public city2 = Cities.SanJose;

    //STRUCT
    /*struct is used to store multiple data types together
    Array = Similar data types, but struct = multiple data types*/
    struct Student {
        string name;
        bool attendance;
        int256 rollNo;
        int256 marks;
    }
    Student public student1;
}
