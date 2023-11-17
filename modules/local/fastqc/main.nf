process FASTQC {
    tag "FASTQC on $sample_id"
    publishDir params.outdir, mode:'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "${sample_id}_fastqc_logs/*"

    script:
    """
    mkdir ${sample_id}_fastqc_logs
    fastqc -o ${sample_id}_fastqc_logs -f fastq -q ${reads[0]}
    fastqc -o ${sample_id}_fastqc_logs -f fastq -q ${reads[1]}
    """
}
