From: David Masover <ninja@slaphack.com>
Subject: Re: Atomic filesystem or not
Date: Thu, 15 Jul 2004 14:43:06 -0500
Message-ID: <40F6DE4A.2070103@slaphack.com>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19645-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407151354.47063.ctpm@ist.utl.pt>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Claudio Martins <ctpm@ist.utl.pt>
Cc: reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




As I understand it:

Claudio Martins wrote:

| is said that reiser4 is atomic what it means is that each low level
operation
| on the filesystem either happens or not at all. That means that each
block

Each low-level request is automatically an atom, but...

|   As far as I understand this is the guarantee that reiser4 gives. For
the cp
| to happen entirely or not at all it would have to be one big atomic
request
| only, but I think that kind of operation might only be possible using the
| special reiser4 system call in development.

Indeed, the "special reiser4 system call" should support building bigger
atoms.

In fact, I suspect that if reiser4 is accepted as a defacto standard,
then it's even likely that someone would implement some library for
doing atomic operations -- because a system call named "reiser4" is not
portable to other filesystems.  For instance, I believe someone's done a
filesystem based on MySQL, which has atomic operations -- but would
probably want a whole different interface for doing them.

If such a library were developed, and had at least one stable backend
(reiser4), then I think it'd be very likely for standard utils such as
'cp' to support it.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQPbeSngHNmZLgCUhAQK5nw/+Jb0pRAq2uKHsxAnsVDMjgBW2rJsKry5T
n7J21lEdOF4l7p+ohs1de/x5RJN/PfnJYUTDPn6JooJ1mQngulXtzXbihHdxeccw
9X9rwbWA4YZHSwRaoIlb5SZXWTWTXYezuIXWZYzVAAxmTT9ca2baqWw+96nohHyF
nJ3rsmUjW2tMQpJRqDGc0IkSMllBI3iAcRPaQUWGr072eomMS/5txMZJJDvikRsf
iTFjJoOFadfr41rVpq34WLE03Z0uJH7JeSsFwhS/20Wqx1VKJoUlSoHExQEvt+1P
h5o22WCqkU3W5Djhu9ulNqWCVMDDbGgJf5r6FqEXQmkmSSDRS3tRIengeb1EoMan
bFenwcB401hapuEzkY6cP14eDufmCKcWaEacvWDymRTOHGTHasn4zdztlwaAYtOr
wHCRhFyWTnSt2PTCI5bUgJEqNDA/Zv3OlsGDoDxHW5ZXrFffUXLyLZhIy6kc1mZA
f7NpL3TBmsyvJSN6la8ked6OXs67JekYv951LsCFRCUVm+G2kWrHHqesK8aFZRjH
bUmhT+U/vox7rpAPQxtsI7Ldk7kgxnF5CYYU945r2FvMKNUQNfbRWJlDXVRDFc1D
A8wZT4ABtEdEUVtA9TMRvlEKHt+RLZkkyLqalvgrfMldC+LRKTi96ff6pL0MEWPr
Df3SbhYUp8Y=
=Tvog
-----END PGP SIGNATURE-----
