#!/urs/bin/perl -w
package CG;
use strict;

sub blankLine()				{ print "\n"; }
sub comment()				{ print "/*$_[0] */\n"; }
sub startPublicClass()		{ print "public class $_[0] {\n"; }
sub startPrivateClass()		{ print "private class $_[0] { \n"; }
sub startProtectedClass()	{ print "protected class $_[0] { \n"; }
sub endClass()				{ print "}\n"; }

sub publicAtribute() {
	my($name, $type) = @_;
	print "\tpublic\t$type $name;\n";
}
sub privateAtribute() {
	my($name, $type) = @_;
	print "\tprivate\t$type $name;\n";
}
sub protectedAtribute() {
	my($name, $type) = @_;
	print "\tprotected\t$type $name;\n";
}

sub publicAtributeArray() {
	my($name, $type, $size) = @_;
	print "\tpublic $type\[\] $name = new $type\[$size\];\n";
}
sub privateAtributeArray() {
	my($name, $type, $size) = @_;
	print "\tprivate $type\[\] $name = new $type\[$size\];\n";
}
sub protectedAtributeArray() {
	my($name, $type, $size) = @_;
	print "\tprotected $type\[\] $name = new $type\[$size\];\n";
}

1;