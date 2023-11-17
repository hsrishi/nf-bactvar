process TRIMMOMATIC {
    tag "TRIMMOMATIC on $sample_id"
    publishDir params.outdir, mode:'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("${sample_id}_trimmomatic.log"), path("${sample_id}_trim_R1.fastq.gz"), path("${sample_id}_trim_R2.fastq.gz")

    script:
    """
    trimmomatic PE -threads 2 -phred33 ${reads[0]} ${reads[1]} ${sample_id}_trim_R1.fastq.gz ${sample_id}_trim_R1_unpaired.fastq.gz ${sample_id}_trim_R2.fastq.gz ${sample_id}_trim_R2_unpaired.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 -summary ${sample_id}_trimmomatic.summary 2> ${sample_id}_trimmomatic.log
    """
}