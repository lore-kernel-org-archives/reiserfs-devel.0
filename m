From: David Masover <jedi@ninja.dynup.net>
Subject: A bold idea (Re: Carrying Attributes too Far)
Date: Thu, 04 Dec 2003 21:58:42 -0600
Message-ID: <3FD00272.7040607@ninja.dynup.net>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

lrc1@st-andrews.ac.uk wrote:

 >Quoting Hans Reiser <reiser@namesys.com>:
 >
 >...
 >
 >
 >
 >>lrc1@st-andrews.ac.uk wrote:
 >>
 >>
 >>
 >>>Sorry for the delay in replying.
 >>>
 >>>Quoting Hubert Chan <hubert@uhoreg.ca>:
 >>>
 >>>
 >
 >...
 >
 >
 >
 >>>Yes, it is impossible to hard-link between two files on different 
volumes
 >>>(except at mount points) in the Unix filesystem, but it shouldn't 
be. (More
 >>>generally, with the necessary permissions it should be possible to 
make any
 >>>
 >>>
 >>file
 >>
 >>
 >>>the child of any directory via a hard link, except where doing so would
 >>>
 >>>
 >>create a
 >>
 >>
 >>>cycle.)
 >>>
 >>>
 >>>
 >>This implies that two filesystems can share an identification number
 >>between them.
 >>
 >>
 >
 >I would suggest that for every link to a file on a different 
filesystem, the
 >linking directory should store both an identifier for the child file's
 >filesystem and the child file's on-disk inumber on that filesystem.* 
The reverse
 >
 >
 >
Here's a crazy idea -- maybe performance can be improved to the point
where it's actually more efficient to have one large partition to begin
with?  Back to hda1 is /boot, hda2 is /, and hda3 is swap?

That gets rid of the hardlink problem, and also the problem of making
decisions about partitioning.  Other features of Reiser4 like plugins
eliminate any need that might arise from things like Cryptoloop.  In
fact, maybe other filesystems will be implemented as Reiser4 plugins to
a .img file, but that's probably going a bit far.

I agree that hardlinking directories should be allowed, and I think it's
worth it to check whether it creates a loop, unless rm can be modified
to simply rm the directory, and the filesystem (and maybe VFS) would be
modified to have directories have link counts that don't include . or
.., so when a directory is to be deleted, the system does its own manual
deletion of each of the files within it.  Then, if I type 'rm loop' and
it removes the link of 'loop/loop' to 'loop', there are now no more
links to 'loop' and it gets destroyed.

I'm a teenager, I have the right to try to be revolutionary!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9ACcgisZLIF6uqOAQLw8w//YrJkVSGlur5XUL92Aem65aOz6lP41ATm
pmiakJMfL3Qbd1/UekO+UsdwJl7Sz8EvA0eqGpPeaOlgEa7TfvkAhGNvsGlKmQEj
89goTZltrd4FM3emZUOgabLg8RQLEbKlq58QAz4GoSTClaOz7P2FaCrNr6fXgZ5U
DSVBqO7I/YYCdHUvQtKUipahM+KR/BZbM7CnFkCZZtsRGGzGGEl0kphRC3+tYWv0
ELcuA9MB1B8ASdpGREgU9T27YMUh7N2hrU/rQwb1WRanvO8Kb8rES4SyqyqNdPqG
6onWyu2a6PwVWH5WA0yn58DE7g05X1aOkYr3wsfDmBxuJeSECHJugJ39vM78oXaB
tc/uwYn2ZDak/Hijwltj7hJiLmaR13M6NUGAY8Q5UXgiW4lXTnXEFl68CdG+DbZz
IGREme+ftlozyezyipqVEoJSdGFxSYO9DL8AtV+KKET3OEHVw+fR2ATLrDH1QPCy
OiHYh6BE/339o2bIfiCO9TuIWSyo4nSr11M/9xwC+FCbxxm17DqxUNe5+WOYNT1j
Hb1k+2ESM3o9tbrmquCs8ohA0Unr9L7lZiX6e6L4FJe1JLyRQznMq2Gks39jN5JI
gkeG2zWyXgBUjZ5WJ3p734cHetq139qc/narnii+MLpwk0OnjyLOe/UzH1xnwZCl
N2CHJZje340=
=pVUD
-----END PGP SIGNATURE-----

