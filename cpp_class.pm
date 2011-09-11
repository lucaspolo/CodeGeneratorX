#!/urs/bin/perl -w
package CG;
use strict;

my @privates;
my @publics;
my $chave;

sub blankLine()				{ print "\n"; }
sub comment()				{ print "/*$_[0] */\n"; }
sub startPublicClass()		{ print "class $_[0] {\n"; }
sub startPrivateClass()		{ print "private class $_[0] { \n"; }
sub startProtectedClass()	{ print "private class $_[0] { \n"; }

sub endClass() { 
	print "private:\n";
	foreach $chave (@privates) {
		print "\t$chave;\n";
	}
	print "public:\n";
	foreach $chave (@publics) {
		print "\t$chave;\n";
	}
	print "};\n"
}

sub publicAtribute() {
	my($name, $type) = @_;
	push(@publics, "$type $name");
}
sub privateAtribute() {
	my($name, $type) = @_;
	push(@privates, "$type $name");
}
sub protectedAtribute() {
	my($name, $type) = @_;
	push(@privates, "$type $name");
}

sub publicAtributeArray() {
	my($name, $type, $size) = @_;
	push(@publics, "$type $name\[$size\]");
}
sub privateAtributeArray() {
	my($name, $type, $size) = @_;
	push(@privates, "$type $name\[$size\]");
}
sub protectedAtributeArray() {
	my($name, $type, $size) = @_;
	push(@privates, "$type $name\[$size\]");
}

1;