From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Plugin for corruption resistance?
Date: Fri, 18 Feb 2005 22:28:33 -0500
Message-ID: <e692861c0502181928114fab9e@mail.gmail.com>
References: <e692861c05021110583585f84e@mail.gmail.com>
	 <loom.20050215T213823-62@post.gmane.org>
	 <42141928.7080608@slaphack.com>
	 <200502171153.43403.chrivers@iversen-net.dk>
	 <4215644C.4000602@slaphack.com>
	 <200502180428.j1I4S92I019716@turing-police.cc.vt.edu>
	 <e692861c0502180536270fcee2@mail.gmail.com>
	 <200502182209.j1IM904m016607@turing-police.cc.vt.edu>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502182209.j1IM904m016607@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Valdis.Kletnieks@vt.edu" <Valdis.Kletnieks@vt.edu>
Cc: reiserfs-list@namesys.com

On Fri, 18 Feb 2005 17:09:00 -0500, Valdis.Kletnieks@vt.edu
<Valdis.Kletnieks@vt.edu> wrote:
> On Fri, 18 Feb 2005 08:36:51 EST, Gregory Maxwell said:
> 
> > Tree hashes.
> > Divide the file into blocks of N bytes. Compute size/N hashes.
> > Group hashes into pairs. Compute N/2 N' hashes, this is fast because
> > hashes are small. Group N' hashes into pairs compute N'/2 N'' hashes
> > etc.. Reduce to a single hash.
> 
> You get massively I/O bound real fast this way.  You may want to re-evaluate
> whether this *really* buys you anything, especially if you're not using some
> sort of guarantee that you know what's actually b0rked...

I brought up tree hashes because someone pointed out there was no way
to incrementally update a normal hash. Tree hashes can easily be
incrementally updated if you keep all the sub parts.

I don't think that would suddenly make it useful for frequently updated files.
 
> > In my initial suggestion I offered that hashes could be verified by a
> > userspace daemon, or by fsck (since it's an expensive operation)...
> > Such policy could be controlled in the daemon.
> > In most cases I'd like it to make the file inaccessible until I go and
> > fix it by hand.
> 
> You're still missing the point that in general, you don't have a way to tell whether
> the block the file lived in went bad, or the block the hash lived in went bad.

I'm not missing the point.  Compare the number of disk blocks a file
takes vs the hash. Compare the ease of atomically updating the hash
data vs atomically updating the hash.
If they don't match, It is far more likely that the file has been
silently corrupted than hash has been.. In either case, something
seriously wrong has happened (i.e. that *any* data has been corrupted
without triggering alarms elsewhere).

Wetware will be required figure out what is going on.
Perhaps correct a serious problem before it eats the whole file system...

Automagic correction of stuff that is automagically correctable is
useful in that it might prevent something worse from happening... For
example, if the corrupted file was /sbin/init.. regardless of the
cause of the problem I'd be glad if the system took some action while
the wetware was in an uninteruptable sleep. ;)
 
> Sure, if the file *happens* to be ascii text, you can use Wetware 1.5 to scan
> the file and tell which one went bad.  However, you'll need Wetware 2.0 to
> do the same for your multi-gigabyte Oracle database... :)

Such a proposed system would likely not be all that useful on a live
database.. the overhead of computing hashes would likely be too
great..  Rather, it would be useful if the database system used it's
knowledge of how data was stored to do this efficiently.

If the database system were written with reiserfs in mind and rather
than using a couple of big opaque files it stored it's data in tens of
thousands of files... then perhaps such a hashing scheme might
actually work out okay.

> (And yes, I *have* seen cases where Tripwire went completely and totally bananas
> and claimed zillions of files were corrupted, when the *real* problem was that
> the Tripwire database itself had gotten stomped on - so it's *not* a purely
> theoretical issue....

The discussion is to store the hash in the file metadata.  ... If that
is getting stomped on, it's a *good* thing if the system goes totally
bananas. In a great many situations I'd rather lose a file completely
than have some random bytes in it silently corrupted. (and of course,
attaching hashes doesn't mean you lose the file... it means it gets
brought to your attention)

As things stand today, there are hundreds of ways a system could end
up with files getting silently corrupted.  Many of them would be
fairly difficult to detect until it's far too late (to recover cleanly
or even detect the root cause).  Right now most distros have a package
management system that can detect changes in some system files, which
is useful against a small subset of these problems, but not most since
it will only detect problems in files that almost never change.

The proposed system of attaching hashes in metadata would protect all
files that are not constantly updated (so that counts out database and
single file mailboxes), but could protect most everything else.  ..
And the things that can't be protected could be with changes to their
operation that would be useful to make for reiserfs due to other
reasons. (there is no performance reason in reiserfs to make a mail
box a single file, for example).

Furthermore, attached hashes could greatly speed up applications using
hashes in a way that no userspace solution can:  Userspace solutions
can't maintain a cache of the files hashes because they have no way to
be *sure* that the file wasn't monkied with while they weren't
watching... so caches are useless for p2p apps or for security
checking.. (and useless for verifying that the system isn't silently
corrupting data, except for completely static files).    If the
integerty of the hash is insured by the file system then your trust of
the hash should be equal to your trust of the kernel, which is the
same level of trust you have in read(), thus you should be able to use
the stored hash in any place where you'd read the file and compute the
hash itself.

I agree that there are applications for additional realtime block
level protection which can't be provided by hashes-as-metadata.  These
would be better addressed via device-mapper... We don't see them
because it's hard to avoid them because they often become useless due
to an overlap with the disks underlying protection. (because all
modern disks have ECC, we tend to lose entire physical blocks at a
time. Since we can't access the underlying correction data in a useful
way we can't use it in correction...we might be duping it entirely,
and worse, since a block level ecc or CRC scheme would change the size
of a disk block, we'd end up with all blocks taking multiple disk
blocks... Even ignoring the potential performance and atomicity
issues, this would greatly increase the impact of block level
corruption: you'd always lose two blocks!)

Raid and disk ECC address low level corruption.  *Some* applications
do testing to catch higher level corruption, but the vast majority
don't simply because it's not the applications primary duty to make
sure it's host isn't broken.
