From: Oleg Drokin <green@namesys.com>
Subject: Re: filesystem corruption ?
Date: Fri, 21 Mar 2003 10:32:30 +0300
Message-ID: <20030321103230.C12315@namesys.com>
References: <200303201725.14039.bernd-schubert@web.de> <20030320200639.A8618@namesys.com> <200303201923.48454.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303201923.48454.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Mar 20, 2003 at 07:23:48PM +0100, Bernd Schubert wrote:
> > Hm, interesting.
> > And what are the differences? How big are they?
> Since it are binaries files, a colleague had the idea to use hexdump and diff, 
> so the command for the attached file was:
> diff <(hexdump /worka/gdb) <(hexdump /usr/bin/gdb)|sort -k 2 >gdb.diff
> So the lines beginning with '<' are from working gdb and lines beginning with 
> '>' are from corrupted gdb. When you look into the diff-file you will see, 
> that only some bits per line have changed.

I see.
Basically you have two pages of data corrupted.
And the corruption indeed looks like bit corruption.
How about rebooting that box and checking if corruption pattern changes?
Also I'd recommend you to run memtext86 for some time as this looks like
bad memory pattern.

> > Any events happening between morning backup and time of problem discovery?
> Except, that I recompiled a kernel and we installed some programs using 
> aptitude (its a debian system), nothing happend to the filesystem. There was 
> also no reboot, no crash, etc.
> Update: The corruption probably happend at 15:48, since at this time also a 
> xchat on one of the clients crashed and this was noticed by us at first. The 
> xchat binary was also affected by the corruption.

So, the beam of X-rays run through the memory module corrupting some bits? ;)
This stuff should not have been written to disk, so probably
plain reboot should fix everything? Can you test that?

Bye,
    Oleg
