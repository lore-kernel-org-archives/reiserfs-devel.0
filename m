From: Valdis.Kletnieks@vt.edu
Subject: Re: A couple of questions
Date: Fri, 17 May 2002 09:10:41 -0400
Message-ID: <200205171310.g4HDAgmD005059@turing-police.cc.vt.edu>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com> <3CE41796.4030404@namesys.com>
            <200205161723.42672.kuba@mareimbrium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_147073411P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10359-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Thu, 16 May 2002 17:23:42 EDT."
             <200205161723.42672.kuba@mareimbrium.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Kuba Ober <kuba@mareimbrium.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_147073411P
Content-Type: text/plain; charset=us-ascii

On Thu, 16 May 2002 17:23:42 EDT, Kuba Ober <kuba@mareimbrium.org>  said:

> Why on earth does a filesystem check & recovery program need to ask questions 
> to the user, which most users w/o intimate filesystem knowledge won't be able 
> to answer at all? Looking at this list, what people want is to get their data 
> back, as much as possible. They never want to get less than that. Why bother 
> asking?

Well.. at least "traditionally", it was possible for a filesystem to get
scrozzled in ways that just saying 'y' would result in more data loss than
one judicious 'n' at the wrong time.  There's been more than once in the last
two decades that I've had  fsck dropping zillions of files into lost+found/ because
it decided that they were in invalid directories.

Why were those directories invalid? Because their .. pointers were broken.

What was wrong with their .. pointers?  They pointed at a directory that had
a bum .. as well...

End result?  If you answered 'n' to all the "relink?" questions *except* for
the one actual broken one, you ended up with an almost-intact directory tree
in lost+found, and a simple 'mv #004 ../real_name' would finish it, rather than
3 zillion #nnnn entries with no directory structure at all.

The ugliest one of these was on a system where fsck refused to grow lost+found
(because doing so would require more blocks - which are hard to get if you
can't trust the free list at the moment - that's why old mkfs commands would
have a loop that touched a bunch of files in lost+found and then rm them - just
to grow the directory size).

So quite often, you'd end up doing an 'fsck -n' once to figure out what was
scrogged, then re-run it several times, answering 'y' to things in the right
order...

/Valdis (who has had Very Bad Weekends from this issue ;)


--==_Exmh_147073411P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE85QFRcC3lWbTT17ARAk8bAKD3PLl9Dh1zftX1yfivyU5Ib2eqlwCgou9O
7Wh8QV94slqyI751XY+2row=
=M7Eg
-----END PGP SIGNATURE-----

--==_Exmh_147073411P--
