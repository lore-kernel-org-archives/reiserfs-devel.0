From: David Masover <ninja@slaphack.com>
Subject: Re: external journal questions
Date: Thu, 23 Feb 2006 04:21:46 -0600
Message-ID: <43FD8CBA.7060307@slaphack.com>
References: <20060221160411.65704253.pegasus@nerv.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
 protocol="application/pgp-signature";
 boundary="------------enigCA4AC02FE5D07DCE12D138F8"
Return-path: <reiserfs-list-return-28115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060221160411.65704253.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

--------------enigCA4AC02FE5D07DCE12D138F8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jure Pe=C4=8Dar wrote:
> Hi all,
>=20
> Now that solid state disks are getting affordable (Gigabyte iRam, for
> example), it makes sense to use them as external journal with full data=

> journaling, so they cache all the small writes and dump them to disks
> in one single sequential write on every journal flush.

Where can I find the paper on why this makes sense?  Because offhand, it
doesn't, unless you're hoping that the majority of transactions can be
flushed on boot, rather than unrolled.

> I know how to configure that under ext3. Simply set up external journal=

> and mount filesystem with data=3Djournal and commit=3D600 or some such
> value. But I'm not so sure about reiserfs.

v3, I don't know, it's probably closer to the way ext3 works.  Closer,
not exactly, because ext3's on-disk format is ext2 + a journal file, so
it's going to be the easiest to move to another device.

I'm going to assume you aren't talking about v4, since this sounds like
a mission-critical production-style environment.  As I understand it, v4
has a completely different way of doing journaling.



I'm replying to you, not because I actually have an answer for you, but
because your case seems interesting, and I'm curious how Reiser4 handles =
it.

Currently, my v4 is built like this:  I have 2 gigs of RAM and about a
350 gig Reiser4 partition.  I have a custom patch that replaces the
sys_fsync system call with a stub, because fsync performance is worse in
Reiser4 than in anything else, and because fsync gets horrendously
abused by so many programs I use.  Flushing on my system is a privilege,
not a right, and abusing the fsync call means I've revoked that privilege=
=2E

So, basically, application says "Oh my GOD and all that is holy, this
piece of data MUST be written to disk now!"  The OS ignores it, and puts
it in the write buffer with everything else.  At this point, nothing
will touch the disk until I need RAM (even for more disk cache), or I
run a "sync" call myself (not an fsync call), or I unmount the FS (shut
the box down).

This makes performance much better, but it sucks for me when my
not-entirely-stable box (overclocked, has proprietary nVidia graphic
drivers) decides to crash.  Now, I have to say, Reiser4 has proven quite
durable, and I haven't actually had significant corruption.  I have,
however, lost the small amounts of data that never made it to disk.

Now, fsync is basically a kind of transaction, and in the future,
Reiser4 will be doing all kinds of transactions.  Could be an email
server, for instance.  The mail server wants to complete the transaction
of adding a new mail to someone's inbox, or at least to some local
spool, before it tells the other server that it successfully received
the message.  Now, obviously, we don't want every message immediately
forced onto the disk, because that would kill performance.  But if we
don't do that, if we let those transactions stay in RAM, then when the
mailserver loses power, it WILL lose messages.

Lose, as in permanently.  Now, imagine it's something even more
important, like a bank computer.  You can't just "roll back" someone's
mortgage payment, can you?

So, in order for performance not to suck, and to keep fragmentation
down, we want a bunch of transactions to be flushed to disk at once.
But in order to not lose data, we want every important transaction to
immediately be guaranteed not to be lost.

So, you buy some battery-backed RAM or some such, and flush your
transactions there first, and be sure they are successfully written to
the "journal" device before you OK the purchase or accept the email or
whatever, and then, when that device starts to fill up, you flush it out
to the real hard disk.

Problem is, I see nowhere for this to fit in the current model of
Reiser4.  As I understand it, there is no concept of a separate
"journal" device, or of writing a file twice, because the vast majority
of writes are simply written out to disk in the new location, and then
the "commit" is updating the metadata to point to the new location and
free the old.

But, at least some code must already be there, right?  Because I know at
least in theory, some writes happen twice -- things like updates to a
database file.  Tiny changes to huge files would be written once to a
new location, and then back to the old, so the file stays in the same
place on disk, and doesn't get fragmented.

Could that logic be adapted to write first to some journal device, and
then to the original location on disk?  And to use the same
memory-pressure strategy that currently drives the decision to flush
from RAM to disk?  (That is, be lazy about moving stuff from the journal
device to the real medium...)

Could it be done flexibly?  For instance, have a number of "journal
devices", from your RAM all the way to your real disk, and be able to
specify which ones are faster (be lazy about moving from a faster device
to a slower one) and which ones are stable (at what point can we be sure
the data won't be lost to a power failure)?  Because obviously, there
will be degrees of persistent storage, just as there are degrees of
volatile storage, from swap to RAM to cache to register.

I would argue that, while an attempt could be made to do this
transparently, it shouldn't.  For instance, Laptop Mode is a set of
patches to try to not use the hard drive at all, but whenever you have
to spin it up, flush everything you can.  It's sort of lazy writes to
save battery.

I would argue that the filesystem can and should know about lazy writes,
even if you still need Laptop Mode to tell it to flush on reads.  And
the filesystem can and should know about fast, nonvolatile storage.

But, why that's a good idea, I'm not sure of right now, because it's
bedtime.  Ask me tomorrow, or write your own rant.



Well, end of rant.  Someone else gets to have fun coding this, because I
have to do some Real Work.  As in School.


--------------enigCA4AC02FE5D07DCE12D138F8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iQIVAwUBQ/2MungHNmZLgCUhAQOlwxAAmaMurx305YWzxJcfLbZj3qfX+3pktmme
f57tvhbIkUidKJBaG8NqVPGcFo69wev4L048W1ks7FsqgDpZKwasnpA/XIbLdYL2
+jnuwpcBl3fqaVKZJ4C1psnoC5SfxS8zEFKGltW/kndYXrNdFiEWA71meyO/u8XR
kjikARHDHO+jinWIfPecso79Jxgud9OjPzb/PSXuEdyeexQLHztR1MnGu5U5itgj
OrXtaJfQ8nc5PO6yRvQOPPUdf8Ffal1xZ/Y9Bci2WdrxuqXLSNieWZq29ohpmqP8
sbEOe7w+KFCKMag6SqJGbg0MCbIOvhtwVlmsTE8OBL5fIWWZgQGEzticWcimsoux
699YEiIXz3w9Chw+I2NXA/S+sYBlKA6YlaY7c/EvW458D5Jircmkdg7Xj44TSCoI
sxKFJK5JZNJpxXPwNCpiQNbT4SxQ/+wpl1nQOf25Rgd8MS7bnCgmNIuL0JQXJ/lB
i4GUFR28tt5S6zsX27frESOsLzXvkOtryjuSvevkt58byiEtLVwoq9v3p4J0IvHo
AHEDY0IqP9j+L0SiHLbz9gbDoMa7/UxsgqfynWzGJPJO9yKpjtuoRdPt+3kz8xpH
5LRn9TyxuAWW47zrSzW1KWBWTNs+0qOb4q15QA3BZaqicSJOEnpNhoBc/nQyJ6Lw
k/dY6sMqD90=
=qaXO
-----END PGP SIGNATURE-----

--------------enigCA4AC02FE5D07DCE12D138F8--
