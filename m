From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS partition detected as vfat
Date: Thu, 20 Jun 2002 22:13:22 +0400
Message-ID: <20020620221322.A1875@namesys.com>
References: <200206201921.26559.vadim@sheelab.dynodns.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200206201921.26559.vadim@sheelab.dynodns.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vadim@hardison.net
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jun 20, 2002 at 07:21:14PM +0200, Vadim wrote:

> rabbit:/mnt# mount /dev/hda1 hda
> mount: fs type vfat not supported by kernel
> rabbit:/mnt# 

It just means that VFAT signature was left untouched in 1st sector of a
partition.

> On my other computer, with kernel 2.4.18, where I do have vfat 
> support it seems it attempts mounting the reiserfs partition as 
> vfat as well:
> FAT: bogus logical sector size 0
> UMSDOS: msdos_read_super failed, mount aborted.
> FAT: bogus logical sector size 0
> FAT: bogus logical sector size 0
> (USB messages)

Same story

> I'm not sure if this is a reiserfs problem or a vfat one, but it 
> seems related at least. I won't have the disk from the "rabbit" 
> machine for long, so if you need a few sectors from it or 
> anything like that, please ask now.

This is a problem with older reiserfsprogs package not overwritting
1st sector of partition.
You may want to zero it yourself if it bothers you. 

Bye,
    Oleg
