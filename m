From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: trouble with reiserfs on ppc vs-3050: wait_buffer_until_released ...
Date: Fri, 25 Apr 2003 12:41:49 +0400
Message-ID: <200304251241.49707.vitaly@namesys.com>
References: <1051258287.5564.1.camel@fortknox>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1051258287.5564.1.camel@fortknox>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Soeren Sonnenburg <kernel@nn7.de>
Cc: reiserfs-list@namesys.com


Hi,=20

On Friday 25 April 2003 12:11, Soeren Sonnenburg wrote:
> Hi...
>
> I suddenly have a file which when I access it using gvim gives
>
> vs-3050: wait_buffer_until_released: nobody releases buffer (dev 03:07,
> size 4096, blocknr 2031616, count 3, list 0, state 0x10019, page
> c0add66540, (UPTODATE, CLEAN, UNLOCKED)). Still waiting (570000000)
> JDIRTY !WAIT
>
> and makes the whole machine hang...
>
>
> Ideas what I could do about it ?

Probably it is due to fs corruption, interesting if the block #2031616 is=
 free=20
in the bitmap. Could you run=20
    debugreiserfs -1 2031616 /dev/xxx

--=20
Thanks,
Vitaly Fertman
