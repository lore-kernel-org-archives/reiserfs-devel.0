From: Hans Reiser <reiser@namesys.com>
Subject: Re: umount and sync delays
Date: Mon, 14 Mar 2005 09:41:02 -0800
Message-ID: <4235CCAE.9030408@namesys.com>
References: <Pine.LNX.4.61.0503141338470.25427@dacun>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0503141338470.25427@dacun>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: reiserfs-list@namesys.com

Gorazd Golob wrote:

> hi!
>
> I have strangely long delay (still waiting at the time) when
> unmounting or syncing partition with reiser4. At the same time writes
> are occuring to disk subsystem - when checking vmstat and of course
> checking disk activity light ;).
>
> Why does it take so long and it will ever finish ?:)
> I don't have debug enabled and I'm using 2.6.11-mm1 kernel. Partitions
> were formated with reiser4progs 1.0.4.
>
> gorazd
>
>
Probably you just have a lot of dirty buffers in RAM and they need to
flush to disk?
