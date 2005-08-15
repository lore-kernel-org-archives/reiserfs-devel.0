From: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Subject: Re: where is the journal kept?
Date: Mon, 15 Aug 2005 09:19:21 -0700
Message-ID: <d9a6586e05081509195017d679@mail.gmail.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>
	 <20050815125025.GA29390@tranquility.scriptkitchen.com>
	 <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>
	 <4300A603.2050602@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4300A603.2050602@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On 8/15/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Pat Double wrote:
...
> reiser4 has no filesystem area dedicated for journal.
> Instead it allocats log(journal) records dynamically.
>=20
> it is transactional.
> > If that's the case, why this option in debug.reiser4 :
> >
> > Usage: /sbin/debugfs.reiser4 [ options ] FILE
> > Print options:
> >    -j, --print-journal           prints journal.
> >
>=20
> yes, this prints reiser4 "wandering logs".

Suppose a new file was being created; when the journal entry for the
new file actually gets converted to an inode, can it be done without
rewriting the whole file?

What if the program was only writing part of the file?  Is journalling
involved in that?  If so, does it duplicate the whole file?  It
doesn't duplicate it more than once does it?  (first into the journal,
then re-write it on the filesystem later)?

What I'm getting at is whether Reiser4 is any better for a flash-based
filesystem than Reiser3?  I was interested in using it on a CF card in
my Zaurus, but the guys on the oe list are saying that journalling
filesystems are bad in general on flash, because they involve
rewriting the same areas of the flash (where the journal is) over and
over.  I was thinking that CF and SD cards both use smart block
allocation so that actually the writes are getting spread around on
the physical flash memory; but it's still bad if every time you write
a file, it's getting written 2 or more times. If you have gotten it
down to just writing the main part of the file once, and then
re-writing some sort of header from the journal into the "real" fs,
then the reduction of the life of the flash might be tolerable.

The other problem with using it on the Z is that busybox's version of
mount does not support ReiserFS, so I'd have to compile another
version for it.  (Not a big problem, but I wonder why busybox doesn't
support it in the first place.)
