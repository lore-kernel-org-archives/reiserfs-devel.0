From: Oleg Drokin <green@namesys.com>
Subject: Re: vs-3050: wait_buffer_until_released
Date: Wed, 19 Feb 2003 16:49:37 +0300
Message-ID: <20030219164937.A13769@namesys.com>
References: <200302181840.47996.sebastian.kanthak@muehlheim.de> <20030219112233.A10215@namesys.com> <200302191426.22177.sebastian.kanthak@muehlheim.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12837-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302191426.22177.sebastian.kanthak@muehlheim.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sebastian Kanthak <sebastian.kanthak@muehlheim.de>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Feb 19, 2003 at 02:26:22PM +0100, Sebastian Kanthak wrote:

> I haven't fixed the bitmap inconsistency yet, because I thought, you migh=
t=20
> want some other info. In the meantime, the filesystem was not used very m=
uch=20
> (only some simple cron-jobs or so), but I got new errors in my kernel log=
.=20
> Output from dmesg is:
> vs-4080: reiserfs_free_block: free_block (3a01:482474)[dev:blocknr]: bit =

> already cleared
> vs-4080: reiserfs_free_block: free_block (3a01:482473)[dev:blocknr]: bit =

> already cleared
> vs-4080: reiserfs_free_block: free_block (3a01:482472)[dev:blocknr]: bit =

> already cleared
> vs-4080: reiserfs_free_block: free_block (3a01:482471)[dev:blocknr]: bit =

> already cleared
> vs-4080: reiserfs_free_block: free_block (3a01:322183)[dev:blocknr]: bit =

> already cleared
> vs-4080: reiserfs_free_block: free_block (3a01:322180)[dev:blocknr]: bit =


Yes, these might happen too, if you have inconsistent bitmaps.

> and a lot of similar lines. If I do a reiserfsck now, I get more errors t=
han=20
> the first time:

And these are kind of expected, too.

> Now, I'm wondering where these new errors came from. Are they a result of=
 the=20

Used blocks that are marked free gets allocated again.
So noow you have same space used twice.

> problems with reiserfsck, but I'm afraid it will happen again, as I'm usi=
ng=20

The interesting question is hod you got bitmap out of sync with reality.

> the problems. Do you have an idea, where my problems come from? I know no=
w,=20

Have you already ruled out bad hardware?

> cause for this inconsistency? What's going on here? Can I provide you wit=
h=20
> additional (useful) data somehow?

Hm. If you can reproduce initial bitmap corruption somehow, this is would b=
e very interesting.

> As reiserfs certainly does not contain so many bugs I'm starting to suspe=
ct my=20
> hardware (I've read your FAQ about reiserfs running hotter). Memory seems=
 to=20
> be ok, though. Do you know a good tool to stress test the hard-disk and=20
> report errors? I'll certainly need a way to reproduce the error in order =
to=20
> locate it...

Hm. There was some.
E.g. Robin Miller=B4s Data Test Program
http://www.bit-net.com/~rmiller/dt.html

Bye,
    Oleg
