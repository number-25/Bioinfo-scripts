#!julia
# 
#Simple parser of FASTQ files which identifies whether the fastq files
#originate from the correct molecule type - in this case RNA or cDNA
#
#The script takes a file as an argument and passes it as standard input to the
#program 
#"""

#using DelimitedFiles,FASTX, ZipFile
import DelimitedFiles, FASTX, ZipFile

#function parser(x = stdin) 
# inputstream = first(FASTQReader(open(x)), 4)

#reader = FASTQ.Reader(readlines(stdin))
function fqparser(file) 
inputstream = FASTQReader(open(file))
top = description(first(inputstream))
#reader = FASTQ.Reader(readlines(stdin))
#top = description(first(reader)) 
finalarray = Any[]
seqchem = "dna_r9.4.1"

if occursin(seqchem[:], top) 
    push!(finalarray, basename(file)) 
end 
writedlm("wrong-seqtype.txt", finalarray)
end 

