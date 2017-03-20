From: Daniel Horne <daniel.horne@gmail.com>
Subject: Re: I have an idea to allow shrinkage of a Reiser4 volume.
Date: Mon, 20 Mar 2017 01:33:04 +0000
Message-ID: <CAJZSrNJT6BPMY_KpaQa_NUF=08DN5cK=Z1L1NjzWSvMnH_Gs9g@mail.gmail.com>
References: <a0531a2488bd81ed6b33b18d17e3328a@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=Y5wBtypr5gxGQDIKBY6MqA+o7pqc5yNW8QOt3Vt5HS4=;
        b=JcqFlT92wNwhgm41HHaGb08IaXwJAY+njr8ioemsxzYTEmrnHfenU73cSLe2WCBAlo
         NY9rseb4kizJwPtgIG9Hl4m/HHNPG5m23qFV5kTwA2RP7c8P/xLamYUCKA7NP+iwaozW
         2IuxzMN26KXKHg0BET4GcurgO2lgfxTXeLjJRPFHn1aNoWpyLURM+ziW7nSy6IEEB6k5
         Xkq/7qJZazplGR0lSU2r2NbwdNwpmVfhWJQFCWuEPghommedTh4iZ/t6hkvPMwr2jYV7
         Z9RJ1FzBaAPDLhFSaRUmmCtQV6+GHasoZFTK9js2AojFQ47DQQawoO1tDhd8BbkRzvrZ
         f8Ig==
In-Reply-To: <a0531a2488bd81ed6b33b18d17e3328a@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Some metadata changes would still be needed in this case, I think: For
one thing, you'd need to remove some of the bitmap blocks which are
used to track space usage. And the size of the volume is probably
stored in the superblock. That'd have to be changed.

I'm not sure this approach would work too well though - it could only
work in cases where there were no unused blocks past the length you're
trimming at - the allocators try to spread data out over the volume,
which would mean you probably couldn't shrink a real r4 volume much
using this method without data loss.

A proper resize tool would probably pack all the data to the front of
the volume, change the volume metadata, and then unpack it -
Essentially a special case of the planned "repacker" tool, I think.

--
DH

On 19 March 2017 at 10:39,  <doiggl@velocitynet.com.au> wrote:
> Hello,
>
> I have an idea to allow shrinkage of a Reiser4 volume.
> And I ask help in writing a command line utility for it.
>
> my idea's,example:
> - ensure debugfs.reiser4 installed. [debugfs.reiser4] reiser4progs
> - check unmounted volume is a Reiser4 formatted partition.
> - find the last 'used block' on a unmounted Reiser4 partition [1]
> - check block number is greater than >0 and less than < the maximum block
> of reiser4 volume size.
> - print details of new volume, space unused.
> - ask to perform shrink reiser4 volume to nnn.
> - if 'y' do volume shrink.
> - verify volume details and print new details used/free,
>
>
> Reason I ask:
> Allow shinkage of reiser4 volume to last 'used block' + [n blocks free]
> Since no reiser4 blocks moved, no reiser4 metadata changes needed.
> Just volume size changes [no blocks moved].
> Is this idea logical to ask ?
> Thanks
> --Glenn
>
> [1] find the last 'used block'.
>
> # debugfs.reiser4 /dev/sdb2  --print-tree | grep -i "NODE"   | grep -v
> "NPTR"| cut -d" " -f2  | sed 's/(//'  | sed 's/)//'  |sort -n |tail -1
> Format release: 4.0.1
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> 2938354
>
> other info:
>
> Total blocks used:
> #################
> # debugfs.reiser4 /dev/sdb2  --print-tree | grep -i "NODE"   | grep -v
> "NPTR"| cut -d" " -f2  | sed 's/(//'  | sed 's/)//'  |sort -n | wc -l
> debugfs.reiser4 1.1.0
> Format release: 4.0.1
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> 833657
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
