From: Jason Holt <jason@lunkwill.org>
Subject: Encrypted logs with forward secrecy
Date: Tue, 6 May 2003 05:22:20 +0000 (UTC)
Message-ID: <Pine.LNX.4.44.0305060516330.20364-100000@potato.zayda.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I felt the need to code on Saturday, so I wrote up this toy we discovered at
DISCEX and posted it to sci.crypt.  Hans suggested that it might work nicely
as a reiserfs4 plugin.

The idea isn't original - Bruce Schneier published these a few years ago, but
mine is apparently the first public implementation:

http://www.counterpane.com/secure-logs.html
http://www.counterpane.com/auditlog2.html

He also has a patent on it, but said he's willing to let it be used with a
GPLed implementation.

				-J

=============

Does anyone know of another package that does this?  The idea is to
generate a random file key, encrypt it with an auditor's public key
and ship it to the auditor.  Then you use it to encrypt lines of a log
file.  After each line, you hash the file key, throw away the old one,
and append a MAC.

That way, even if somebody roots your box, they can't read any lines
of the file already written or modify the log.  They can /delete/ the
log, but can't change already-written lines undetected.

So here's a quick-and-dirty implementation.  It uses MDCs instead of a
proper HMAC, and of course wastes lots of space.  Comments?

                                        -J

[jason@erg] ~/.gnupg$ gpg --gen-key
gpg (GnuPG) 1.2.1; Copyright (C) 2002 Free Software Foundation, Inc.
This program comes with ABSOLUTELY NO WARRANTY.

[blah blah blah...]
                        
You need a User-ID to identify your key; the software constructs the
user id
from Real Name, Comment and Email Address in this form:
    "Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>"

Real name: logcrypt
Email address:     
Comment:       
You selected this USER-ID:
    "logcrypt"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? o

[blah blah blah...]

[At this point, you should take the secret key off site...]

[jason@erg] ~/work/logcrypt$ cat >log
foo
bar
baz

[As soon as this starts running, put a copy of filekey somewhere
safe...]
[jason@erg] ~/work/logcrypt$ ./logcrypt.pl <log >safe_log 2>/dev/null
Reading passphrase from file descriptor 0    
Reading passphrase from file descriptor 0    
Reading passphrase from file descriptor 0    

[jason@erg] ~/work/logcrypt$ ./readlog.pl <safe_log

You need a passphrase to unlock the secret key for
user: "logcrypt"
2048-bit ELG-E key, ID C17F42D7, created 2003-05-03 (main key ID
EEC68977)

Reading passphrase from file descriptor 0    
gpg: AES encrypted data
foo
Reading passphrase from file descriptor 0    
gpg: AES encrypted data
bar
Reading passphrase from file descriptor 0    
gpg: AES encrypted data
baz

================================Code for logcrypt.pl:

#!/usr/bin/perl

# (c) 2003 Jason E. Holt
# Released into the public domain
# Encrypt log files with forward secrecy
# Once a line of the file is written, even root can't read it or
# change it without detection.  (Assuming that filekey gets recorded
# somewhere safe.)

my $recipient = "logcrypt"; # Name of GPG public key holder

use MD5;

open(RANDOM, "</dev/urandom") or die "Couldn't open /dev/urandom: $!";
sysread(RANDOM, $filekey, 16, 0);

$filekey = MD5->hexhash($filekey);

open(SAVEFILEKEY, "| gpg -r $recipient -q -e -o filekey") 
	or die "Couldn't open pipe to gpg: $!";

# Just symmetrically encrypt the log key.
#open(SAVEFILEKEY, "| gpg -c -o filekey") 
#	or die "Couldn't open pipe to gpg: $!";

print SAVEFILEKEY $filekey;
close SAVEFILEKEY;

while(<>) {
	open(GPG, 
     "|gpg -q --cipher-algo AES --passphrase-fd 0 -a -c --force-mdc -o
-")
		or die "Couldn't open gpg: $!";

	print GPG $filekey, "\n";
	print GPG $_;

	$filekey = MD5->hexhash($filekey);
}

==================================== Code for readlog.pl

#!/usr/bin/perl

# (c) 2003 Jason E. Holt
# Released into the public domain
# Read log files written with logcrypt.pl

use MD5;

open(FILEKEY, "gpg -q -o - filekey |") or die "Couldn't open file key:
$!";
my $filekey = join('', <FILEKEY>);

my @lines;
while(<>) {
	push @lines, $_;
	if(/-----END PGP MESSAGE-----/) {

		open(GPG, "| gpg -q --passphrase-fd 0 -o -") or die
			"Couldn't open gpg: $!";

		print GPG $filekey, "\n";
		print GPG join('', @lines);
		close GPG;
		@lines = ();
		$filekey = MD5->hexhash($filekey);
	}
}


