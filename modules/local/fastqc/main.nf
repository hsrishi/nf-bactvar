process FASTQC {
    tag "FASTQC on $sample_id"
    publishDir params.outdir, mode:'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "fastqc_${sample_id}_logs/*"

    script:
    """
    mkdir fastqc_${sample_id}_logs
    fastqc -o fastqc_${sample_id}_logs -f fastq -q ${reads[0]}
    fastqc -o fastqc_${sample_id}_logs -f fastq -q ${reads[1]}
    """
}
