From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Wed, 01 Sep 2004 22:35:02 -0500
Message-ID: <413694E6.7010606@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902002431.GN31934@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lokier wrote:
[...]
|>A "read()" on a file is not atomic even on the _plain_ file: if somebody
|>does a concurrent "write()", the reader may see a partial update. This
|>becomes a million times more confusing if the reader is seeing a
|>structured view of the file the writer is modifying.
|
|
| I agree.  Coherency should be about equivalent to what writing flat
| files offers.
|
| (For now.  Eventually I think we'll see transactional I/O in Linux, to

Eventually?  This was supposed to be in reiser4, maybe it's been put off
until 4.1...

And that is the right solution.  Not the only one, but the right one.
Caching isn't the only thing sorely in need of transaction support right
now.  Actually, I find it hard to think of anything on Linux which
shouldn't have transactions -- why should /etc/fstab or
/home/david/homework be more fragile than /var/lib/mysql?

|>Also, it's likely impossible to write() to the view-file, again unless
you
|>expect all the underlying filesystems to be something really special.
|
|
| Right.  I wonder if you read the part of my message which deals with
| lazy updates of container files.
|
| The idea is that write() to a view-file doesn't repack the container
| file until the container file is read.
|
| Practically, that means the view-file's write handler, which is
| probably in userspace, grabs a kind of mandatory lock (similar to

In userspace?  I don't buy that -- this is exactly what a reiser4 plugin
is for, just in OOP technology.  Instead of "write handler", it's
probably called "write method".

| F_SETLEASE) on the container file and then truncates it.  After a
| time, or when a program tries to read the container (whichever comes
| first), the view-file's handler is notified, it regenerates the
| container file, and releases the lock.

Why "after a time"?  Should be "when a program tries to read the
container" -- and with transactions or even some clever locking, it can
be just as consistant as the flatfile write.

[...]
| (You can take it more fine grained, locking at the page level, but
| that's just to improve performance some more.  It's not fundamental.)

Actually, "locking at the page level" rarely makes more sense than "use
two files".  And with transactions, I think it works like this:

Process A opens file.tar.gz/contents/foo.c and starts writing.  When
it's maybe halfway through, process B opens file.tar.gz for reading.  So
it gets the version of foo.c that existed before A started writing.  B
finishes before A does, and then process C opens file.tar.gz for writing
- -- it has to wait for A to complete.

| Notice that it doesn't need a special filesystem.  View-file writes
| will work with any ordinary filesystem.  A special filesystem would
| make it perform better (much better), by allowing the truncated state
| to persist across reboots, with an xattr to say what's needed to
| recreate the data -- but it's not fundamentally necessary.

I am hoping that someone will implement a VFS-based storage layer plugin
for reiser4.  This means that one can use reiser4 interface features
(such as reading file.tar.gz as a directory) without needing to
reformat.  It also means that one could conceivably port reiser4 to a
userland library, even.  I think.

I wonder if it's as much of a performance hit as uservfs.

[...]
|>Suggested interface:
|>
|>	int open_cached_view(int base_fd, char *type, char *subname);

Oh, God no.  Alright, it's more useful than no caching at all, but still...

Alright, let's say I have /usr/src/linux as a hardlink farm to
/usr/src/linux.tar.bz2/contents/.  With kernel support, I can actually
do a make from inside /usr/src/linux and have it behave sanely.

Do you want to patch make?  If yes, you may as well patch everything.
In fact, you may as well patch glibc to replace open with your
open_cached_file.  Not to mention handling things like readdir, stat,
and so on...

Not to mention the overhead of checking if a file is part of a cache for
every single open, ever...

Putting it in the filesystem simplifies things.  There's already some
sort of read/write method for the file -- overload that for files which
need to be fetched and cached.  Files which are already in the cache, or
have nothing to do with the cache, remain exactly as fast as they are now.

I'm not sure about the best way to make this portable between
filesystems.  I'm not sure if it's really that useful to do so.  I'm
beginning to see why Hans would like reiser4 to be the new VFS.

| Something userspace is useful anyway, so that a fully userspace
| alternative is available, so that people writing apps will take up the
| approach and take advantage of fs-level support where available while
| still being portable elsewhere.

Maybe.  But here, I'd suggest that the kernel implementation is fine,
too.  AFAIK, Reiser4 was designed to be portable -- specifically because
certain apps -- not OSes, but apps -- might embed it for a fee.

|>see what I'm aiming at? You start out with a generic "attribute cache"
|>library that does some hacky things (like depending on "mtime" for
|>coherency) and then if that works out you can see if it's useful.
|
|
| Ok but I don't think that form of it is useful!  It's the sort of
| interface that specific attribute-using programs will have to use if
| they're to be portable, but it doesn't provide any special advantages
| to any other programs.
|
| Gnome VFS, KDE etc. provide much of that kind of interface already.
| Evidently some people find that useful.  But I don't, precisely
| because it's so tied into one set of programs or another.
|
| This is where the file-as-directory metadata stuff is so potentially
| interesting.  It's actually a nice interface that every program can see.

Exactly!  Every program should be able to see the interface.  The
interface should also be transparent sometimes.  Example --
reimplementing InterMezzo/Lustre.  Files that are cached are exactly as
fast to write as local files.  To invalidate the cache, you delete the file.

| Without the feature of a nice interface on Linux, there's no reason
| why application writers would bother to learn and use a view-file library.

That's not as compelling a reason.  Application writers don't care at
all whether it's in the kernel or userland.  All putting it in the
kernel does for adoption is make everyone sit up and notice.

[...]
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTaU5XgHNmZLgCUhAQJsBQ//WBWU28IrQc8mFokLyeFtIAIErqUE65oj
TDcx0/Dg+2JD4zAMht6idhMDfYU5kvBj5C9srMvdklprgPJ/dIQSS/MS8o6qnZl4
kRvjUwI/vBV9a2gwxzt32NrLK+ZFuWwOiRJ1ia6zOyxqOE/jx8z1VDR7R17lbakh
EbFG/2taoHyRke4O+rxig93OxTUBJ72KBKZ+LGrDMwzm7uNP069UupWO0ARpBlMM
6T0o8bm4QK7dgqXgowDGx22hFo5ZPLc3undsHepnu+i8cZMPpOMigbgwpiG/VNnu
t00WOrJGigNkeOrCB4y4LO6LQFL7DjLRRI3T9Y3t3YUFegYDdG6A1L2ZQcrxqtlj
alSx6YYYigH2+MBaN+ONIPlZVe9ybdTpAWl+hkS1nvKaNVc5xYUTFBhBAzIr/4Ol
Zuu5sE8/Q7+5oOCqp9zW51g4oBIlDE0CY3EoZ1P5UrQXT5KphVWr8AUXcP+9CL5c
vsIbYWTmbU/XgxIb+lyB2anTGnMzy1TxUHVxAR4ijXPSDuAbojJhtg1VuDMGhahq
NfW34jRbDJSPDoar/eN2jxF8a4bG7xt8w10LO0lnnjznNJdsurk4HmsHFhPZ0DJj
OJTaChsEr+KUldLyNila8A+6Qg4LvSvNSPArXxCTkGizN+jeyFlNSgqFOQajS/Pk
fptJFhA1x3Q=
=dUCH
-----END PGP SIGNATURE-----
