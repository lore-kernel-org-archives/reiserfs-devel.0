From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: More on Hard Links
Date: Tue, 09 Dec 2003 13:48:44 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87vfopyghf.fsf@uhoreg.ca>
References: <5450026541-BeMail@cr593174-a> <20031209052107.58404.qmail@web25009.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16302-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Narcoleptic" == Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk> writes:

[...]

Narcoleptic> A. Symlinks:
Narcoleptic> ============

[...]

Narcoleptic> 2. By file (i.e. volume id and file id).  File id is a
Narcoleptic> unique identifier for the file on the volume (eg.  inode
Narcoleptic> number).  Not sure if there is a way to uniquely identify a
Narcoleptic> volume reliably...

I don't think it's a good idea to classify these as symlinks.  For one
thing, it's called a "symbolic" link, because the link contains a
symbol: a path name.  Also, it works differently from regular
symlinks.  IMHO, it would be better to give it another name.  (This is
what I would call a "firmlink", and I think what Leo calls a "weak
link".)

[...]

Narcoleptic> 2. Linking to a file on a different ReiserX
Narcoleptic> volume.
Narcoleptic> ---------------------------------------------------

I believe the plan is to have Reiser5 be a distributed filesystem,
which will basically (AFAICT) solve all our problems and eliminates the
need for cross-ReiserFSx hard links.  IMHO this is the better way to do
things, since a distributed filesystem will already take into account a
lot of problems that we have.

Not to say that you (or Leo) shouldn't pursue this idea.  You may not
want to use the distributed stuff, or you may want to implement it as a
proof of concept to convince other FS maintainers to add it to their
FS, or etc.

[...]

Narcoleptic> My idea: Each volume can contain a "synchronized" copy of
Narcoleptic> the underlying file.

My first reaction: "Bwaa!  Wasted space!  Consistency problems!"

Wasted space, you're of course aware of.  But then, the number of
hardlinks is probably not that large, so we won't have that many
duplicates.

Consistency problems you've dealt with, sort of.  I'm a bit wary of
preventing the file from being changed if not all the involved volumes
are mounted.  Also, if one volume dies and needs to be reformatted, or
removed, you need to have some way of recovering.  It's hard to
differentiate that from the volume just being unmounted.

[...]

Narcoleptic> The principle of least privilege applies: if a file is on a
Narcoleptic> non-writable volume, no files synchronized with it are
Narcoleptic> modifiable.

So then you have the case where you have a file that's on a read-write
partition, has all the bits necessary for writing, but is read-only.
I'm not convinced this is the best thing to do.  But if you must have
cross-filesystem hardlinks, I think this is what you must do.

Really, it's a compromise.  I look at this situation and say: this is
why we can't have cross-filesystem hardlinks.  Others may look at it
and say: I really want cross-filesystem hardlinks, and so this is what
I will do, which is reasonable, and doesn't completely suck.

[...]

Narcoleptic> 3. Linking to a file on a different non-ReiserX
Narcoleptic> volume.
Narcoleptic> -------------------------------------------------------

Narcoleptic> Not possible (because "file synchronization" management
Narcoleptic> code would be unique to ReiserX).  User either has to use a
Narcoleptic> symlink or make a copy.

Well, if you implement it on ReiserFSx in a reasonably portable way,
you may be able to convince other FS maintainers to use it (if they
aren't completely opposed to the idea of cross-filesystem hardlinks).

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

