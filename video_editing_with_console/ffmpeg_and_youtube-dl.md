# Download from youtube

## Download only audio and convert it to mp3
```bash
youtube-dl -x --audio-format mp3 "https://www.youtube.com/watch?v=ABCDEFG"
```

# Merge and split videos

## Merge multiple videos to one video
1. We have to create a list of all files we want to merge. For this we use
```bash
for f in *.mp4; do echo "file '$f'" >> videos.txt; done
```

2. We use ffmpeg to merge all files to one big video
```bash
ffmpeg -f concat -i videos.txt -c copy output_merged_video.mp4
```

## Split video in equal size chunks
Splitting videos can be either done manually by ffmpeg or by using a small python tool `video-splitter` which is instrumenting ffmpeg and is doing all the renaming and time-stamp work.

To do it manually with ffmpeg you can run multiple commands for every split as shown below:
```bash
ffmpeg -i long_video.mp4 -ss 00:00:00 -to 00:00:30 -c copy video_part_1.mp4
ffmpeg -i long_video.mp4 -ss 00:00:30 -to 00:01:00 -c copy video_part_2.mp4
ffmpeg -i long_video.mp4 -ss 00:01:00 -to 00:01:30 -c copy video_part_3.mp4
ffmpeg -i long_video.mp4 -ss 00:01:30 -to 00:02:00 -c copy video_part_4.mp4
```

The usage of the python tool is a little easier, but requires the installation of another tool.
```bash
git clone https://github.com/c0decracker/video-splitter.git
cd video-splitter
cp ../long_video.mp4 .
python ffmpeg-split.py -f long_video.mp4 -s 30
```

This will create files like:
```bash
long_video-1-of-4.mp4
long_video-2-of-4.mp4
long_video-3-of-4.mp4
long_video-4-of-4.mp4
```

# Change video / audio speed

## Speed up video and remove audio
To calculate the new speed we have set the value `setpts` to `1/THE_SPEED_FACTOR_YOU_WANT`.
The below example speeds up the video by factor `2`. For this we set `setpts` to `0.5`

```bash
ffmpeg -i input_video_normal_speed.mp4 -filter:v "setpts=0.5*PTS" -an output_video_with_double_speed.mp4
```

## Speed up audio and remove video
```bash
ffmpeg -i input_video_normal_speed.mp4 -filter:v "setpts=0.05*PTS" -filter:a "atempo=20" -vn output_audio_with_factor_20_speed.mp3
```

## Speed up audio and video, keep both
While the video speed factor is calcutated by `1/THE_SPEED_FACTOR_YOU_WANT` you can simply set the audio speedup
factor the value you need. In this example we want to speed up by factor 40. Which means video factor is `1/40 =  "setpts=0.025*PTS"` and audio factor is  `"atempo=40"` .

```bash
ffmpeg -i input_video_normal_speed.mp4 -filter:v "setpts=0.025*PTS" -filter:a "atempo=40" output_video_with_audio_factor_40_speed.mp4
```


# Add Audio

## Add Audio to video which is longer as the video, erase the original audio of the video
```bash
ffmpeg -i input_short_video.mp4 -i input_long_audio.mp3 -shortest -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 output_video_with_new_audio.mp4
```

## Add short audio to a video and play the audio in an endless loop until the video is finished
```bash
ffmpeg -i input_long_video.mp4 -stream_loop -1 -i input_short_audio.mp3 -shortest -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 output_video_with_looped_audio.mp4
```

## Add short Audio to a specific time in video and keep the original audio of the video
The below example adds the audio 5000 milliseconds after the start

```bash
ffmpeg -i input_video_with_audio.mp4 -i input_short_audio_you_want_to_add.mp3 -filter_complex\n"[1]adelay=5000|5000[aud];[0][aud]amix" -c:v copy output_video_with_both_audios.mp4
```

# Exctract Audio

## Exctract Audio out of video with a specific starting and ending time
The below example extracts the audio starting at 00:04:26 and ending at 00:04:28

```bash
ffmpeg -i input_video_with_audio.mp4 -ss 00:04:26 -t 00:04:28 -q:a 0 -map a output_extracted_audio.mp3
```

# Convert videos
# Convert mp4 to libx265 compression (much much smaller, but only new devices support this)
The below example will convert a 1.2 GB video into a 128 MB video

```bash
ffmpeg -i input_video_most_likely_with_264_compression.mp4 -c:v libx265 output_video_with_libx265_compression.mp4
```
