From: Nick Vahalik <nick@nsanity.com>
Subject: Re: Reiserfs Data Recovery
Date: Mon, 08 Mar 2004 10:06:31 -0600
Message-ID: <404C9A07.3060904@nsanity.com>
References: <404C81B9.4050504@nsanity.com>	<20040308153357.1f9773ba@philou.gramoulle.local>	<404C86AC.3070305@nsanity.com> <20040308155913.123967b7@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040308155913.123967b7@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

Hello again,

Okay, I updated reiserfsprogs and this is what I got:

0%....20%....40%....60%....80%....100%                       left 0,=20
15217 /sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 38667613
                Leaves among those 56652
                        - corrected leaves 2500
                        - leaves all contents of which could not be=20
saved and de leted 26
                pointers in indirect items to wrong area 5332 (zeroed)
                Objectids found 116644
=20
Pass 1 (will try to insert 56626 leaves):
Looking for allocable blocks .. finished
0%pass1.c 408 pass1_correct_leaf                             left 56623,=20
3 /sec
pass1_correct_leaf: block 65604, item 0, pointer 1: The wrong pointer=20
(379082642 5) in the file [50696 50697]. Must be fixed on pass0.
Aborted

I can post the logfile... if anyone wants to see it.

Nick Vahalik

Philippe Gramoull=E9 wrote:

>Hello,
>
>I'd suggest that you try first the latest reiserfsprogs 3.6.13.
>
>ftp.namesys.com:/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz
>
>It problem still occurs, then someone at Namesys might help you more than =
me.
>
>Thanks,
>
>Philippe
>
>
>
>On Mon, 08 Mar 2004 08:43:56 -0600
>Nick Vahalik <nick@nsanity.com> wrote:
>
>  | Philippe,
>  |=20
>  | root@bardiel:~# reiserfsck -V
>  | reiserfsck 3.6.11 (2003 www.namesys.com)
>  |=20
>  | Nick Vahalik
>  |=20
>
>
> =20
>

