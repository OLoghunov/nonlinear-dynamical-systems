![image](https://github.com/user-attachments/assets/54b49f34-3b34-4276-be0e-2a65771da0cd)
![image](https://github.com/user-attachments/assets/804bdb6d-4e2c-4d06-9d02-534e005b9563)
![image](https://github.com/user-attachments/assets/33eb91f5-cc33-4ea2-8a42-3345382032c4)




# Nonlinear Dynamical Systems

This repository contains MATLAB scripts for analyzing and simulating nonlinear dynamical systems.

## Repository Contents

- **eulerode.m**: Implements the Euler method for solving ordinary differential equations (ODEs).
- **lyapunov_spectrum.m**: Calculates the Lyapunov spectrum, quantifying the rates of separation of infinitesimally close trajectories to identify chaos.
- **sim_n_lyap.m**: Simulates and analyzes Lyapunov exponents for the system.
- **sys_of_equations.m**: Defines the system of equations representing the nonlinear dynamical system under study.
- **two_dimensional_map_of_system.m**: Generates a two-dimensional representation or map of the system's behavior.

## Getting Started

To utilize the scripts in this repository:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/OLoghunov/nonlinear-dynamical-systems.git
   cd nonlinear-dynamical-systems
   ```

2. **Open MATLAB**:
   Launch MATLAB on your computer.

3. **Add Repository to MATLAB Path**:
   In MATLAB, add the repository directory to your path to ensure all scripts can be accessed:
   ```matlab
   addpath(genpath(pwd))
   ```

4. **Run the Scripts**:
   Execute the desired scripts to perform simulations or analyses. For example, to compute the Lyapunov spectrum, run:
   ```matlab
   lyapunov_spectrum
   ```

## Notes

- Ensure that any dependencies or required toolboxes are installed in your MATLAB environment.
- Review each script's comments and documentation for specific usage instructions and to understand the expected inputs and outputs.
- The `sys_of_equations.m` file should be customized to define the specific nonlinear system you wish to analyze.

## Contributing

Contributions to enhance the functionality or add new features are welcome. Feel free to fork the repository, make modifications, and submit a pull request.

## License

This project is licensed under the MIT License.

---

For any issues or questions, please open an issue in this repository.
