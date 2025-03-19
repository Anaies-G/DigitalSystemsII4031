# **Final Project: Microprocessor Systems Implementation**  
**Course**: Digital Systems II *(Topics broadly covered in the course, with a focus on **assembly programming**)*  

## **Project Overview**  
This project demonstrates practical implementation of core concepts in **microprocessor systems** and **digital logic design**, emphasizing **assembly coding** for the ATmega64 microcontroller and **simulation** using *Proteus 8* and *Atmel Studio 7.0*. Key areas include:  
- Arithmetic/logical operations (shifts, jumps, interrupts).  
- Hardware integration (timers, fuse bits, clock signals) and stack management.  
- Simulation of combinational/sequential circuits and low-level system design.  

## **Software Tools**  
- **Proteus 8**: Used for schematic design, hardware simulation, and debugging.  
- **Atmel Studio 7.0**: Utilized for writing, compiling, and debugging assembly code (*.asm*).  

## **Repository Structure**  
```  
├── /Proteus Files             # Proteus schematic designs (.pdsprj) for hardware simulation  
├── /Atmel Files     # Full Atmel Studio projects (.atsln, .cproj) with build configurations and ATmega64 assembly code (.asm)
├── /Documentation               
│   └── report.pdf       # Detailed project report (in Persian) 
```  

## **Usage Instructions**  
1. **Assembly Code**:  
   - Open `.asm` files in *Atmel Studio 7.0* to modify, build, or debug.  
   - Load the generated `.hex` file into the Proteus microcontroller model for simulation.  

2. **Proteus Simulation**:  
   - Open `.pdsprj` files in *Proteus 8* to run hardware simulations.  
   - Ensure the microcontroller properties point to the correct `.hex` file from Atmel Studio.  

3. **Report**:  
   - The primary report is in Persian (`report.pdf`).

## **Additional Notes**  
- **Dependencies**: Requires *Proteus 8* and *Atmel Studio 7.0* (or compatible versions) for full functionality.  
- **Hardware Specificity**: Assembly code targets the **ATmega64** architecture. Adjust fuse bits in simulations as needed.  
- **Course Context**: While the course *Digital Systems II* introduced theoretical concepts (logic gates, memory structures, etc.), this project emphasizes **applied assembly programming** and **toolchain workflows**.
  
---

# **Project Title: Number Guessing Game Using ATmega64**  

### **Overview**  
This project is a two-player number guessing game implemented on the ATmega64 microcontroller. Player 1 sets a secret number by storing it in **Port D**, while Player 2 has **10 attempts** to guess the number by inputting their guesses into **Port A**. The game uses four LEDs connected to **Port C** to provide feedback and guide the players.  

---

### **Components and Functionality**  
1. **LED Indicators (Port C):**  
   - **Red LED (PortC.3):** Lights up if the secret number is **larger** than the guessed number.  
   - **Yellow LED (PortC.2):** Lights up if the secret number is **smaller** than the guessed number.  
   - **Green LED (PortC.1):** Lights up when the guess is **correct**, signaling Player 2’s victory.  
   - **White LED (PortC.0):** Remains on while waiting for Player 2’s input (active during guess periods).  

   *Note:* Only one LED is active at a time, and they illuminate when their respective Port C bits are **set to 0**.  

2. **Start Button (External Interrupt 5):**  
   - Player 1 initiates the game by pressing this button after setting the secret number.  
   - Once the game starts, this button is **disabled** to prevent interruptions.  

---

### **Game Flow**  
1. **Setup Phase:**  
   - Player 1 enters the secret number into **Port D** and presses the start button (triggering External Interrupt 5).  

2. **Guessing Phase:**  
   - Player 2 has **5 seconds** to input a guess into **Port A** while the **white LED** is lit.  
   - After 5 seconds, the system evaluates the guess:  
     - If correct: **Green LED** lights for **1 second**, followed by a **5-second victory display**.  
     - If incorrect: **Red/Yellow LED** lights for **1 second** to indicate "higher" or "lower."  
   - This cycle repeats for up to **10 attempts**.  

3. **Game End Conditions:**  
   - **Win:** If Player 2 guesses correctly, the green LED stays on for **5 seconds**.  
   - **Loss:** If all 10 guesses are used, **all LEDs** light up for **5 seconds**.  

4. **Restart:**  
   - After the game ends, pressing the start button again resets the system for a new round.  

---

### **Technical Notes**  
- The white LED ensures Player 2 knows when to input guesses.  
- Interrupts and timers are used to manage the 5-second input window and LED feedback timing.  
- The code ensures only **one LED is active at any time** to avoid conflicting signals.  


