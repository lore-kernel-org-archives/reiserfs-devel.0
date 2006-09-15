From: Quinn Harris <lists@qutek.net>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Fri, 15 Sep 2006 15:20:36 -0600
Message-ID: <200609151520.39826.lists@qutek.net>
References: <200609131451.42474.lists@qutek.net> <4509D65D.7040908@slaphack.com> <54E99998-88D2-4E0D-8970-1C3DA365DBE0@smartgames.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <54E99998-88D2-4E0D-8970-1C3DA365DBE0@smartgames.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 14 September 2006 23:15, Toby Thain wrote:
> On 14-Sep-06, at 6:23 PM, David Masover wrote:
> > Quinn Harris wrote:
> >> On Thursday 14 September 2006 13:55, David Masover wrote:
> >>> ...
> >>
> >> That is a good point.  Recording the disk layout before and after
> >> to compare relative fragmentation would be a good idea.  As well
> >> as randomizing the sequence as a sanity check.
> >> Also note that during boot I was using readahead on all 3885
> >> files.  So the kernel has a good opportunity to rearrange the
> >> reads.  And the read sequence doesn't necessary match the order
> >> its needed (though I tried to get that).
> >
> > Speaking of which, did you parallize the boot process at all?
>
> Just off the top of my head, wouldn't that make the access sequence
> asynchronous & thereby less predictable? (Although I'm sure it's a
> net win.)
It could, but the kernel will try to reorder the outstanding block requests to 
reduce seek.  If that is an overall win I don't know.  In addition early in 
the boot, readahead-list or similar will tell the kernel to start reading 
most of the files need for the complete boot so they are already in memory 
when needed.  Ubuntu does the readahead now and all my tests where with 
readahead.

>
> > I'd estimate my system easily spent more than 50% of its boot time
> > not touching the disk at all before I did that.  Gentoo can do
> > this, I'm not sure what else, as it kind of needs your init system
> > to understand dependencies.
>
> ...

My first test turned out to be on a heavily fragmented file system.  I 
reinstalled Ubuntu Dapper with a fresh reiserfs file system and it booted in 
1:07 (grub to desktop background appearing).  After extending the time 
readahead-watch monitors files and running the reallocate script it now boots 
in 0:50.

I wrote a little python script that uses the FIBMAP ioctl to check the blocks 
the files are using.  From this I know the relocate script on this fresh file 
system is doing exactly what it was intended to do.  I am also able to 
estimate how much it will improve performance by comparing the fragmentation 
before and after its run.  I have learned that the delays on disk io for 
Ubuntu boot are dominated by rotational latency and not head seeks.  The 
current readahead implementation orders the files by on disk location, 
substantially mitigating head seek time.  But the latency is can easily 
double the time needed to load the same data.

Subjectively (and objectively by about 6s) relocation and extending 
readahead-watch substantially improved Gnome boot and initial responsiveness.  
But, I need to measure how much of this was caused by just extending how much 
is read ahead vs. the reallocation.

The current Ubuntu boot waits for hardware probing, DHCP and other things 
giving the disk readahead a chance to work.  I think this reallocation might 
help a parallel boot more as the data will be needed sooner.  So I changed my 
mind, I think parallel boot will highlight the reallocate advantage.  Now I 
just need to test the hypothesis.

Not sure if I would be better of trying initng or waiting for upstart (Ubuntus 
new init) to get scripts that actually parallel boot.  The code for upstart 
is very clean and it has the backing of a major distro, so I have high hopes.

Much like before, I was able to improve a 16.5s oowriter cold start to 14s 
with this reallocate script, with a cold start of 4.8s (OO 2.0.2, was using 
2.0.3 before).  It is evident to me that the readahead-watch is missing 
something on Open Office startup.  It seems very possible to get OO to cold 
start in under 8s with the uses of reallocation and readahead right when it 
starts.


My current scripts are at
http://www.quinnh.org/reallocate.py  (27 line reallocate script, expects 
dir /tmp/refrag to exist and takes the readahead-watch log as a paramater)

http://www.quinnh.org/measure.py (uses FIBMAP to estimate the time needed to 
load the files in the passed readahead-watch log, uses average seek and and 
latency for estimate)

http://www.quinnh.org/readahead-watch-time-order.patch (Patch against Ubuntu 
readahead-watch to add an order by access time option.)


I will try to write a nice unified script that will profile, reallocate and do 
readahead for an application to speed it up.  e.g. "# reallocate.py 
oowriter".  Run it once to profile and reallocate.  drop_caches, Run it again 
and oowriter loads faster.

I think Python will be the best language for this because its become 
relatively universal and its easy to understand for the uninitiated.  This 
really isn't black magic so transparency is good.  I personally prefer Ruby 
though.
