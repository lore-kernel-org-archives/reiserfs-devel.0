From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser FS will not boot after crash
Date: Mon, 4 Sep 2006 23:33:27 +0400
Message-ID: <200609042333.27778.vs@namesys.com>
References: <Pine.LNX.4.04.10609041516380.4384-100000@nei15.nei1.nei.mv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.04.10609041516380.4384-100000@nei15.nei1.nei.mv.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: jmh5@nei.mv.com

Hello

On Monday 04 September 2006 23:26, jmh5@nei.mv.com wrote:
> Hi,
>
>   I am observing the following Reiser failure:
>
>   I am trying to use camorama with a Creative WebCam Live spca5xx driver
> (recently downloaded and compiled) . Camorama does not start and computer
> freezes (no response to mouse, or keyboard. Can't change to terminal
> window.
>
>   Reset or pull plug leaves Knoppix 5.0.1-DVD unbootable:
>
>   The actual message from GRUB is inconsistent filesystem?! From a boot
> loader?

after unclean shutdown journal reply is necessary to return reiserfs to 
consistent state. Maybe GRUB did not do that?

>
>   The 'fix' is even stranger. I execute fsck.reiserfs from another OS
> partition on the Knoppix 5.0.1-DVD partition (takes forever). 

Did fsck complete? What did it report?

> Somehow 
> 'reading' the Knoppix filesystem 'fixes' whatever was preventing Knoppix
> 5.0.1-DVD from booting.
>

fsck replayed the journal.
Does camorama work now?

If it still causes computer freeze - can you please install serial or network 
console and try to catch what does kernel output when it freezes.

>   I am curious what your comments and/or suggestions might be?
>


>   regards to all Linuxers,
>   john
