use strict;
@ARGV==1 or die "perl $0 <IN>\n";
open IN,"$ARGV[0]" or die "$!\n";
my %sample;
my %drug;
while (<IN>){
	chomp;
#	print "$_\t";
	my $ID=$_;
	open IN1,"/data/04.rgi/$_.txt" or die "$!\n";
	my $head=<IN1>;
	while (<IN1>){
		chomp;
		my @a=split("\t",$_);
		my @b=split(";",$a[16]);  ###14 for Drug Class;16 for ARM gene family
		$sample{$ID}{$b[0]}++;
		$drug{$b[0]}=1;
		}
	close IN1;
	}
close IN;

print "Drug\t";
foreach my $key(sort keys %sample){
	print "$key\t";
}
print "\n";

foreach my $k2(sort keys %drug){
	print "$k2\t";

	foreach my $k3(sort keys %sample){
		if (exists $sample{$k3}{$k2}){
		print "$sample{$k3}{$k2}\t";}
		else {print "0\t";}
		}

	print "\n";
}
