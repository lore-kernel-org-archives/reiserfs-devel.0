From: Kerin Millar <kerin@recruit2recruit.net>
Subject: Re: Question on Reiser4 regarding power failures
Date: Thu, 25 Nov 2004 15:59:29 +0000
Message-ID: <1101398369.10593.23.camel@kerfy.r2r.local>
References: <200411251637.28047.bernhard.prell@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22565-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411251637.28047.bernhard.prell@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Prell <bernhard.prell@gmx.net>
Cc: reiserfs-list@namesys.com

On Thu, 2004-11-25 at 16:37 +0100, Bernhard Prell wrote:

[snip]

> *Background:
> I 'm administrating about 20 computers. The installed Linux/Reiser is quite 
> old: SuSE Linux with kernel 2.4.7(SMP) (dmesg tells me reiser 3.5.x disk 
> format, ReiserFS version 3.6.25).
> 
> Obviously people often pull the plug without cleanly shutting down the 
> systems, because maybe twice per month I have to setup a system again because 
> it doesn't want to boot anymore. The reason is always a somehow corrupted 
> root-filesystem. Sometimes reiserfsck can repair it, sometimes not because of 
> I/O-read-errors. If that's the case I also have a look at the disk with 
> "smartctl -t short /dev/hda" and it also reports read-errors. Then I usually 
> do a "dd if=/dev/zero of=/dev/hda", repartition, reformat, setup the system 
> from a tar file and everything is fine again (smartctl doesn't report 
> read-errors anymore).

[snip]

I can't comment on reiser4's characteristics but thought you might be
interested in my experiences. I ran a busy server using reiserfs for
over two years, from around the days of kernel 2.4.18. During that time,
there were several occasions on which power was lost (I had no UPS at
that time) and on no occasion did I experience filesystem corruption of
that kind, nor did I have to go through any special recovery procedures
to get things up and running again.

For this reason, and because I believe that the stability of reiserfs
was improved drastically in later revisions of the 2.4 kernel, I would
urge that you consider using a modern 2.4 kernel and the latest reiserfs
tools if possible!

Another factor is the type of journalling mode that is used. Later in
2.6, options were made available to select the journalling mode (see
http://www.namesys.com/mount-options.html) which reflect the hitherto
more flexible ext3 options. By mounting with data=journal, one can
ensure to a reasonable extent the integrity of both data and metadata,
probably at some expense in performance. Personally I never had any
problems with data=ordered which is the default.

I don't know what the situation is in 2.4 these days, but I am assuming
that this work was never backported i.e. only metadata is journalled.
However, even if that is the case I would still suggest that it is much
more robust in later kernels (both 2.4 and 2.6).

Regards,

--Kerin Francis Millar

