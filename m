From: Oleg Drokin <green@namesys.com>
Subject: Re: O.k. so this way, r8 ?
Date: Thu, 18 Jul 2002 17:08:51 +0400
Message-ID: <20020718170851.A23148@namesys.com>
References: <1026997025.734.8.camel@prototype>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1026997025.734.8.camel@prototype>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Moritz Angermann <moritz.angermann@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 18, 2002 at 02:57:05PM +0200, Moritz Angermann wrote:
> so i check it all out:
> thanks for your help.
> so this is what i'm going to do,
> i'd just like to have it confirmed, so
> i get less risk to kill my FS.

The sequence looks ok with few notes.

> #0 backing up my data
> #1 getting 2.4.18
> #2 getting all patches from
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.18.pending
> #3 applying them all to my 2.4.18 kernel.
> #4 make clean;make menuconfig;make dep;make bzfloppy[;make modules;make

You want not only have new kernel on floppy, but also as a default kernel, too.

> modules install ?]
> #5 getting
> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.2.tar.gz
> #6 unpacking it; ./configure --prefix=/mnt/floppy/rfsp;make;make install
> #7 reboot
> #8 umount /

unmounting / is not possible, so you must boot off some rescue media here in
fact.

> #9 rfsp/reiserfsck /dev/hda6 --fix-fixable

See if it reported everything is ok or if it was recommending to do a
rebuild-tree, do the rebuild-tree too.

> #10 reboot [and hope]

Bye,
    Oleg
