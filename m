From: Oleg Drokin <green@namesys.com>
Subject: Re: vs-4080 & more corruptions
Date: Wed, 26 Jun 2002 09:05:15 +0400
Message-ID: <20020626090515.B5198@namesys.com>
References: <3D18FDC8.5040705@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D18FDC8.5040705@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian <evilninja@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jun 26, 2002 at 01:33:28AM +0200, Christian wrote:

> Pass 1 (will try to insert 1109 leaves):
> Looking for allocable blocks .. ok
> 0%                                                            left 1079, 
> 0 /sec
> mark_block_used: (130815) used already
> Aborted.
> -------
> --> Aborted !? so for now i can't mount the partition:

So far we came to conclusion that this abort is a clear sign of bad memory or
something damaging data that is coming out of your HDD.
It is easily verifiable. Just run reiserfsck --rebuild-tree again
if it progresses to next passes (means you are lucky and nothing
was damaged this time) or fails with different blocknumber "being in use",
you will know that you need to replace some of your hardware.
(may be something as simple as replacing IDE cable).


> root@sheep:~/trash# mount -v /dev/hdb1 /mnt/disk/
> mount: you didn't specify a filesystem type for /dev/hdb1
>        I will try type reiserfs
> mount: Not a directory
> huh?

unfinished rebuild tree does this, nothing to worry. Once reiserfsck
--rebuild-tree will correctly complete al its operations you will be able to
mount it again.

> please help me out of this problem, the data was not so important, but: 
> i've had more hdd related / fs-related problems during the last year, 
> and always after reiserfsck issues. i really want to hold reiserfs the 
> faith, because i think it is a good thing to have a performant fs with 
> journal too, but i can't stand the problems anymore.

It is impossible to have bad hardware and high stability at the same time
at this level of technology.

Bye,
    Oleg
