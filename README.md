# DeepBehavior

## A deep learning toolbox for automated analysis of animal and human behavior imaging data

DeepBehavior is a deep learning based toolbox for analysis of videos of behavior experiments in rodents and humans. We provide examples of implementation, and code for post-processing of the data. We show examples of five behavior tasks (food pellet reaching task, three-chamber test, social interaction of two mice; and reaching task and supination/pronation task in humans). We use three network models. Please find detailed explanation below.

## Getting Started

### Which model should I use?

### Tensorbox

If you aim to detect only one type of object per image, then you can use Tensorbox. You can detect only one type of object per image, however, you can detect multiple of this same type of object in a single frame.

### YOLOv3

If you plan on detecting multiple types of objects per image, then you can use YOLOv3.

### Openpose

If you plan on performing 3D kinematic analysis on human movements, then Openpose is the model to use. The post-processing code is for developed for upper extremity movements.

## Prerequisites and Installing

Please check each model's requirements and how to install them here:

[Tensorbox](https://github.com/aarac/TensorBox)

[YOLOv3](https://github.com/aarac/darknet)

[Openpose](https://github.com/aarac/openpose)

## Using the models (after installations)

### Tensorbox

First, create two folders (train and test) of images from the raw video files. FFMPEG can be used for this. To start with, we used ~600 images in train dataset and ~200 images in test dataset.
Then, for each folder, run this command to label images in each folder one by one:
```
python make_json.py FOLDERNAME FOLDERNAME.json 
```
This creates a json file in the same directory as the folder.

Make the appropriate directory changes in the hypes file in the hypes directory. This is the hyper parameters file.

Then, start training with this command line:
```
python train.py --hypes hypes/HYPESFILENAME.json --gpu 0 --logdir output
```
This creates files in the output folder with the trained weights under "save.ckpt-ITERATIONNUMBER".

Check the results by looking at the individual detected images using:
```
python predict_video_to_images.py VIDEONAME.avi output/TRAININGFOLDER/save.ckpt-ITERATIONNUMBER output/TRAININGFOLDER/hypes.json
```

If satisfied, then the following command line can be used to obtain the coordinates of the bounding boxes and confidence scores:
```
python predict_video_to_json.py VIDEONAME.avi tensorbox/TRAININGFOLDER/save.ckpt-ITERATIONNUMBER tensorbox/TRAININGFOLDER/hypes.json JSONFILENAME.json
```
The file "JSONFILENAME.json" includes the coordinates and confidence scores of bounding boxes for all of the individual frames in the video. This json file can be used in MATLAB for post-processing.

Post-processing:

In MATLAB, please run the "Process_files_3Dreaching_mouse.m" script for 3D kinematic analysis of single food pellet reaching task.

Please run the "Process_three_chamber.m" script for three-chamber test.

### YOLOv3
First, create a folder that will include the training image dataset. We recommend starting with ~200 images.

Then, run this in the command line in the Yolo_mark directory:

```
./linux_mark.sh
```

This will open a GUI window where you can draw the bounding boxes on the region of interests, and do it for all the images in the folder. These should be the training dataset. Once this is completed, transfer the folder named "obj" (contains the images and the .txt files of labels), the files named "obj.data", "obj.names", "train.txt" to the data folder in the main darknet directory.

You can now start training with the following command:

```
./darknet detector train data/obj.data cfg/yolo-obj.cfg darknet53.conv.74
```

You can train up to 200,000 iterations. The number of iterations may depend on the type of images, number of training dataset.

Once the training is completed, you can check the results on new images:

```
./darknet detector test data/obj.data cfg/yolo-obj.cfg backup/yolo-obj_ITERATIONNUMBER.weights IMAGE.jpg
```

... and new videos:

```
./darknet detector demo data/obj.data cfg/yolo-obj.cfg backup/yolo-obj_ITERATIONNUMBER.weights VIDEO.avi
```

To save the resulting video and the coordinates (in .txt file), please use this command:

```
./darknet detector demo data/obj.data cfg/yolo-obj.cfg backup/yolo-obj_ITERATIONNUMBER.weights VIDEO.avi -ext_output <VIDEO.avi> FILENAME.txt
```

Postprocessing:

You can take the FILENAME.txt file to MATLAB, and run the "Process_socialtest_mini.m" script. This script was developed to detect two mice (as shown in the paper), however, it can be modified for other custom uses.

### Openpose

To obtain 3D kinematics, we use two camera stereo system. It is important that the cameras are synchronized to each other.

Then, we process videos obtained from each camera with openpose using the following command line:

```
./build/examples/openpose/openpose.bin --num_gpu 0 --video VIDEONAME.avi --net_resolution "1312x736" --scale_number 4 --scale_gap 0.25 --hand --hand_scale_number 6 --hand_scale_range 0.4 --write_json JSONFOLDERNAME --write_video RESULTINGVIDEONAME.avi
```

This creates indivudal json files for each frame in the video. So, it is important to keep it in one folder (JSONFOLDERNAME). We will later use these for post-processing and 3D analysis.

After obtaining the JSON files in two folders, we use MATLAB to calibrate the cameras and post-process the JSON files to obtain 3D positions. For camera calibration, you can use the calib_board_human3D.pdf file (this is a 7x10 checkerboard that has 115x115 mm squares when printed in 48"x36" size.

Postprocessing:

In MATLAB folder, please use 'process_files_human3D.m' script to run the code. This will create a "cell" file with all the 3D poses of the joints. It will also make a movie of the 3D skeletal view.



## Additional required toolboxes

* [Matlab Camera Calibration Toolbox](http://www.vision.caltech.edu/bouguetj/calib_doc/) - Required for two-camera calibration in MATLAB
* [JSONlab](https://www.mathworks.com/matlabcentral/fileexchange/33381-jsonlab-a-toolbox-to-encode-decode-json-files) - Required to read JSON files in MATLAB
* [PIMS](http://soft-matter.github.io/pims/v0.4.1/) - This can be used to read '.seq' files in Python
* [FFMPEG](https://www.ffmpeg.org) - Useful toolbox for converting videos to images or vice versa.

## Authors

* **Ahmet Arac** 

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* We would like to thank the authors of the three network models ([Tensorbox](https://github.com/Russell91/TensorBox), [YOLOv3](https://github.com/AlexeyAB/darknet), and [Openpose](https://github.com/CMU-Perceptual-Computing-Lab/openpose)) that we have used in this repository.
