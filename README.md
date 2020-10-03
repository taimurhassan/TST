# Trainable Structure Tensors for Autonomous Baggage Threat Detection Under Extreme Occlusion
[Paper](https://arxiv.org/abs/2009.13158), [Spotlight Presentation](https://youtu.be/T3m57pNdrqE)

## Introduction
This repository contains the implementation of trainable structure tensors (TST), a single-staged contour instance segmentation strategy to detect the extremely cluttered baggage threats regardless of the scanner specifications. 

![TST](/images/tst.png)
<p align="center">System Block Diagram</p>

## Installation
To run TST, please download and install Anaconda (also install MATLAB R2020a with deep learning, image processing and computer vision toolboxes). Afterward, please import the ‘environment.yml’ or alternatively install following packages: 
1. Python 3.7.4 
2. Tensorflow 2.2.0 (CUDA compatible GPU needed for GPU training) 
3. Keras 2.3.1 or above 
4. OpenCV 4.2 
5. Imgaug 0.2.9 or above 
6. Tqdm 
Both Linux and Windows OS are supported.

## Datasets
The X-ray datasets can be downloaded from the following URLs: 
1. [GDXray](https://domingomery.ing.puc.cl/material/gdxray/) 
2. [SIXray](https://github.com/MeioJane/SIXray) 
3. [OPIXray](https://github.com/OPIXray-author/OPIXray) 
4. [COMPASS-XP](https://figshare.com/articles/dataset/COMPASS-XP/9249791)

Each dataset contains the ground truths either in mat files, txt files or in xml files. TST framework requires annotations to be in the mask form. Therefore, to parse each dataset annotations, we have provided their respective parser in the ‘…\utils’ folder. Please follow the same steps as mentioned below to prepare the training and testing data. These steps are also applicable for any custom dataset.

## Dataset Preparation
1. Download the desired dataset and update the dataset paths in ‘…\mst.m’ file.
2. Run the ‘…\mst.m’ file to generate the tensor representation of the input scans (this step is required for both train and test scans). 
3. Put the training tensors (obtained through step 2) in the '…\trainingDataset\train_images' folder. 
4. Put their corresponding training annotations in '…\trainingDataset\train_annotations' folder (Note: Use parsers provided in the 'utils' folder to obtain the annotations). 
5. Put validation images in '…\trainingDataset\val_images' folder 
6. Put validation annotations in '…\trainingDataset\val_annotations' folder 
7. Please note here that these images and annotations should have same name and extension (preferably png). 
8. Put test images in '…\testingDataset\test_images' folder and their annotations in '…\testingDataset\test_annotations' folder. 
9. The test images should also be obtained from the step 2 whereas the folder '…\testingDataset\original' should contain the respective original images (the final detection results are overlaid on these images). 

## Training and Testing
1. Use '…\trainer.py' file to train the backbone network provided in the '…\codebase\models' folder. The training parameters can be configured in this file as well. Once the training is completed, the segmentation results are saved in the '…\testingDataset\segmentation_results' folder. These results are used by the 'instanceDetector.m' script in the next step for bounding box and mask generation. 
2. Once the step 1 is completed, please run '…\instanceDetector.m' to generate the final detection outputs. Please note that the '…\instanceDetector.m' requires that the original images are placed in the '…\testingDataset\original' folder (as discussed in step 12 of the previous section).

## Results
The additional results of the TST framework are presented in the '…\results' folder. Please feel free to email us if you require the trained instances. 

## Citation
If you use TST (or any part of this code in your research), please cite the following paper:

```
@inproceedings{tst,
  title   = {Trainable Structure Tensors for Autonomous Baggage Threat Detection Under Extreme Occlusion},
  author  = {Taimur Hassan and Samet Akcay and Mohammed Bennamoun and Salman Khan and Naoufel Werghi},
  note = {Accepted in Asian Conference on Computer Vision (ACCV)},
  year = {2020}
}
```

## Contact
If you have any query, please feel free to contact us at: taimur.hassan@ku.ac.ae.
