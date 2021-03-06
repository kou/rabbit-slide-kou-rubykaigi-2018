set terminal pdfcairo enhanced color transparent rounded

set key outside center top horizontal reverse Left samplen 2
unset border
set xtics scale 0
set ytics scale 0
set grid ytics linewidth 1 linetype -1

set style line 1 lt 1 lc rgbcolor "#3465a4" lw 2.5 pt 7 ps 1
set style line 2 lt 1 lc rgbcolor "#edd400" lw 2.5 pt 7 ps 1
set style line 3 lt 1 lc rgbcolor "#888a85" lw 2.5 pt 5 ps 1
set style line 4 lt 1 lc rgbcolor "#f57900" lw 2.5 pt 5 ps 1
set style line 5 lt 1 lc rgbcolor "#ad7fa8" lw 2.5 pt 9 ps 1
set style line 6 lt 1 lc rgbcolor "#4e9a06" lw 2.5 pt 9 ps 1
set style line 7 lt 1 lc rgbcolor "#ef2929" lw 2.5 pt 1 ps 1
set style line 8 lt 1 lc rgbcolor "#5c3566" lw 2.5 pt 1 ps 1
set style line 9 lt 1 lc rgbcolor "#c17d11" lw 2.5 pt 3 ps 1
set style line 10 lt 1 lc rgbcolor "#dce775" lw 2.5 pt 3 ps 1

set xlabel "N rows"
set ylabel "Load time (sec)"
set output "csv-arrow.pdf"
plot "csv-arrow-parquet.tsv" using 1:2 \
        with line \
        linestyle 1 \
        title "CSV", \
     "csv-arrow-parquet.tsv" using 1:3 \
        with line \
        linestyle 4 \
        title "Apache Arrow"

set output "csv-arrow-parquet.pdf"
plot "csv-arrow-parquet.tsv" using 1:2 \
        with line \
        linestyle 1 \
        title "CSV", \
     "csv-arrow-parquet.tsv" using 1:3 \
        with line \
        linestyle 4 \
        title "Apache Arrow", \
     "csv-arrow-parquet.tsv" using 1:4 \
        with line \
        linestyle 5 \
        title "Apache Parquet"
