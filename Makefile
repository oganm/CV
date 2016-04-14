all: html pdf

pdf: resume.pdf
resume.pdf: resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md; \
	context resume.tex

html: index.html
index.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o index.html resume.md

# docx: resume.docx
# resume.docx: resume.md
# 	pandoc -s -S resume.md -o resume.docx

# rtf: resume.rtf
# resume.rtf: resume.md
# 	pandoc -s -S resume.md -o resume.rtf

clean:
	rm index.html
	rm resume.tex
	rm resume.tuc
	rm resume.log
	rm resume.pdf

