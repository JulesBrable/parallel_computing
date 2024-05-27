# Parallel Computing
Repository for the final project of the Parallel Programming course (taught by X.Dupré &amp; M.Durut during 2nd Semester of the final year at ENSAE Paris). Basically, based on [a Llama model](https://huggingface.co/alpindale/Llama-2-7b-ONNX), we have performed a kernel fusion (on CPU) between two matrix operations: a matrix multiplication and a transposition.

## Contents

* `sigmul.cpp` is the C++ version of our kernel fusion
* `interface.pyx` contains the Cython declaration of the C++ function, and also the Cython version of our kernel fusion
* `setup.py` allows to create the extension
* `analysis.ipynb` is a notebook that was used to generate the plots showing the results of our project.

## Setup Instructions

From the command line, you will have to follow the following steps to set this project up:

1. Clone this repository:

```bash
git clone https://github.com/JulesBrable/parallel_computing.git
```

2. Go to the project folder:
```bash
cd parallel_computing
```

3. Create and activate conda environnement:
   
```bash
conda create -n conda acitvate parallel_computing_env python=3.9 -y
conda acitvate parallel_computing_env
```

4. Install the listed dependencies:
   
```bash
pip install -r requirements.txt
```

5. Compile the code:

```bash
python setup.py build_ext --inplace
```

## Contact

* [Jules Brablé](https://github.com/JulesBrable) - jules.brable@ensae.fr
* [Yousra Lina El Khalloufi]() - yousralina.elkhalloufi@ensae.fr
