From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: More on Hard Links
Date: Tue, 09 Dec 2003 16:31:56 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87k755y8xf.fsf@uhoreg.ca>
References: <87vfopyghf.fsf@uhoreg.ca> <20031209195240.19057.qmail@web25006.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16305-reiserfs=m.gmane.org@namesys.com>
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

Narcoleptic> I don't know much about Reiser5's distributed fs
Narcoleptic> plans... more reading is required for me here.

Me neither.  I've only heard Hans mention it a couple of times.  I
don't think there are many details available (and there probably won't
be until Reiser4 is ready).  But I assume it would provide something
similar to what you get with Coda, or AFS, etc.  Which I also don't
know a whole lot about, but some of them contain provisions for
maintaining local copies of some files, and synchronizing them if
something goes offline.

[...]

>> Wasted space, you're of course aware of.
>> 
>> [...]

Narcoleptic> No, I'm not aware of any wasted space in my plan.  Each
Narcoleptic> volume must have its own copy of the file so that it is
Narcoleptic> available when the other volume dismounts.

Well, I guess you wouldn't call it "wasted", since it is needed, but
basically, you have to have multiple copies of the same file, instead
of just the one copy with normal hard links.

>> Consistency problems you've dealt with, sort of.

Narcoleptic> What cases have I missed?

Well, I'm not completely satisfied with the condition that you can't
write to a file if the involved volumes are not mounted.  As well as
the problem of a volume dying/being reformatted.

>> I'm a bit wary of preventing the file from being changed if not all
>> the involved volumes are mounted.

Narcoleptic> It is the only way to ensure consistency.

Yes.  Which is why I made the claim a while ago that there is no "good"
way to implement cross-filesystem hardlinks.

If you *must* have cross-filesystem hardlinks, I think that your scheme
is how it must be done, in order to get hardlink semantics as much as
possible.  I just don't like some of the implications, which is why I
don't like cross-filesystem hardlinks.

>> Also, if one volume dies and needs to be reformatted, or removed, you
>> need to have some way of recovering.

Narcoleptic> You can copy the hard link, then use it as a regular local
Narcoleptic> file (the sync list doesn't get copied with the file).  You
Narcoleptic> can also delete the hard link if you want (thus replacing
Narcoleptic> the actual file with that "NULL" placeholder if its
Narcoleptic> reference count is 0).

I think that scheme may result in space wastage (whoah.  I fully
expected my spellchecker to complain about that word.) since you have
to maintain the NULL placeholder, and can't reclaim the space.

But my concern with that was that if one partition needs to be
reformatted, then the other instances of the link become unwritable.
So if you want to recover, you would have to copy the file and manually
re-link everything.  There's no way to automatically recover.

[...]

Narcoleptic> ... Each file could have a pseudo-file attribute (i.e.
Narcoleptic> "+/Online") ...
              ^^^

Oh great.  Are we going to get into the debate on how to name
attributes again? ;-)

[...]

>> It's hard to differentiate that from the volume just being unmounted.

Narcoleptic> Not sure what you mean.

Just what I wrote above.

[...]

Narcoleptic> Shouldn't all files on a read-only partition automatically
Narcoleptic> have their permission bits set to read-only (or at least
Narcoleptic> appear that way)?

Hmm.  I don't think so.  I'm not sure.  I don't have any r-o partitions
right now, so I can't check.

Narcoleptic> If so, then all files will have the permission bits set
Narcoleptic> identically, and no problem.

But then you run into the problem that you can't change the permissions
on a file that's on a read-write partition, which would be unexpected
behaviour, IMHO.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

