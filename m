From: Oleg Drokin <green@namesys.com>
Subject: Re: =?koi8-r?Q?df=C2=A0_shows=C2=A0_172GB_?=
	=?koi8-r?Q?reiserFS_partition_as=C2=A0?= 109GB partition
Date: Tue, 8 Jul 2003 12:52:39 +0400
Message-ID: <20030708085238.GA5735@namesys.com>
References: <1057600162.2657.218.camel@brainless>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1057600162.2657.218.camel@brainless>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yasuo Iwakura <yasuoiwakura@arcor.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jul 07, 2003 at 07:49:22PM +0200, Yasuo Iwakura wrote:

> I have a IBM Deskstar 180GB Harddrive and I created a 172GB Reiser FS
> partition, using drakconf (mdk-9.1-ger).
> The Problem is, "df" show only 109GB, same with  windows(samba) -
> Windows says 108GB. (btw, the Bios thinks 130GB but i think thats not
> important)
> "df (coreutils) 4.5.7"
> "Linux version 2.4.21-0.13mdk"
> /dev/hda1
> - cylinder 1-22526
> - 180940063+ blocks
> - ID 83  Linux
> "

Hm, strange.
Looks like the fs was created with lesser size for unknown reason.
Try to issue this command (once) while fs is mounted:
mount /dev/hda1 -t reiserfs -o resize=45235015 

Then see if df now reports coirrect number.

Bye,
    Oleg
