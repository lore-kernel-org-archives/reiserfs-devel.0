From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: More on Hard Links
Date: Tue, 9 Dec 2003 18:47:40 -0500 (EST)
Message-ID: <20031209234740.27534.qmail@web25010.mail.ukl.yahoo.com>
References: <87k755y8xf.fsf@uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16308-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87k755y8xf.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hubert Chan wrote: 

> "Narcoleptic" == Narcoleptic Electron writes:
> 
> Narcoleptic> You can copy the hard link, then use it
> as a regular local
> Narcoleptic> file (the sync list doesn't get copied
> with the file).  You
> Narcoleptic> can also delete the hard link if you
> want (thus replacing
> Narcoleptic> the actual file with that "NULL"
> placeholder if its
> Narcoleptic> reference count is 0).
> 
> I think that scheme may result in space wastage
> since you have
> to maintain the NULL placeholder, and can't reclaim
> the space.

If there is a way to quickly and reliably verify that
two files are identical (or not), then when committing
a transaction, each file in the sync list can be
resolved as follows:
- If a volume ID is not found, don't commit anything
(as per the current proposal).
- Otherwise, if a file ID for a given volume ID refers
to a file not identical to the current file (or is not
found), remove the file from the sync list.

This way, we don't need the "NULL" placeholder...
simply delete the file when its reference count
reaches 0, as usual.  This removes space reclamation
issues if a volume goes down.

This is a far better solution, because there is no
need to worry about global uniqueness of volume IDs or
file ID reuse within volumes.

> But my concern with that was that if one partition
> needs to be
> reformatted, then the other instances of the link
> become unwritable.
> So if you want to recover, you would have to copy
> the file and manually
> re-link everything.  There's no way to automatically
> recover.

It would be pretty easy to write a script to do this. 
This script would be pretty useful, in fact... good
thinking.

> Narcoleptic> ... Each file could have a pseudo-file
> attribute (i.e.
> Narcoleptic> "+/Online") ...
>               ^^^
> 
> Oh great.  Are we going to get into the debate on
> how to name
> attributes again? ;-)

Well, although the subject line has been changed many
times, I believe we are still on that thread!  ;-)

> >> It's hard to differentiate that from the volume
> just being unmounted.

There is no need to differentiate from a volume going
down and just being unmounted.

> Narcoleptic> Shouldn't all files on a read-only
> partition automatically
> Narcoleptic> have their permission bits set to
> read-only (or at least
> Narcoleptic> appear that way)?
> 
> Hmm.  I don't think so.  I'm not sure.  I don't have
> any r-o partitions
> right now, so I can't check.

If it doesn't work this way, I think it should.

> Narcoleptic> If so, then all files will have the
> permission bits set
> Narcoleptic> identically, and no problem.
> 
> But then you run into the problem that you can't
> change the permissions
> on a file that's on a read-write partition, which
> would be unexpected
> behaviour, IMHO.

It wouldn't be expected for offline files, which would
be clearly denoted as such.


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
