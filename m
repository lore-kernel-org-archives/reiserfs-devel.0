From: Todd Lyons <todd@mrball.net>
Subject: Rapid system transfers
Date: Fri, 19 Mar 2004 17:54:10 -0800
Message-ID: <20040320015410.GB10665@mrball.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17336-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Recently we've had the need to move a few machine instances from one
physical machine to a more powerful machine.  These machines use Reiser
(an old version, don't know exactly which one, but it's probably RH 8.0)
because a portion of the fs contains a lot of small files.  It requires
us to basically bring the system down (database) and rsync it over to
another box.  On boxes where we have ext3 filesystems, we can do
dump/restore and have the systems up and running in a couple of hours.
We don't have the same luxury with this Reiser system.  rsyncing a few
million files (100 GB) across a 100 Mbit link is much slower than a
comparable dump/restore.

What do others do to handle this situation?  Are there tools and
utilities out there that I'm not aware of?
- -- 
Blue skies...	Todd 	  Public key: http://www.mrball.net/todd.asc
SourceForge Syndrome (ie, how to damage other open source projects):
   Q. I found a problem/bug/annoyance, how do I solve it?
   A. Clearly, a brand new sourceforge project is called for.
Linux kernel 2.4.22-12.tmb.1mdk   2 users,  load average: 0.00, 0.00, 0.00
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: http://www.mrball.net/todd.asc

iD8DBQFAW6RCIBT1264ScBURAnmVAJsGDDyDdIV/t4TEZO7ZMUbG1BVlSQCePbXh
R4z/+jGhzbEmniEVSS+OJ5U=
=hZie
-----END PGP SIGNATURE-----
