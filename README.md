# DeepBehavior

DeepBehavior is a deep learning based toolbox for analysis of videos of behavior experiments in rodents and humans. We provide examples of implementation, and code for post-processing of the data. We show examples of five behavior tasks (food pellet reaching task, three-chamber test, social interaction test in mice; and reaching task and supination/pronation task in humans). We use three network models. Please find detailed explanation below.

## Getting Started

Which model should I use?

### Tensorbox

If you aim to detect only one type of object per image, then you can use Tensorbox. Although you can detct only one type of object per image, you can detect multiple of this same type of object.

### YOLOv3

If you plan on detecting multiple types of objects per image, then you can use YOLOv3.

### Openpose

If you plan on performing 3D kinematic analysis on human movements, then Openpose is the model to use.

## Prerequisites and Installing

Please check each model's requirements and how to install them here:

[Tensorbox](https://github.com/aarac/TensorBox)

[YOLOv3](https://github.com/aarac/darknet)

[Openpose](https://github.com/aarac/openpose)

## Using the models

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

If satisfied, then this command can be used to obtain the coordinates of the bounding boxes and confidence scores:
```
python predict_video_to_json.py VIDEONAME.avi tensorbox/TRAININGFOLDER/save.ckpt-ITERATIONNUMBER tensorbox/TRAININGFOLDER/hypes.json JSONFILENAME.json
```
The file "JSONFILENAME.json" includes the coordinates and confidence scores of bounding boxes for all of the individual frames in the video. This json file then can be used in MATLAB for post-processing.

### YOLOv3
First, create a folder that will include the training image dataset. We recommend starting with ~200 images.

Then, run this in the command line in the Yolo_mark directory:

```
./linux_mark.sh
```

This will open a GUI window where you can draw the bounding boxes on the region of interests.

### Openpose

To obtain 3D kinematics, we use two camera stereo system. It is important that the cameras are synchronized to each other.

Then, we processed videos obtained from each camera with openpose using the following command line:

```
./build/examples/openpose/openpose.bin --num_gpu 0 --video VIDEONAME.avi --net_resolution "1312x736" --scale_number 4 --scale_gap 0.25 --hand --hand_scale_number 6 --hand_scale_range 0.4 --write_json JSONFOLDERNAME --write_video RESULTINGVIDEONAME.avi
```

This creates indivudal json files for each frame in the video. So, it is important to keep it in one folder (JSONFOLDERNAME). We will later use these for post-processing and 3D analysis.

After obtaining the JSON files in two folders, we use MATLAB to calibrate the cameras and post-process the JSON files to obtain 3D positions.

In MATLAB folder, please use 'process_files_human3D.m' script to run the code.



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
