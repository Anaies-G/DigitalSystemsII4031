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
