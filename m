From: David Masover <ninja@slaphack.com>
Subject: Re: Plugin for corruption resistance?
Date: Thu, 17 Feb 2005 21:43:08 -0600
Message-ID: <4215644C.4000602@slaphack.com>
References: <e692861c05021110583585f84e@mail.gmail.com> <loom.20050215T213823-62@post.gmane.org> <42141928.7080608@slaphack.com> <200502171153.43403.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502171153.43403.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Christian Iversen wrote:
| On Thursday 17 February 2005 05:10, David Masover wrote:
|
|>Adam wrote:
|>| Hans Reiser <reiser <at> namesys.com> writes:
|>|>Its on the legitimate wish list, if someone wants to code it, let me
|>|> know.
|>|
|>| Hans, does this mean that you think that this type of functionality
|>
|>should be
|>
|>| implemented as a Reiser4 plugin and therefore in kernelspace?  Why
|>
|>wouldn't this
|>
|>| be better implemented in userspace via a daemon that is notified of file
|>| modification via dnotify/inotify?
|>
|>Because dnotify/inotify don't scale.  I don't think they lock on event,
|>either, whereas a plugin could guarentee that the hash was up-to-date
|>(no race conditions).
|>
|>We've been over this before.  There's a reason reiser4 and its plugins
|>are in kernel space, and not in something like Fuse.
|
|
| And, surely, updating a hash value when 1 byte changes in a gigabyte
file,
| would be much faster from kernel space where you can actually see the
| changeset?

Wouldn't it be sane to just export the changeset to userland?

This way is easier, though.  But I was thinking about accessing the
file.  I don't know of any hashes that can be easily updated from part
of the file, unless you're hashing only pieces of the file in the first
place, but it'd be nice to not bother hashing at all until the hash is
needed, especially if we are hashing the whole file.

Plus, there's the race condition thing.  Definitely a lot of reasons to
put more stuff in the kernel.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQhVkS3gHNmZLgCUhAQIMNA/+IgaEx9p3bceATrrYDEweAB+N4K98dFyM
BgDAtxFS2vzaw6lsF9vtEiHEuhvp5raCAhxcoEO1KgRh21Yc6cR+Yu5FaRc7BV4n
WleJtNk521XFwUsmQXs5nYYHzfNlfJbQax9RBqX4IllbXbHX6YUHDAof/Zy8M4MJ
Wytp10igur9QVcqXSeEYoRbYHXS3MRyT3cIl6Y1VXAdZRYu/ItlLf0ItRPkRyfB7
1yVK4kOaR4c6U95gaHL0S08tLddtiep+9XIAJ+JXdhnP8yfEH43ItoM/KxrGSc/K
PWcgIDicYek6kWWNb8H5dTYIknaW8fYwStuoBdfaLt/9aGO00O4sNmg97skW8H2q
+87d22MTiCFtbHyYnD5cV6EzKe+IdUqcTaISOMbctltQmBsPcQjeAlU+BmaLbzEF
sN91egbv/iuirroO1/OzCCQrihE6u8/9tK6LO2Y+LGO2N+ZpB10ZHaGa8uHqMFy1
w19r9XcTIJHo+mjuWhM4hnRrna8cwsCepf++tyKE26ZD3iPPaUzB8h+U81R+59y0
TXNLKLCfJfuOBs4IK2MgmcSkvxEpzBos3vJJdlvA3s4aMz6ZAP8vp5Wgj/BvMrxj
QhFdy/IPCdDLHc5EO3rOZo3b8e/GZcfxgOJ54nuMMzk0xFrlIbtBtYCBU41o9jiq
yP/8bcQ4cqY=
=UEM3
-----END PGP SIGNATURE-----
