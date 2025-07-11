mkdir markdown;
ls -1F | grep '\/$' | xargs -Ifuck mkdir markdown/fuck;
mkdir markdown/50x/toolbox;
cat drawings.tex  | pcregrep -o '{.*?\.(png|jpg)}' | sed -e 's/^{//' | sed -e 's/}$//' | xargs -Ifuck ffmpeg -i "fuck" -vf scale=512:-1 "markdown/fuck-cmalu.webp";
perl -pe 's/{(.*?(png|jpg))}/{\1-cmalu.webp}/' < drawings.tex | pandoc -f latex -i - -o markdown/index.md;
