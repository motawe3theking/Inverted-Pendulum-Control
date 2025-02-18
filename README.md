# Inverted Pendulum Control
![image](https://github.com/user-attachments/assets/500f927b-26f0-4c8f-a1f0-9230a0e2ad69)
![image](https://github.com/user-attachments/assets/837a8ceb-a38c-4313-b613-da12085b0d0b)

This project implements a **Pole Placement Controller** to stabilize an inverted pendulum using state feedback control techniques. In addition to state feedback, an observer is designed to estimate unmeasured states for improved robustness and control performance. Developed in **MATLAB/Simulink**, this project demonstrates advanced control system design, simulation, and verification.

The inverted pendulum is an inherently unstable system that must be actively balanced by controlling the cart’s horizontal movement. Our controller uses pole placement to set the closed-loop system poles at desired locations, ensuring stability and quick response, while the observer helps to reconstruct any missing state information.

---

## How It Works

The project combines a state feedback controller with an observer:
- **State Feedback Control:** Uses the full state information (or estimated states) to compute the control input that stabilizes the system.
- **Observer Design:** Estimates the states that are not directly measured, enhancing control accuracy and robustness.
- **Pole Placement:** The desired poles are chosen to achieve fast settling time and minimal overshoot.
- **Integral Action:** Included to eliminate steady-state error.

---

## Features

- **Stabilization of Inverted Pendulum:** Maintains the pendulum in an upright position by controlling the cart's movement.
- **Pole Placement Control:** Uses state feedback to place the closed-loop poles in desired positions.
- **Observer-Based Design:** Estimates unmeasured states, ensuring robust performance.
- **MATLAB/Simulink Simulation:** Models and simulates the dynamic response of the system.
- **Visualization and Analysis:** Provides output scopes and pole-zero maps to analyze system behavior.

---

## Technology Stack

- **Programming Language:** MATLAB
- **Simulation Tool:** Simulink
- **Control Design Method:** Pole Placement with State Feedback and Observer Design

---
