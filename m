From: Michael James <Michael.James@csiro.au>
Subject: Re: once a Week the FS crashes
Date: Mon, 7 Jun 2004 17:14:05 +1000
Message-ID: <200406071714.05004.Michael.James@csiro.au>
References: <200406070820.10391.aotto1968@onlinehome.de>
Reply-To: Michael.James@csiro.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19053-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406070820.10391.aotto1968@onlinehome.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: aotto1968@t-online.de

On Mon, 7 Jun 2004 04:20 pm, Andreas Otto wrote:

>  1. after 5 times booting my Linux-Box with Reiser-Fs crashes:
>        => unabel to read BITMAP at ######
>      and the kernel PANIC
> 
>   to solve the problem I boot from the rescue disc of my SuSe Linux 9.0
>  and do: fsck.reiserfs --rebuild-tree /dev/hda2
> 
>  after that everything is OK:
> 
>  Question:
>    a) is this a HW or a SW problem
>    b) if HW: is this a DISK or a CHIPSET problem
>    c) if SW: is this a REISER or a DRIVER problem

Every problem I have ever had with reiser was caused by bad RAM.
RAM glitches can cause "holes" in reiser that persist across reboots
 making files un-readable or un-listable.

If it's just a workstation,
 I'd suggest running memtest86 all night and all weekend.

If you have a Suse install disk, boot off it and choose "memtest".
That's it. Just leave it running. For as long as possible.

I had one RAM/motherboard combination
 that would fault once in a weekend's running. 

Caused me hell as more and more
 processes "fell in the holes" and froze.

FWIW,
michaelj

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166
