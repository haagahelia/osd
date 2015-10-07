echo "xslt xml/course.xml"
xsltproc xsl/course.xsl xml/course.xml -o index.html > log/xsltoutput.course.log 2>&1
for f in xc/*.xml
do
	echo "xslt $f"
	xsltproc xsl/exercise.xsl $f -o $f.html >> log/xsltoutput.exercises.log 2>&1
done

