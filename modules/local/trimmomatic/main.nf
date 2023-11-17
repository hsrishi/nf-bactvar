process TRIMMOMATIC {
    tag "TRIMMOMATIC on $sample_id"
    publishDir params.outdir, mode:'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    // val sample_id
    // path "fastp_${sample_id}_logs/*"
    // path "fastp_${sample_id}_trim_R1.fastq.gz"
    // path "fastp_${sample_id}_trim_R2.fastq.gz"
    tuple val(sample_id), path("fastp_${sample_id}_logs/*"), path("fastp_${sample_id}_trim_R1.fastq.gz"), path("fastp_${sample_id}_trim_R2.fastq.gz")

    script:
    """
    mkdir fastp_${sample_id}_logs
    touch fastp_${sample_id}_logs/fastp_${sample_id}.html
    trimmomatic PE -threads 2 -phred33 ${reads[0]} ${reads[1]} fastp_${sample_id}_trim_R1.fastq.gz fastp_${sample_id}_trim_R1_unpaired.fastq.gz fastp_${sample_id}_trim_R2.fastq.gz fastp_${sample_id}_trim_R2_unpaired.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
    """
    // fastp -i ${reads[0]} -I ${reads[1]} -o fastp_${sample_id}_R1.fastq.gz -O fastp_${sample_id}_R2.fastq.gz -h fastp_${sample_id}.html -j fastp_${sample_id}.json
    // touch fastp_${sample_id}_trim_R1.fastq.gz
    // touch fastp_${sample_id}_trim_R2.fastq.gz
}