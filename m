From: Valdis.Kletnieks@vt.edu
Subject: Re: Interesting deletion idea
Date: Fri, 08 Oct 2004 20:22:42 -0400
Message-ID: <200410090022.i990Mgcj001091@turing-police.cc.vt.edu>
References: <41662BC7.80309@comcast.net> <200410082214.i98MEbfT003666@turing-police.cc.vt.edu>
            <4167282E.9030901@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-309497280P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22035-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 08 Oct 2004 19:52:14 EDT."
             <4167282E.9030901@comcast.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: John Richard Moser <nigelenki@comcast.net>
Cc: reiserfs-list@namesys.com

--==_Exmh_-309497280P
Content-Type: text/plain; charset=us-ascii

On Fri, 08 Oct 2004 19:52:14 EDT, John Richard Moser said:

> I thought the DOD algorithm was 7 pass?

Citation please?  If you have a better reference than DOD 5220-22.M,
feel free to share it.

> If this is going on rapidly, there's no point in trying to completely
> destroy the disk for *every* logical operation; but buffering the
> operations and then only doing the most recent one, and destroying the
> area before that one exactly, would be OK.  The idea is that rapid
> overwrites from userspace get collapsed into a single overwrite; and
> then the kernel overwrites a bunch of times before flushing that data to
> disk to securely erase it.

The point is that you have no really good way to know beforehand that
the flurry of writes is over, and it's time to collapse the writes into
a single write.  

To demonstrate using your example:

a = open("/some/file.txt");
seek(a, 0, 0);
fputc(a,'N');
seek(a, 0, 0);
fputc(a, 'D');
seek(a,0,0);
fputc(a, 'X');

At what point do you do the overwrite?  You place it just before the
fputc 'X' - but you can't really delay to that rather than at the
'N' or 'D' unless you *know* that the 'X' one will happen 'Soon Enough'.
There's also the point that fputc() is stdio and buffered by default,
unless you've called fflush() or setlinebuf() or similar.  Even if you
look at the read()/write() syscall level, the Linux kernel will almost
certainly automatically do most of the needed collapsing in the buffer
cache code (look at fs/buffer.c for the gory details) - in fact, most
of the time, you need to use fsync() or similar to *force* the data to
actually get to the disk (often, the data doesn't go out until long after
the process has actually exited - and then there's the different way
that the different I/O elevators schedule things, just to add another
layer of unpredictability into things).  The end result is that it's
a lot harder than it looks to get this right...

In addition, doing the overwrite at *THAT* point is *the wrong point* - as
you're about to overwrite the block at least once *anyhow*.  You *really* need to
be doing erasing in the handling for the unlink() and (f)truncate() syscalls,
because *that* is the point you're freeing the disk blocks - and the point of
erasing is to prohibit scavenging of old data off the disk.  This has the added
benefit of being something you *can* do basically at the filesystem's leisure,
subject to a requirement that you return blocks to the free list fast enough
to prevent disk space exhaustion (which is trickier than it looks - under heavy
file create/write/read/unlink loads, you need to be doing it as fast as possible
at exactly the time you have the least idle bandwidth - at worst case, a 3-pass
erase of all blocks will limit you to 25% of the effective write bandwidth in a
steady-state high-load situation).

Also, you *really* need to be *very* careful regarding write barriers and the
like - look at the linux-kernel archives for the last few months where a *long*
series of threads about the problems on IDE.

Basically, if the drive has a write cache on it, you have to either disable
it or jump through some *real* hoops in order to get strictly correct write
barrier semantics (and on some drives, the situation is totally impossible).



--==_Exmh_-309497280P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBZy9RcC3lWbTT17ARAnnkAJ4pjySDu+oX6zwlQSZA7ovv18IQTwCeJxl9
W8+pWRKQvC1qEUI7SHTCcIg=
=KFFx
-----END PGP SIGNATURE-----

--==_Exmh_-309497280P--
