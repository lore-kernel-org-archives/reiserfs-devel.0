From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: resize reiserfs
Date: Thu, 5 Feb 2004 00:25:54 +0300
Message-ID: <200402050025.54725.vitaly@namesys.com>
References: <1075919278.1901.14.camel@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1075919278.1901.14.camel@linux.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Farkas =?utf-8?q?Barnab=C3=A1s?= <kinca@freemail.hu>, reiserfs-list@namesys.com

On Wednesday 04 February 2004 21:27, Farkas Barnab=C3=A1s wrote:
> Hello World,

Hello Farkas,

> I would like to resize my reiserfs partition. When its finished, I
> couldn't mount the partition. I've got error messages
> I tried --rebuild-tree

Did resize_reiserfs finish properly or fail? Could you describe you=20
steps more precisely? How did you run resizer_reiserfs? What did=20
you do next? Did you run reiserfsck --rebuild-sb? Etc.

> linux:~ # /usr/local/sbin/reiserfsck --rebuild-tree /dev/hda1
> reiserfsck 3.6.11 (2003 www.namesys.com)
>
> reiserfsck --rebuild-tree started at Wed Feb  4 19:20:21 2004
> ###########
>
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 8434 blocks marked used
> Skipping 8434 blocks (super block, journal, bitmaps) 0 blocks will be
> read
>
> Could not find a hash in use. Using "r5"
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 0
>                 Leaves among those 0
>                 Objectids found 2
>
> Pass 1 (will try to insert 0 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
>
> Flushing..finished
>         0 leaves read
>                 0 inserted
> ####### Pass 2 #######
> Flushing..finished
>
>
> No reiserfs metadata found. =20

> debugreiserfs 3.6.11 (2003 www.namesys.com)
>
> Count of blocks on the device: 7327648
> Free blocks: 7327648

=2D-=20
Thanks,
Vitaly Fertman


