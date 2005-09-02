From: michael chang <thenewme91@gmail.com>
Subject: Re: BUG in reiserfs4 using SuSE-kernel
Date: Fri, 2 Sep 2005 11:48:46 -0400
Message-ID: <b14e81f005090208485293a5af@mail.gmail.com>
References: <200509021115.20718.sebastian.held@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509021115.20718.sebastian.held@gmx.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Held <sebastian.held@gmx.de>
Cc: reiserfs-list@namesys.com

On 9/2/05, Sebastian Held <sebastian.held@gmx.de> wrote:
> The following message appeared in the kernel ring buffer after turning of=
f my
> external hard disk connected by usb2 (note: I forget to umount it, but sh=
ould
> reiserfs abort this way?)

Maybe it's something with lazy-alloc or something?  Just a guess...
> usb 4-3: USB disconnect, address 4

> reiser4[khubd(2626)]: reiser4_handle_error (fs/reiser4/vfs_ops.c:1432)
> [foobar-42]:
> reiser4 panicked cowardly: Filesystem error occured
> ------------[ cut here ]------------
> kernel BUG at fs/reiser4/debug.c:131!

> EIP is at reiser4_do_panic+0xd/0xb0 [reiser4]

> Code:  Bad EIP value.

Looks like reiser4 said that it wanted a kernel panic on purpose...

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
