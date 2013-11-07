package Score;
use v5.16;
use Athena::Lib;

sub CalculateScore {
	my ($scorecard) = @_;

	# assume there are no spares or strikes

	my $score = 0;
	my $frame = 0;	


	for my $idx (0 .. length($scorecard) - 1) {
		my $throw = substr($scorecard, $idx, 1);
		$score += $throw;
	}

	return $score;
}

sub CreateFrameList {
	my ($scorecard) = @_;
	my @throws = split(//, $scorecard);
	my @frames;
	my $currentframe = 0;
	for (my $index = 0; $index < scalar @throws; $index++) {
		my $scoretype = ThrowType($throws[$index]);
		
		my $frame;
		if ($scoretype eq 'NORMAL' || $scoretype eq 'GUTTER') {
			$frame = [ $throws[$index], $throws[$index + 1] ];
			$index++;
		}
		elsif ($scoretype eq 'STRIKE') {
			$frame = [ $throws[$index] ];
		}
		else {  # spare, not possible
			die "Impossible state";
		}
		push @frames, $frame;
	}

	return @frames;
}

sub ThrowType {
	my ($throw) = @_;
	my %throwmap = (
		"X" => "STRIKE",
		"/" => "SPARE",
		"-" => "GUTTER",
	);
		return $throwmap{$throw} || "NORMAL";
}



1;
