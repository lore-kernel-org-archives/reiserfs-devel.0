From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Invalid use of asm/unaligned.h
Date: Wed, 11 Aug 2004 16:55:01 -0400
Message-ID: <411A87A5.7020608@suse.com>
References: <200408112148.42125.mmazur@kernel.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20218-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408112148.42125.mmazur@kernel.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mariusz Mazur <mmazur@kernel.pl>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mariusz Mazur wrote:
| I'm the linux-libc-headers* maintainer and after the release of version
| reiserfsprogs 3.6.18 I was informed that they don't build correctly
against
| llh. A couple of months ago a patch was added to reiserfsprogs that fixed
| access to unaligned memory on ia64. Fact of the matter is that
| asm/unaligned.h is *not* a userland header (and as such was removed
from llh)
| and you can call good luck the fact that it's userland friendly on
ia64. On
| most archs that it's needed on (those that do not support unaligned
memory
| access) the header will either not work cause it requires some kernel
| internal stuff, or will not work cause it's plain marked as kernel only
| (ifdefed __KERNEL__ as on arch-ppc).
|
| Now the nice thing to do would be to switch to some more userland
friendly way
| of accessing unaligned memory, since using kernel headers for such
things is
| not a good idea. I don't have too much options for making those headers
| userland friendly and adding them to llh, since I can't call any external
| functions (like memcpy) from llh and I don't believe adding lots of
asm code
| by coding my own functions for that is a good idea (neither have I the
| expertise nor the resources to do it correctly).
| So - what will it be? :)
|
| Oh, and please do cc me with any replies since I'm not subscribed to this
| list.
|
| * http://ep09.pld-linux.org/~mmazur/linux-libc-headers

As the author of the patch which included asm/unaligned.h, I have a few
comments on this:

Can you provide examples of what you consider depending on "kernel
internal stuff" ? When I look through include/asm*/unaligned.h, I see no
references to functions not provided in a standard C library. I also
don't see any assembly code, so I'm not sure why you'd need to code
assembly for each architecture.

There are other instances of libc headers defining macros that expand to
standard libc functions. Why should the presence of memcpy/memmove calls
be an exception to this? If you truly feel the need to create
"userspace" headers for unaligned access, you can lift the kernel
headers wholesale. If that's not desirable, take a look in
asm-generic/unaligned.h and include that instead.

That said, I don't believe the problem is the inclusion of
asm/unaligned.h at all, but rather the fact that the PPC developers
decided to surround the code with ifdef KERNEL. They're the only arch to
do so, which is odd considering it's a no-op anyway.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBGoekLPWxlyuTD7IRAvIeAKCN+iZNvlKFSFxzRq0mZMSGKxKTsQCfZnpz
8dYsFB525Oajbugsu2n0CfI=
=DRbn
-----END PGP SIGNATURE-----
