From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: filesystem corruption ?
Date: Fri, 21 Mar 2003 11:14:58 +0100
Sender: bernd-schubert@web.de
Message-ID: <200303211114.58672.bernd-schubert@web.de>
References: <200303201725.14039.bernd-schubert@web.de> <200303201923.48454.bernd-schubert@web.de> <20030321103230.C12315@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13315-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030321103230.C12315@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Friday 21 March 2003 08:32, you wrote:
> Hello!
>
> On Thu, Mar 20, 2003 at 07:23:48PM +0100, Bernd Schubert wrote:
> > > Hm, interesting.
> > > And what are the differences? How big are they?
> >
> > Since it are binaries files, a colleague had the idea to use hexdump and
> > diff, so the command for the attached file was:
> > diff <(hexdump /worka/gdb) <(hexdump /usr/bin/gdb)|sort -k 2 >gdb.diff
> > So the lines beginning with '<' are from working gdb and lines beginning
> > with '>' are from corrupted gdb. When you look into the diff-file you
> > will see, that only some bits per line have changed.
>
> I see.
> Basically you have two pages of data corrupted.
> And the corruption indeed looks like bit corruption.
> How about rebooting that box and checking if corruption pattern changes?
> Also I'd recommend you to run memtext86 for some time as this looks like
> bad memory pattern.

All of our machines have to pass a full memtest86 checking before we intend to 
use them - this machine is about 3 weeks old, of course it also had to run 
this test and furthermore it has ECC-memory.

>
> > > Any events happening between morning backup and time of problem
> > > discovery?
> >
> > Except, that I recompiled a kernel and we installed some programs using
> > aptitude (its a debian system), nothing happend to the filesystem. There
> > was also no reboot, no crash, etc.
> > Update: The corruption probably happend at 15:48, since at this time also
> > a xchat on one of the clients crashed and this was noticed by us at
> > first. The xchat binary was also affected by the corruption.
>
> So, the beam of X-rays run through the memory module corrupting some bits?

There is the 'Environmental Physics Institut' in the floor below us and since 
we currently have an extremely high hardware failure rate, I have been joking 
for some time that they might be causing it (I believe they are indeed using 
x-ray beams). I should really ask them if their constructions are shielded 
properly ;-)

> ;) This stuff should not have been written to disk, so probably
> plain reboot should fix everything? Can you test that?

Yes of course, if something goes wrong we still have our fall back machine :-)

I will report in the afternoon if it worked.

Best regards,
	Bernd
