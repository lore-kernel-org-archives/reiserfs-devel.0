From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: Re: Simple preformance test
Date: Thu, 11 Apr 2002 17:07:31 +0300
Sender: ivandi@magic.vamo.orbitel.bg
Message-ID: <3CB598A3.483349D2@vamo.orbitel.bg>
References: <Pine.LNX.4.44.0204111506300.2077-100000@magic.vamo.orbitel.bg> <20020411165627.A992@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10033-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:

> Hello!
>
> On Thu, Apr 11, 2002 at 03:14:03PM +0300, Ivan Ivanov wrote:
> >                   dd if=/dev/zero of=testdir/$d1/$f1$f2$f3$f4 \
> >                       bs=$block_size count=$blocks_count \
> >                       >/dev/null 2>&1
> >                   rm -f testdir/$d1/$f1$f2$f3$f4
>
> This is the explanation of your speedup.
> You try to write to a file, but there is not enough space and file is not
> created, but you did not notice.
> And then you delete nonexistent files, and no doubts this is very fast
> operation ;)
>
> BTW, if you turn off tails, your numbers might get faster, but space usage
> will get worse.
>
> Bye,
>     Oleg

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda7              1172672   1170676      1996 100% /mnt/test

I know this but  df  shows 1996 blocks free

------
Ivan


