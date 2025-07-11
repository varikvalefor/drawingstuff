mkdir markdown;
ls -1F | grep '\/$' | xargs -Ifuck mkdir markdown/fuck;
mkdir markdown/50x/toolbox;
cat drawings.tex  | pcregrep -o '{.*?\.(png|jpg)}' | sed -e 's/^{//' | sed -e 's/}$//' | xargs -Ifuck ffmpeg -i "fuck" -vf scale=512:-1 "markdown/fuck-cmalu.webp";

if [ $(git branch --show-current) = "lojban" ];
then
	HEADER="# le te zbasu\nni'o le zmiku cu zbasu le me'oi .Markdown. versiio le me'oi .LaTeX. versiio be la'o zoi. +/ Drawings .zoi. noi .urli ke 'a fa zoi .urli. http://git.varikvalefor.i2p/vvx/drawings .urli.";
else
	HEADER="# The Source Material\nThe Markdown thing is automatically created from the LaTeX version (of \"+/ Drawings\"), which is available at <http://git.varikvalefor.i2p>.";
fi

(echo "$HEADER\n\n"; perl -pe 's/{(.*?(png|jpg))}/{\1-cmalu.webp}/' < drawings.tex | pandoc -f latex -i - -t markdown -o -) > markdown/index.md;
