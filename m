From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck bug?!? The block (.....) is in the tree already. Should not happen.
Date: Mon, 20 Jan 2003 20:26:09 +0300
Message-ID: <200301202026.09965.vitaly@namesys.com>
References: <1043081969.1491.36.camel@symirna.uplink.ethz.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12447-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1043081969.1491.36.camel@symirna.uplink.ethz.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m96 <m96@gmx.li>, reiserfs-list@namesys.com

On Monday 20 January 2003 19:59, m96 wrote:
> hi,
>
> i'm new on the list and also not a reiserfs hacker. but i got the
> following problem on my box:
>
> after many frozen systems i thought it's on time to check the partition
> integrity with `reiserfsck --check <partition>' and it gave me one error
> that i can fix it only with rebuilding the tree. (i know i should make a
> backup but i didn't - and it was my usr partition... DAMN@!)
>
> so while running `reiserfsck --rebuild-tree <partition>' i got the
> following error in an infinite loop:
>
>
> do_pass_2: The block (1281151) is in the tree already, Should not
> happen.

Check that you are using up-to-date version of reiserfsprogs - 3.6.4 - please.
If it is so, could you run debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
and make the archive (which contains metadata of your partition) available 
for downloading, I will check reiserfsck work locally. 

What does "debugreiserfs /dev/xxx" say?

> so i had to abort it with CTRL-C. and tried again - with the same luck -
> i stuck in the same loop. and since then i can't mount my partition.
>
> does any one a way to avoid a repartitioning?
>
> if this is an unknown error, how can i provide you with more
> informations? think that this was my /usr so i'm limited to / and /var
> partitions.
>
> regards.

-- 

Thanks,
Vitaly Fertman
