 # Round Robin Arbiter (Verilog)

## 📌 Overview

This project implements a **4-bit Round Robin Arbiter** in Verilog.
The arbiter is responsible for granting access to one requester at a time among multiple competing requests in a fair manner.

Unlike fixed priority arbitration, the Round Robin approach ensures that all requesters eventually get access, avoiding starvation.

---

## 🎯 Objectives

* Design a 4-request Round Robin Arbiter
* Ensure fair access to all requesters
* Simulate and verify functionality using Xilinx ISE 14.7

---

## 🧠 Concept

In Round Robin arbitration:

* Priority rotates every clock cycle
* Each requester gets a chance in turn
* Only one grant is active at any time

Example rotation:
Cycle 1 → Priority starts from req[0]
Cycle 2 → Priority starts from req[1]
Cycle 3 → Priority starts from req[2]
Cycle 4 → Priority starts from req[3]

---

## ⚙️ Inputs and Outputs

### Inputs:

* `clk`  : Clock signal
* `rst`  : Reset signal
* `req[3:0]` : Request signals from 4 sources

### Outputs:

* `gnt[3:0]` : Grant signal (only one active at a time)

---

## 🔄 Working

* A pointer is used to track the current priority
* Based on the pointer value, requests are checked in a rotated order
* The first active request in that order is granted access
* The pointer updates every clock cycle to ensure fairness

---

## 🧪 Simulation

* Tool Used: **Xilinx ISE Design Suite 14.7**
* Testbench verifies:

  * Single request handling
  * Multiple simultaneous requests
  * Continuous request scenarios
  * Fair rotation of grants

---

## ✅ Key Features

* Fair arbitration (no starvation)
* Single grant at a time
* Rotating priority mechanism
* Simple and efficient design

---

## 🚀 Applications

* Bus arbitration in digital systems
* Network-on-Chip (NoC)
* Memory access control
* Communication systems

---

## 📚 Learning Outcome

* Understanding arbitration techniques
* Verilog RTL design
* Simulation and debugging
* Basics of hardware verification concepts

---

 Done by:
 V.Venkata Harinath 
 DECE SVGP TIRUPATI
