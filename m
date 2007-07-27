From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: request for patches: showing mount options
Date: Fri, 27 Jul 2007 17:40:11 +0200
Message-ID: <E1IERvH-00016M-00@dorka.pomaz.szeredi.hu>
References: <E1IEQ7q-0000qE-00@dorka.pomaz.szeredi.hu> <1185550256.3203.77.camel@raven.themaw.net>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <1185550256.3203.77.camel@raven.themaw.net> (message from Ian
	Kent on Fri, 27 Jul 2007 23:30:56 +0800)
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: raven@themaw.net
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, kzak@redhat.com, ericvh@gmail.com, lucho@ionkov.net, zippel@linux-m68k.org, hpa@zytor.com, rathamahata@php4.ru, dhowells@redhat.com, sfrench@samba.org, mhalcrow@us.ibm.com, phillip@hellewell.homeip.net, hirofumi@mail.parknet.co.jp, mikulas@artax.karlin.mff.cuni.cz, wli@holomorphy.com, shaggy@austin.ibm.com, vandrove@vc.cvut.cz, trond.myklebust@fys.uio.no, aia21@cantab.net, mark.fasheh@oracle.com, kurt.hackel@oracle.com, reiserfs-devel@vger.kernel.org, bfennema@falcon.csc.calpoly.edu, dushistov@mail.ru, xfs-masters@oss.sgi.com, arnd@arndb.de, holzheu@de.ibm.com

>   all - fs has options, but doesn't define ->show_options()
>   some - fs defines ->show_options(), but some options are not shown
>   noopt - fs does not have options
>   good - fs shows all options
>   patch - I have a patch

[...]

> > autofs      all
> 
> I'm not sure I understand this.
> How does autofs show it's options without a ->show_options method?

It doesn't.  The "all" means, all of them need to be added to
->show_options(), not that all are shown.

I can see now that this is slightly confusing, sorry.

So the ones that need attention are "all" and "some".  The others are
fine in theory.  Of course I may have missed something.

> > autofs4     some
> 
> OK, uid and gid aren't shown.
> That should be straight forward to fix.
> What's your time frame for this?

ASAP ;)

2.6.24 would be a nice, but it won't be easy...

Miklos
