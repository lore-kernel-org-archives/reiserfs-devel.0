From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Need help retrieving data
Date: Sat, 2 Sep 2006 15:26:05 +0400
Message-ID: <200609021526.05313.zam@namesys.com>
References: <44EDE55E.7030106@comcast.net> <200609011545.33194.zam@namesys.com> <6110980.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6110980.post@talk.nabble.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-list@namesys.com
Cc: Alex Efros <powerman-asdf@yandex.ru>

On 2 September 2006 13:32, Alex Efros wrote:
> Hi!
>
> So, I did everything correctly to fix it? --rebuild-tree doesn't
> broke anything?

usually not.

but reiserfsck --rebuild-tree is a complex operation. It has a possibility =
to=20
insert wrong blocks into the tree if your fs was used to store another=20
reiserfs image. and you have a chance to hit new reiserfsck bug.

> > unfortunately no fix for fsck is available yet.
>
> If you provide fixed reiserfsck version, I can run it on my image to
> test it and confirm image become mountabe after --rebuild-sb. But I
> can't leave this 3GB image on my drive for months, so if you wish

to make the partition mountable again it is enough to change=20
one byte in the super block from 0 (hash is not set) to 3 (r5 hash). =20
It can be done by a hex editor.

hexdump -C of block #16 (reiserfs uses 4k-size blocks, numbers start with 0=
):

=2E..
00000030  06 00 01 00 52 65 49 73  45 72 32 46 73 00 00 00  |....ReIsEr2Fs.=
=2E.|
00000040  03 00 00 00 05 00 c6 04  02 00 00 00 89 28 00 00  |......=C6.....=
=89(..|
          ^^=20
          this byte.
=2E..

according with:

struct reiserfs_super_block_v1 {
=2E..
        char s_magic[10];       /* reiserfs magic string indicates that
                                 * file system is reiserfs:
                                 * "ReIsErFs" or "ReIsEr2Fs" or "ReIsEr3Fs"=
 */
        __le16 s_fs_state;      /* it is set to used by fsck to mark which
                                 * phase of rebuilding is done */
        __le32 s_hash_function_code;    /* indicate, what hash function is =
being use
=2E..

> this testing from me - please provide fixed version in about 7-10

> days or at least notify me when it will be ready - if your need more
> time I probably move it to DVD-RW.

I already have a broken fs to experiment with.=20

=2D-=20
Alex.

