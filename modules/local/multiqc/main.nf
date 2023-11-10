process MULTIQC {
    tag "multiqc"
    publishDir params.outdir, mode:'copy'

    input:
    path fastqc_results

    output:
    path "multiqc_report.html"

    script:
    """
    multiqc -o . ${fastqc_results}
    """
}
