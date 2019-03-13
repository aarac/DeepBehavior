# DeepBehavior

DeepBehavior is a deep learning based toolbox for analysis of videos of behavior experiments in rodents and humans. We provide examples of implementation, and code for post-processing of the data. We show examples of five behavior tasks (food pellet reaching task, three-chamber test, social interaction test in mice; and reaching task and supination/pronation task in humans). We use three network models. Please find detailed explanation below.

## Getting Started

Which model to use?

### Tensorbox

If you aim to detect only one type of object per image, then you can use Tensorbox. Although you can detct only one type of object per image, you can detect multiple of this same type of object.

### YOLOv3

If you plan on detecting multiple types of objects per image, then you can use YOLOv3.

### Openpose

If you plan on performing kinematic analysis on human movements, then Openpose is the model to use.

## Prerequisites and Installing

Please check each model's requirements within that page:

[Tensorbox](https://github.com/Russell91/TensorBox)

[YOLOv3](https://github.com/AlexeyAB/darknet)

[Openpose](https://github.com/CMU-Perceptual-Computing-Lab/openpose)

## Using models

### Tensorbox

```
Give the example
```

### YOLOv3

```
Give the example
```

### Openpose

```
Give the example
```





## Additional required toolboxes

* [Matlab Camera Calibration Toolbox](http://www.vision.caltech.edu/bouguetj/calib_doc/) - Required for two-camera calibration in MATLAB
* [JSONlab](https://www.mathworks.com/matlabcentral/fileexchange/33381-jsonlab-a-toolbox-to-encode-decode-json-files) - Required to read JSON files in MATLAB
* [PIMS](http://soft-matter.github.io/pims/v0.4.1/) - Used to read '.seq' files in Python

## Authors

* **Ahmet Arac** 

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* We would like to thank the authors of the three network models ([Tensorbox](https://github.com/Russell91/TensorBox), [YOLOv3](https://github.com/AlexeyAB/darknet), and [Openpose](https://github.com/CMU-Perceptual-Computing-Lab/openpose)) that we have used in this repository.
