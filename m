From: Oleg Drokin <green@namesys.com>
Subject: Re: Error Code 255 and "Permission Denied"
Date: Tue, 7 May 2002 09:12:17 +0400
Message-ID: <20020507091217.E6541@namesys.com>
References: <scd69d55.074@gwd.albion.edu> <3CD725AC.6000708@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CD725AC.6000708@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Daniel Christiansen <christiansen@albion.edu>, reiserfs-list <reiserfs-list@namesys.com>, Chris Mason <mason@suse.com>

Hello!

On Tue, May 07, 2002 at 02:54:04AM +0200, Manuel Krause wrote:

> >Hm. Do you have write cache enabled on your harddrive? That may explain
> >your problems (and yes, most of drive manufacturers do enable write
> >caching
> >by default).
> Oleg, do you really think a dumb-crashing-Windows to be a reason?? What 

Yes. Sometimes Windows gets partitioning in a wrong way and writes to
incorrect places on HDD. (BTW, see this list archive for past month,
there were told at least two stories on Windows corrupting innocent Linux
filesystems, once on a read-only partition.)
Filesystems usually do not write garbage in metadata blocks by themselves.

> version do you run on your disks? I have a Win98 spread over the 

Version of what? I do run reiserfs of a lot of different kinds, including
testing my own patches which are very dangerous things sometimes ;)

> partitions of my 2 disks but the only things I get from a 
> crashed=powered-off Win98 are many-many unusable files in Win98 -- not 
> affecting my Linux system.

Lucky you. There are people who are not that lucky.

> Maybe it's the kernel <-reiserfs-sub-version-> version Daniel runs at 
> the moment? Oleg?

The 2.4.18-6mdk? I think it should have standard reiserfs stuff as in
vanilla 2.4.18.

> Or is it somekind of connected to Chris Masons thread "2.4.19-pre7 / 
> corruption on unwanted reboot"??? If Chris and Jens found bugs on IDE 

I doubt that Mandrake people are that stupid to include not tested very much
experimental code in their recommended kernels.

> interaction with ReiserFS they should really put out a patch soon... ;-)

Sure. But for now we only had one bug report, and 2.4.19-pre7 was around for
quite a while already.
If you know for a way to reproduce on certain common IDE hardware, we are
interested.

Bye,
    Oleg
