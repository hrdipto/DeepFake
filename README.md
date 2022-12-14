## Using
### 1. Install Anaconda 
Anaconda is the preferred method of installing DeepFaceLab on Linux.
[Just follow the tutorial](https://docs.conda.io/projects/conda/en/latest/user-guide/install).  

### 2. Install System Dependencies 
You will need FFMpeg, Git, and the most recent NVIDIA driver for your system to use this project.

If you are here, then you already have everything...

### 3. Install DeepFaceLab

Just run it in the terminal.

Check latest cudnn and cudatoolkit version for your GPU device.

```bash
 conda create -n deepfacelab -c main python=3.7 cudnn=7.6.5 cudatoolkit=10.1.243
 conda activate deepfacelab
 git clone --depth 1 https://github.com/nagadit/DeepFaceLab_Linux.git
 cd DeepFaceLab_Linux
 git clone --depth 1 https://github.com/iperov/DeepFaceLab.git
 python -m pip install -r ./DeepFaceLab/requirements-cuda.txt
```

## 4. Download Pretrain (optional)
Use script 4.1 from the scripts directory.
 
Or download manually

[CelebA](https://github.com/nagadit/DeepFaceLab_Linux/releases/download/1.0/pretrain_CelebA.zip)

[FFHQ](https://github.com/nagadit/DeepFaceLab_Linux/releases/download/1.0/pretrain_FFHQ.zip)

[Quick96](https://github.com/nagadit/DeepFaceLab_Linux/releases/download/1.0/pretrain_Quick96.zip)

## 5. Navigate to the scripts directory and begin using DeepFaceLab_Linux ᗡ:
Run all scripts with BASH shell
```bash
bash 1_clear_workspace.sh
```
etc


## 6. To run inference only:
[XSegMask](https://drive.google.com/file/d/1fo2ge4vURia8i745xKE2fhlLKSnOxzJI/view)
[RTTModel]( https://drive.google.com/file/d/1-WWffEksKm1zSHh4hmh43cyBXi0HjHbj/view)
Copy the model folder from drive and paste it into workspace folder. 
Rename your target video as data_dst.* and paste it into workspace

Run all the following script
```bash
bash 3_extract_image_from_data_dst.sh 
bash 5_data_dst_extract_faces_S3FD.sh
bash 5_XSeg_data_dst_mask_apply.sh
bash 7_merge_SAEHD.sh
bash 8_merged_to_mp4.sh

```


## 6. To merge two source videos:

Run the following script
```bash
bash merge_video_sources.sh -s maruf.mp4  -d maruf_2.mp4 -o maruf_output.mp4

```