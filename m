From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Carrying Attributes too Far
Date: Sat, 04 Oct 2003 16:10:24 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87k77kahn3.fsf@labatt.uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


[...]

Leo> There's no semantic reason why it shouldn't be possible; in other
Leo> words, if it's meaningful for a file to be named both
Leo> /pub/pictures/sunrise and /home/alice/pictures/daylight , why would
Leo> it in fact not be meaningful just because a volume is mounted at
Leo> /home ?

I agree with Alexander that such a situation is better handled with
symlinks.  Or some type of firm link.  In general, it's more useful for
a file to have only a single filename -- especially from a user's
perspective.  I've only ever seen approximately one good use of hard
links.  But hopefully Reiser6 (or whichever version of ReiserFS has the
query system) will solve the situation that you described above.

[...]

Leo> Note that hard-linking between files on different volumes is a
Leo> necessity if you want to do the kind of things discussed in Future
Leo> Vision cleanly. If I did a simple search for all mp3s at least 3
Leo> minutes long, I would expect to get back a directory which had as
Leo> its children all the 3-min.+ mp3s visible to me on the computer. I
Leo> wouldn't necessarily care if some of the mp3s were on a different
Leo> mount subtree to the search directory, and I wouldn't expect to
Leo> find things like symlinks being used to duct-tape the mp3s onto the
Leo> directory.

I fail to see how hard links would help this at all.  If you have
multiple volumes, the way to do things would be to have the system pass
the query on to all the (relevant) filesystems.  Or to make Reiser* a
distributed filesystem, so that all the volumes can look like a single
filesystem.

Leo> (As to your id3 example: Yes, the id3 file data is stored in the
Leo> mp3 file, but then the /etc/motd file data is stored in the file
Leo> /dev/hda1 or whatever.  There's no reason why it makes any less
Leo> sense be able to hard-link to the id3 file than to /etc/motd. Why
Leo> shouldn't I be able to use a search to get a directory linked to
Leo> all the id3 files on the system?)

The point was that the id3 data and the regular files are conceptually
on different filesystems.  So hard linking to id3 data is similar to
hard linking across filesystems.

Additionally, I doubt that hard linking within a single file's id3 data
would be possible, since it is not supported by the underlying file
structure.  Just like I don't think hard linking on FAT or NTFS
filesystems is supported.  I don't think we're going to lose much by
not allowing hard links everywhere.

Leo> But for the sake of argument, let's assume that indeed it should
Leo> remain impossible to hard-link across mount subtrees, or at least
Leo> that it will. Will this actually prevent the problems of ordinary
Leo> directories hard-linking to attribute files not their own? Consider
Leo> a case in which /pub/somedir and /home/alice/hello.mp3 are both on
Leo> the same volume, say /dev/hda1 . If even one of hello.mp3's
Leo> attribute files (or to be more precise, one of the files which
Leo> inherit metadata from hello.mp3) is on the same mount subtree as
Leo> somedir , then the restriction on hard-linking between files on
Leo> different volumes is not sufficient to prevent the problems.

Which problems are you talking about?

Leo> So can we find an attribute file of hello.mp3 which might actually
Leo> be on /dev/hda1 ?

Yes, if the "attribute file" is a normal file.

One thing to remember is that Reiser4 does not store attributes per
se.  It stores regular files, which can be treated as attributes.  Thus
when they say that a file is both a regular file and a directory (with
the appropriate plugin), they literally mean that it is a normal
directory.

[...]

Leo> (But incidentally, this raises another question: if one of
Leo> hello.mp3 's descendants is a mount point, what happens when alice
Leo> types

Leo>     mv hello.mp3 hi.mp3

Leo> ?)

I assume the same thing that would happen if you tried to "mv foo bar",
where foo is a normal directory, and one of foo's descendants is a
mount point.  I have no idea what would happen, since I've never tried
it, but Reiser4 doesn't introduce any new problems in this regard.

Leo> By contrast, imagine that alice writes a short text file of
Leo> information about hello.mp3. Clearly this is hello.mp3 metadata, so
Leo> she saves the file in hello.mp3/+/info . info isn't automatically
Leo> derived from mp3, so why wouldn't it just be another file on
Leo> /dev/hda1 like hello.mp3 and somedir ?

That is correct.  It will be a regular file.  (Unless the id3 plugin
decides to grab it and turn it into an id3 tag.)

Leo> As to permissions, wasn't it the intention to use permissions files
Leo> as a *replacement* for stat and friends, not just as a means of
Leo> exposing stat through a file interface?

No.  If you do that, you run into lots of problems.  All files need
stat data, and so if foo.txt/+/owner was a normal file, then you would
also need foo.txt/+/owner/+/owner, foo.txt/+/owner/+/owner/+/owner, ad
infinitum.  As well, some stat data just doesn't make sense to make to
have as a normal file, such as inode number, device type, size, etc.

Leo> If hello.mp3/+/permissions replaces stat and friends, then it's in
Leo> the same position as hello.mp3/+/info . If it simply exposes then,
Leo> then subfile metadata is a lot less interesting - for one thing, it
Leo> doesn't make implementing different permissions systems any easier
Leo> (the opposite, in fact).

How would having stat data as a normal file make permission systems any
easier?  And how does just exposing the stat data make permission
systems harder?

Leo> But even if ordinary directories can't hard-link to other files'
Leo> attribute files, the problem of multiple inheritance of metadata
Leo> still isn't fully solved.  What if two children of hello.mp3/+/
Leo> have different permissions, and a third file is the child of both
Leo> of them? And what about the proposal that ordinary, non-attribute
Leo> files should inherit metadata from their parent directories?

I have never heard of any such proposal.  Where is that from?

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

