From: Spam <spam@tnonline.net>
Subject: Re: CPU usage problem with custom 2.6.7 kernel
Date: Sat, 14 Aug 2004 12:36:50 +0200
Message-ID: <1677610534.20040814123650@tnonline.net>
References: <411DE847.3070809@iinet.net.au>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411DE847.3070809@iinet.net.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hi,
> I am using reiser3 on linux-2.6.7 on both a desktop and a
> fileserver. Intensive reading and writing
> seem to be using 100% cpu on both, limiting the rate at which I can transfer stuff to/from the
> fileserver to about 1Mb/s (on a 100MB/s network/800mhz Celeron
> server). The default slackware-2.4
> kernel does not seem to have this problem (the slackware 2.6.7
> kernel does not have reiserfs support
> by default). Anyone have any ideas?

> Thanks in advance,
> Patrick

> hdparm output (desktop) - 80gb (seagate), hda3 is 65gb reiser3:
> pcoleman@hal:~$ sudo hdparm /dev/hda

> /dev/hda:
>    multcount    =  0 (off)
>    IO_support   =  1 (32-bit)
>    unmaskirq    =  1 (on)
>    using_dma    =  1 (on)
>    keepsettings =  0 (off)
>    readonly     =  0 (off)
>    readahead    = 256 (on)
>    geometry     = 65535/16/63, sectors = 156301488, start = 0
> pcoleman@hal:~$

You really should enable multicount by using: hdparm -m16 /dev/hda

> hdparm output (server) - 120gb (western digital), one partition, hdb1 is 120gb reiser3:
> admin@server:~$ sudo hdparm /dev/hda

> /dev/hda:
>    multcount    = 16 (on)
>    IO_support   =  0 (default 16-bit)
>    unmaskirq    =  0 (off)
>    using_dma    =  0 (off)
>    keepsettings =  0 (off)
>    readonly     =  0 (off)
>    readahead    = 256 (on)
>    geometry     = 16383/255/63, sectors = 234441648, start = 0
> admin@server:~$

> I can supply kernel config files if required (the mailing list rejects messages over 40kb)


You need to enable DMA and 32bit I/O!
Use: hdparm -d1c3 /dev/hda

Other options to increas performance a lot are drive read-lookahead and write
cache: hdparm -A1W1 /dev/hda
Just a warning with write cache. If you loose power then you may loose
data (even though journals say otherwise).

You may also want to use unmask IRQ to allow other hardware like
network cards, to use interrupts while disk is reading/writing.
Use: hdparm -u1 /dev/hda


