From: Valdis.Kletnieks@vt.edu
Subject: Re: Fibration questions
Date: Mon, 19 Jul 2004 18:06:03 -0400
Message-ID: <200407192206.i6JM63ZC010743@turing-police.cc.vt.edu>
References: <20040719072026.1959F15D1B@mail03.powweb.com>
            <40FC3E56.2020603@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1217625615P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 19 Jul 2004 16:34:14 CDT."
             <40FC3E56.2020603@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_1217625615P
Content-Type: text/plain; charset="us-ascii"
Content-Id: <16655.1090274722.1@turing-police.cc.vt.edu>

On Mon, 19 Jul 2004 16:34:14 CDT, David Masover said:

> Why beyond?  Ask each fs object (without knowing its name), "What is
> your primary type?"  Put like-typed objects together.  Simple.

Here there be dragons.  And you just met one. :)

> On top of that, we only have to assign the file type once -- at
> creation.  For the rest of the file's lifetime, until someone decides to
> change its type, the type is a bit of static metadata, as optimized
> (fast/small) as file permissions, much faster and smaller than file
> extensions.

Congrats - combining these two means that (for example) if you slice-n-mice a
script fragment out of a file and save it, and then go back and add that little
'#!/bin/bash' line after the fact, your file now lives WAAAY over there with
all the other *.txt files, rather than over HERE with the other shell scripts.

You think I'm kidding?  Consider the following file found in the syslog-ng-1.6.4 tarball:

[~/src/syslog-ng-1.6.4] head contrib/init.d.RedHat-7.3 
################################################################################
#
# Program: syslog-ng init script for Red Hat
#
################################################################################
# the following information is for use by chkconfig
# if you are want to manage this through chkconfig (as you should), you must
# first must add syslog-ng to chkconfig's list of startup scripts it
# manages by typing:  
#

So you copy that to /etc/init.d - what type is it?  Could be Perl, could be Bash,
and the 'file' command thinks neither:

[~/src/syslog-ng-1.6.4] file contrib/init.d.RedHat-7.3
contrib/init.d.RedHat-7.3: ASCII English text

Wander over to SELinux and see what sort of fun and games you have to play to
do file labelling - and SELinux is able to make simplifying assumptions based on rules
like "All files under this directory are labelled foo_t, and all files in that directory inherit
a label based on their context" (somewhat similar to how files inherit their group-id
on most Unixoids)...

The file_contexts in Fedora is fast approaching 1,600 different regular expressions for
files to assign a label to them.  Large and nasty dragons, indeed....

--==_Exmh_1217625615P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFA/EXLcC3lWbTT17ARAt5kAJ9QEYzkAHdyeqMKcZKwTuifs4zkqACg6uNf
NCEBcBUibrobCmDn2Mloc7Y=
=/2Q+
-----END PGP SIGNATURE-----

--==_Exmh_1217625615P--
