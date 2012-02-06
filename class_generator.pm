#!/usr/bin/perl -w
use strict;

# From "Class Generator"
# usage class_generator <language> <flatfile>
# where <language> identifies a code generator called
# <language>_class.pm

# Model of flat file:
#
# B <access_operator> NameOfClass
# A <access_operator> nameOfAttribute1 type
# A <access_operator> nameOfAttribute2 type
# # It's a comment
# A <access_operator> nameOfAttributeN type
# E 
#
# Where <access_operator>:
#	+ public
#	- private
#	# protected

my $lang = shift or die "Missing language";
$lang .= "_class.pm";

require "$lang" or die "Couldn't load $lang";

my $nameClass;

while (<>) {
	chomp;
	if(/^\s*$/)	{ CG::blankLine(); }
	
	elsif(/^\#(.*)/) { CG::comment($1); }
	
	elsif(/^B\s+([\+\-\#])\s+(\w+)/) {
		if($1 eq "+") { CG::startPublicClass($2); }
		elsif($1 eq "-") { CG::startPrivateClass($2); }
		elsif($1 eq "#") { CG::startProtectedClass($2); }
		
	}
	elsif(/^A\s+([\+\-\#])\s+(\w+)\s+(\w+)\[(\w+)\]/) { 
		if($1 eq "+") { CG::publicAtributeArray($2, $3, $4); }
		elsif($1 eq "-") { CG::privateAtributeArray($2, $3, $4); }
		elsif($1 eq "#") { CG::protectedAtributeArray($2, $3, $4); }
	}
	elsif(/^A\s+([\+\-\#])\s+(\w+)\s+(\w+)/) {
		if($1 eq "+") { CG::publicAtribute($2, $3); }
		elsif($1 eq "-") { CG::privateAtribute($2, $3); }
		elsif($1 eq "#") { CG::protectedAtribute($2, $3); }
	}

	elsif(/^E/) { CG::endClass(); }
	
	else {
		print "Invalid line $_ \n";
	}
}
