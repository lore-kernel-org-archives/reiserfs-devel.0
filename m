From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: a hosed reiserfs
Date: Fri, 25 Jun 2004 18:48:32 +0200
Message-ID: <200406251848.32172.Dieter.Nuetzel@hamburg.de>
References: <20040625115258.A27445@tux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19382-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040625115258.A27445@tux.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Bruce Israel <israel@tux.org>

Am Freitag, 25. Juni 2004 17:52 schrieb Bruce Israel:
> OK, I've been hosed.  I had a disk crash, and my ReiserFS /home partition
> doesn't mount (/dev/hdf8 on my machine).
>
> When I ran reiserfsck on it, I got an message saying it's a hardware
> problem, with an I/O error that it can't read a block (output included
> below).
>
> I don't really care about the disk (an 80 GB Western Digital), even though
> I bought it within the past year, but I really want to get the data off of
> it.
>
> Even though reiserfsck says there's a hardware problem on hdf8, I boot just
> fine from that disk (using hdf1 and hdf7, my /boot and / partitions, both
> ext3), and I can also successfully mount and read hdf9, another ReiserFS
> partion.
>
> I installed a new disk that I'm booting off of until I can figure out how
> to deal with this and not screw things further.
>
> I tried to follow the instructions in
> http://namesys.com/bad-block-handling.html by copying the partition using
> "dd_rescue /dev/hdf8 /home/bad-partition" (where /home is on the new disk).
> It ran for a while and created a 4.5 GB file (it's a 20 GB partition, about
> 15GB used) and then hung my system (completely, couldn't switch VCs, no
> other shells responding, etc.).  After powercycling I did it again, and got
> the EXACT same behaviour, down to the exact same number of characters
> copied into the 4.5GB output file.
>
> It also tried giving dd_rescue that byte count as the starting point, but
> that also hung things.
>
> What can I do to recover my files?  Is there something else I can use to
> dd_rescue the partition prior to running "reiserfsck --rebuild-tree"?
> Maybe incrementing the byte count by 1K and writing in 1K of 0's?  Or
> another invocation that would get it to read the data?

You can try dd_rescue in revers mode, too.
So you could get your "complete" partition eventually back.

Used that several times (some tries in normal and then some in reverse mode).
Then a --rebuild-tree run.

Good luck.

-Dieter
