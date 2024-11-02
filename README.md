# 🎯 Algorithm Challenges Solutions Collection
Welcome to this collection of algorithmic challenges and their solutions! Here you'll find four interesting problems implemented in Logisim circuits, Assembly language and Python.

## 🎮 About
This repository contains solutions to 4 different algorithmic problems with varying difficulty levels. While all problems have relatively straightforward algorithmic solutions in Python, the real challenge lies in implementing them using digital logic circuits in Logisim and low-level Assembly language.

### 🔧 Technologies Used
[![Python](https://img.shields.io/badge/Python-3.9+-yellow.svg)](https://www.python.org/)
[![Logisim](https://img.shields.io/badge/Logisim-2.7.1-blue.svg)](http://www.cburch.com/logisim/)
[![Assembly](https://img.shields.io/badge/Assembly-NASM-red.svg)](https://www.nasm.us/)


#### Logisim 
Logisim is an educational tool for designing and simulating digital logic circuits. These circuits are built using basic components like:
- Logic gates (AND, OR, NOT, etc.)
- Flip-flops and registers for storing data
- Multiplexers and demultiplexers for routing signals
- Arithmetic units for mathematical operations
- And other digital components

#### Assembly Language 
Assembly is a low-level programming language that works directly with a computer's hardware. It provides direct control over the processor's operations through basic instructions like:
- Moving data between registers and memory
- Basic arithmetic operations
- Conditional jumps and loops
- Bit manipulation
This makes it challenging but powerful for implementing algorithms.

### 📚 Difficulty Scale
Problems are rated based on their implementation complexity in Logisim and Assembly:
- 📊 **Pyramid Volume (Easy)**: Basic arithmetic operations
- 🔢 **Counting Bits (Medium)**: Bit manipulation and counting
- ⚖️ **Set Difference (Medium-High)**: Complex data structure operations
- 🌳 **Binary Tree Height (High)**: Advanced tree traversal and memory management

Each problem includes:
- Detailed problem description
- Circuit implementation in Logisim 
- Assembly (NASM) solution
- Python pseudocode
- Extensive documentation and explanations

  
General description and other problems can be found in https://github.com/UH-Matcom-AC/Bolsa-Problemas-2024.

Now let's dive into the solutions! 🚀


# 🔍 Problem 1: Pyramid Volume (Easy)
## Description
Given a pyramid with base area B and height h, calculate its volume.

### Input
- Base area B (integer)
- Height h (integer) 

### Output 
Volume in cubic centimeters (cm³)

### Example
```plaintext
Input: B = 4, h = 3
Output: 4
```

### Formula
```plaintext
V = (B * h) / 3
```

## 📡 Logisim Solution: Pyramid Volume

### 🔧 Components Used
- 💾 **Registers**: 
  - Base Area Register (B)
  - Height Register (h)
- 🔄 **Controlled Buffer**: 
  - Input timing control
  - Precise data flow management
- 🧮 **Arithmetic Unit**:
  - Multiplication module (B * h)
  - Division module (/3)
- 📝 **ASCII Constants**:
  - Output formatting
  - Text display control

### ⚙️ Circuit Operation
1. 📥 **Input Stage**
- 🔹 Uses controlled buffer to read B from index 0
- 🔹 Loads B into first register 
- 🔹 Uses controlled buffer to read h from index 1
- 🔹 Loads h into second register

2. 🔄 **Calculation Stage** 
- 🔹 Multiplies B * h asynchronously
- 🔹 Divides result by 3 asynchronously
- 🔹 Result feeds into output stage

3. 📤 **Output Stage**
- 🔹 Uses UDec to convert result to decimal
- 🔹 Series of buffers with ASCII constants for "cm³" output
- 🔹 Wait states between character outputs
- 🔹 Final state prints complete result

### 🔍 Key Implementation Details
- 🔸 Asynchronous arithmetic avoids clock cycle delays
- 🔸 Controlled buffers ensure proper input timing
- 🔸 Wait states guarantee correct output formatting
  
## 💻 Assembly Solution: Pyramid Volume

### Implementation Overview
Simple implementation using basic arithmetic operations:
1. Loads base area and height into registers
2. Performs multiplication
3. Divides by 3 using integer division
4. Outputs result

For detailed implementation including register usage and exact steps, check the extensively commented assembly code above.


# 🔍 Problem 2: Counting Bits (Medium)
## Description
Given a 32-bit number, count how many bits are set to 1.

### Input
- A single 32-bit integer n

### Output 
Number of bits that are 1 in the binary representation of n

### Example
```plaintext
Input: n = 7 (0111 in binary)
Output: 3
```

## 📡 Logisim Solution: Counting Bits

### 🔧 Components Used
- 💾 **Registers**: 
  - Counter register for tracking 1s
  - Index register for bit position
- 🔍 **Bit Selector**: 
  - Individual bit extraction
  - Position tracking
- ⚖️ **Comparators**: 
  - Bit value checking
  - Flow control logic
- 🎮 **State Machine**:
  - Operation flow control
  - Process synchronization

### ⚙️ Circuit Operation
1. 📥 **Input Stage**
- 🔹 Loads 32-bit number into input buffer
- 🔹 Initializes counter to 0
- 🔹 Initializes bit position index to 0

2. 🔄 **Processing Stage**
- 🔹 Selects current bit using position index
- 🔹 Compares bit value with 1
- 🔹 Updates counter if bit is 1
- 🔹 Advances to next bit position

3. 📤 **Output Stage**
- 🔹 Verifies all bits processed
- 🔹 Converts final count to decimal
- 🔹 Prepares result for display
- 🔹 Triggers output sequence

### 🔍 Key Implementation Details
- 🔸 Asynchronous bit selection for performance
- 🔸 State-controlled operation flow
- 🔸 Optimized counter updates

## 💻 Assembly Solution: Counting Bits

### Implementation Overview
Efficient bit-counting implementation using:
1. Bit shifting operations
2. Bitwise AND for testing bits
3. Counter for tracking 1s
4. Loop for processing all 32 bits

See commented assembly code above for detailed register usage and implementation steps.


# 🔍 Problem 3: Set Difference (Medium-High)
## Description
Given two sets of numbers A and B, find set C = A\B (elements in A that are not in B).

### Input
- Size of set A: c_a
- Elements of set A
- Size of set B: c_b
- Elements of set B

### Output 
Elements present in A but not in B, separated by spaces.
If difference is empty, output nothing.

### Example
```plaintext
Input: 
A = {1,3,4}
B = {1,2,3}
Output: 4
```

## 📡 Logisim Solution: Set Difference

### 🔧 Components Used
- 💾 **Registers**: 
  - Set size tracking (A Length, B Length)
  - Loop iterators (i, j)
  - Element storage (elem A, elem B)
  - Position tracker (Default j)
- ⚖️ **Comparators**: 
  - Element matching logic
  - Position validation
- 🗄️ **RAM**: 
  - Set element storage
  - Access management
- 🔄 **Multiplexers**: 
  - Data flow control
  - Path selection

### ⚙️ Circuit Operation
1. 📥 **Input Stage**
- 🔹 Loads set sizes into registers
- 🔹 Calculates initial positions
- 🔹 Sets up iteration counters
- 🔹 Prepares Default j position

2. 🔄 **Processing Stage**
- 🔹 Traverses set A elements
- 🔹 Compares with set B elements
- 🔹 Tracks matching elements
- 🔹 Manages position updates

3. 📤 **Output Stage**
- 🔹 Converts numbers to decimal
- 🔹 Handles space insertion
- 🔹 Manages ASCII formatting
- 🔹 Controls output timing

### 🔍 Key Implementation Details
- 🔸 Efficient dual iterator management
- 🔸 Optimized comparison logic
- 🔸 Memory-conscious design

## 💻 Assembly Solution: Set Difference

### Implementation Overview
Implementation handles:
1. Two-dimensional iteration
2. Element comparison logic
3. Dynamic memory management
4. Output formatting with spaces

Detailed implementation with register allocation and memory management in the commented assembly code above.


# 🔍 Problem 4: Binary Tree Height (High)
## Description
Calculate the maximum height of a binary tree stored in array format where:
- Root is at index 0
- Left child of node i: 2i + 1
- Right child of node i: 2i + 2
- Empty nodes marked as -1

### Input
- Array size n
- Tree array with n elements

### Output 
Maximum height of the tree

### Example
```plaintext
Input: 
n = 15
array = [1,2,6,-1,3,-1,-1,-1,-1,4,5,-1,-1,-1,-1]
Output: 4
```

## 📡 Logisim Solution: Binary Tree Height

### 🔧 Components Used
- 💾 **Registers**: 
  - Height tracking (h, h0)
  - Array management (Length n, n/2)
  - Node processing (elem, f, ancestor)
  - Position tracking (i)
- 🧮 **Arithmetic Units**: 
  - Parent-child calculations
  - Path length computation
- 🎮 **State Machine**: 
  - Tree traversal control
  - Process synchronization
- ⚖️ **Comparators**: 
  - Node validation
  - Height comparison

### ⚙️ Circuit Operation
1. 📥 **Input Stage**
- 🔹 Loads array dimensions
- 🔹 Calculates midpoint
- 🔹 Initializes height registers
- 🔹 Sets up traversal positions

2. 🔄 **Processing Stage**
- 🔹 Implements bottom-up traversal
- 🔹 Calculates parent relationships
- 🔹 Tracks path lengths
- 🔹 Updates maximum height

3. 📤 **Output Stage**
- 🔹 Validates final height
- 🔹 Converts to decimal format
- 🔹 Prepares display output
- 🔹 Triggers completion sequence

### 🔍 Key Implementation Details
- 🔸 Optimized tree traversal logic
- 🔸 Efficient height calculation
- 🔸 Smart memory management
## 💻 Assembly Solution: Binary Tree Height

### Implementation Overview
Sophisticated implementation featuring:
1. Complex tree traversal algorithm
2. Efficient height tracking
3. Memory-optimized node management
4. Parent-child relationship calculations

For complete details on register usage, memory management, and exact implementation steps, refer to the extensively commented assembly code above.


# <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" width="25" height="25"> Python Solutions
These are the most intuitive ones so you should not have any problems with them!

# 🎓 Educational Purpose
This repository serves as a learning resource for understanding:
- Digital logic design
- Assembly programming
- Algorithm implementation
- Different levels of computer abstraction

# 🚀 Getting Started
1. Install required tools:
   - Logisim 2.7.1
   - NASM Assembler
   - Python 3.9+

2. Clone the repository:
```bash
git clone https://github.com/yourusername/algorithmic-challenges
```
Navigate to each problem's directory to find:
-Circuit implementation (.circ)
-Assembly solution (.asm)
-Python solution (.py)

# 📝 License
This project is licensed under the MIT License - see the LICENSE file for details.
