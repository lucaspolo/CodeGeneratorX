#!/urs/bin/perl -w
package CG;
use strict;

sub blankLine()				{ print "\n"; }
sub comment()				{ print "/*$_[0] */\n"; }
sub startPublicClass()		{ print "class $_[0] {\n"; }
sub startPrivateClass()		{ print "class $_[0] { \n"; }
sub startProtectedClass()	{ print "class $_[0] { \n"; }
sub endClass()				{ print "}\n"; }
sub publicAtribute() {
	my($name, $type) = @_;
	print "\tpublic\t \$$name;\n";

}

sub privateAtribute() {
	my($name, $type) = @_;
	print "\tprivate\t \$$name;\n";
}

sub protectedAtribute() {
	my($name, $type) = @_;
	print "\tprotected\t \$$name;\n";
}

sub publicAtributeArray() {
	my($name, $type, $size) = @_;
	print "\tpublic \$$name = array\($size\);\n";
}

sub privateAtributeArray() {
	my($name, $type, $size) = @_;
	print "\tprivate \$$name = array\($size\);\n";
}

sub protectedAtributeArray() {
	my($name, $type, $size) = @_;
	print "\tprotected \$$name = array\($size\);\n";
}

1;
