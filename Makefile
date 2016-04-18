all: html pdf

pdf: cv.pdf
cv.pdf: cv.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o cv.tex cv.md; \
	context cv.tex

html: index.html
index.html: style_chmduquesne.css cv.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o index.html cv.md

# docx: resume.docx
# resume.docx: resume.md
# 	pandoc -s -S resume.md -o resume.docx

# rtf: resume.rtf
# resume.rtf: resume.md
# 	pandoc -s -S resume.md -o resume.rtf

clean:
	rm index.html
	rm cv.tex
	rm cv.tuc
	rm cv.log
	rm cv.pdf


push:
	git add -u
	git commit -m "make autopush"
	git checkout gh-pages
	git merge master
	git checkout master
	git push
