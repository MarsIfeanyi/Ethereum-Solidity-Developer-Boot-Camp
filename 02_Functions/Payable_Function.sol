//Payable Function and Payable Address are special function and addresses which helps in payment to the smart contract and from the smart contract.

pragma solidity >=0.7.0 <0.9.0;

contract Basics {
    /* Solidity has the following varaiable data types:
integer, string, bool, bytes arrays, enum, struct, mapping (dictionary in python)*/
    //INTEGERS
    /* int = signed integers, thus they can contain both positve and negative numbers*/
    int256 public a = 4; // default =0
    int256 public temp1 = 10;
    int256 public temp2 = 20;
    int256 public sum;
    int8 public b = 10;
    int16 public c = 20;

    /*uint = unsigned integers, they only accept positive values
    uint8 = 256 - 0 to 255 */

    uint8 public d = 30;
    uint256 public e = 19;
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
    string[15] public students2; //fixed length arrays
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
    Student public student1; //Student1 of data type struct
    Student public student2;
    Student public student3;

    //FUNCTIONS

    /*Setter function = Functions that sets value
    No "View or Pure", because the function will change the state of the state variables*/
    function setSum(int256 _a, int256 _b) public {
        sum = _a + _b;
    }

    /*getter function = Function that returns value
    "View" tells solidity that you are not changing anything(state change) in the global variable ie you just want to Read and not Write, hence you wouldn't be charged gas fee*/
    function getSum() public view returns (int16 balance, int256 marks) {
        //wants you to be specific
        return (c, a);
    }

    //View this does not set value nor read the value
    function getSum2() public pure returns (int16 balance, bool attendance) {
        //wants you to be specific
        return (20, true);
    }

    function setString(string memory _name) public {
        name = _name;
    }

    function getString() public view returns (string memory studentName) {
        return name;
    }

    function setVariables() public {
        students.push("Joyce"); //Adds Joyce as the last element in the Students array
        students2[0] = "Mars";
        map["Blockchain Dev"] = true; //Mapping

        //Assigning values to the struct.
        student1.name = "Mars";
        student1.attendance = true;
        student1.rollNo = 34;
        student1.marks = 25;
        // global variables vs local variables
        Student memory tempStudent = Student({
            name: "Mars",
            attendance: true,
            rollNo: 25,
            marks: 99
        });
        student2 = tempStudent;
        tempStudent = Student("John", true, 36, 80);
        student3 = tempStudent;
    }

    function swap() public {
        int256 swapTemp = temp2; // no need to pay gas fee for a local variable
        temp2 = temp1;
        temp1 = swapTemp;
    }

    //PAYABLE FUNCTION
    // To send money to a contract the function need to be payable
    function payMoney() public payable {
        //do something
    }

    //ADDRESS
    address payable public investor;
    address payable public investor2;

    function getbalance() public view returns (uint256) {
        /**To return the balance of a contract, you will say address(this),ie address of this particular contract */
        return address(this).balance;
    }

    //To Send money to an address from the contract the address need to be payable
    function sendMoney() public {
        investor = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        investor.transfer(2 ether);
        investor2 = payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        investor2.transfer(1.5 ether);
    }
}
