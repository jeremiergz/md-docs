# Shrink PDF with GhostScript

```bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=<quality_setting> -dNOPAUSE -dQUIET -dBATCH -sOutputFile=<output_file>.pdf <input_file>.pdf
```

* -dPDFSETTINGS=/screen lower quality, smaller size.
* -dPDFSETTINGS=/ebook for better quality, but slightly larger pdfs.
* -dPDFSETTINGS=/prepress output similar to Acrobat Distiller "Prepress Optimized" setting
* -dPDFSETTINGS=/printer selects output similar to the Acrobat Distiller "Print Optimized" setting
* -dPDFSETTINGS=/default selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file
