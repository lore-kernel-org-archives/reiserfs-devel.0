From: Valdis.Kletnieks@vt.edu
Subject: Re: metas Permission Denied
Date: Thu, 29 Apr 2004 12:59:28 -0400
Message-ID: <200404291659.i3TGxSNP019093@turing-police.cc.vt.edu>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu> <16528.46352.173184.528623@laputa.namesys.com> <39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu> <16529.9818.916980.360020@laputa.namesys.com> <200404291614.i3TGEoAI017900@turing-police.cc.vt.edu>
            <16529.11188.555986.964130@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-260260928P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 29 Apr 2004 20:22:12 +0400."
             <16529.11188.555986.964130@laputa.namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list <reiserfs-list@namesys.com>

--==_Exmh_-260260928P
Content-Type: text/plain; charset=us-ascii

On Thu, 29 Apr 2004 20:22:12 +0400, Nikita Danilov said:
> Eh? What I described is precisely decades old meaning of rwx bits for
> directories.

Exactly.  The problem is that the rwx bits have had other meanings for decades
on "regular files"..

> Problem is that we have to fit objects that are both regular files and
> directories into access control scheme that wasn't designed for such a
> mix. I don't see better solution short of inventing new bit(s).

AIX/370's 'Transparent Computing Facility" had similar issues with "hidden
directories", and HP/UX apparently had "context sensitive directories".  AIX/
370 mostly used it to support transparent usage of binaries across multiple
architectures.  So for instance,

/bin/ls@  was a directory, with an additional flag in the inode saying 'hidden'
(you needed both the trailing @ and the flag).  Then in the directory, you'd
have two or more binaries "i386" "i370" "xa370" for various architectures.

I spent a good chunk of 3 years fighting the resulting brain damage - although
it *mostly* worked OK, the corner cases kept popping up.

Imagine *every* bug you've ever seen that involved confusing the 'stat()'
system call with 'lstat()', and every bug that's ever been caused because of
the blurring of "mount point" and "directory"..  Now imagine that *every file*
on the file system can trigger that sort of bug, not just the relatively small
percentage of files that are mount points or symlinks.....

Trust me - you *really* want to create a new bit, simply to avoid breaking
every program that thinks the old bit has the usual semantics.



--==_Exmh_-260260928P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAkTRvcC3lWbTT17ARAnHrAKDectpAyAAYhPkY/UI7rqqiUzM/FwCfXo8z
JrjhkbQu+ne8I41vNa1q1Xs=
=2FOf
-----END PGP SIGNATURE-----

--==_Exmh_-260260928P--
