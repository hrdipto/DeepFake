while getopts s:d:o: flag
do
    case "${flag}" in
        s) src=${OPTARG};;
        d) dst=${OPTARG};;
        o) out=${OPTARG};;
    esac
done

echo "output: $out";

ffmpeg -i "$src"  -i "$dst" -r 30 -filter_complex "[0:v]scale=640:480, setpts=PTS-STARTPTS, pad=1280:720:0:120[left]; [1:v]scale=640:480, setpts=PTS-STARTPTS, pad=640:720:0:120[right]; [left][right]overlay=w; amerge,pan=stereo|c0<c0+c2|c1<c1+c3" -vcodec libx264 -acodec aac -strict experimental "$out";
