From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: Re: Simple preformance test
Date: Thu, 11 Apr 2002 20:11:03 +0300
Sender: ivandi@idi.vamo.orbitel.bg
Message-ID: <3CB5C3A7.6832E4C8@vamo.orbitel.bg>
References: <Pine.LNX.4.44.0204111506300.2077-100000@magic.vamo.orbitel.bg> <20020411165627.A992@namesys.com> <3CB598A3.483349D2@vamo.orbitel.bg> <3CB59D53.2060503@priocom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10038-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yura Umanets <umanets@priocom.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Yura Umanets wrote:

> Ivan Ivanov wrote:
>
> >Oleg Drokin wrote:
> >
> >>Hello!
> >>
> >>On Thu, Apr 11, 2002 at 03:14:03PM +0300, Ivan Ivanov wrote:
> >>
> >>>                  dd if=/dev/zero of=testdir/$d1/$f1$f2$f3$f4 \
> >>>                      bs=$block_size count=$blocks_count \
> >>>                      >/dev/null 2>&1
> >>>                  rm -f testdir/$d1/$f1$f2$f3$f4
> >>>
> >>This is the explanation of your speedup.
> >>You try to write to a file, but there is not enough space and file is not
> >>created, but you did not notice.
> >>And then you delete nonexistent files, and no doubts this is very fast
> >>operation ;)
> >>
> >>BTW, if you turn off tails, your numbers might get faster, but space usage
> >>will get worse.
> >>
> >>Bye,
> >>    Oleg
> >>
> >
> >Filesystem           1k-blocks      Used Available Use% Mounted on
> >/dev/hda7              1172672   1170676      1996 100% /mnt/test
> >
> >I know this but  df  shows 1996 blocks free
> >
> >------
> >Ivan
> >
> Besides, I think you didn't use "smart" block alocation technics in your
> tests and the all ppl know, that performance degradates because of
> bitmap when used space grows up.
>
> Oleg, is this correct?
>
> --
> Yury Umanets
> IT Engineer of Priocom Corp.
> ICQ: 55494590

As it seen this was, a very simple test, so it does't test performance when the
file system is fragmented.
There was a big discussion about fragmentation/defragmentation a few days ago.
There was a message about performance degradation, so I made this just for
check.

-----
Ivan


