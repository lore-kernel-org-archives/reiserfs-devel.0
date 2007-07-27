From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: request for patches: showing mount options
Date: Fri, 27 Jul 2007 18:09:34 +0200
Message-ID: <E1IESNi-0001B9-00@dorka.pomaz.szeredi.hu>
References: <E1IEQ7q-0000qE-00@dorka.pomaz.szeredi.hu>
	 <1185550256.3203.77.camel@raven.themaw.net>
	 <E1IERvH-00016M-00@dorka.pomaz.szeredi.hu> <524f69650707270904j24038282le55f3981dff560a@mail.gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <524f69650707270904j24038282le55f3981dff560a@mail.gmail.com>
	(smfrench@gmail.com)
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: smfrench@gmail.com
Cc: miklos@szeredi.hu, raven@themaw.net, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, kzak@redhat.com, ericvh@gmail.com, lucho@ionkov.net, zippel@linux-m68k.org, hpa@zytor.com, rathamahata@php4.ru, dhowells@redhat.com, sfrench@samba.org, mhalcrow@us.ibm.com, phillip@hellewell.homeip.net, hirofumi@mail.parknet.co.jp, mikulas@artax.karlin.mff.cuni.cz, wli@holomorphy.com, shaggy@austin.ibm.com, vandrove@vc.cvut.cz, trond.myklebust@fys.uio.no, aia21@cantab.net, mark.fasheh@oracle.com, kurt.hackel@oracle.com, reiserfs-devel@vger.kernel.org, bfennema@falcon.csc.calpoly.edu, dushistov@mail.ru, xfs-masters@oss.sgi.com, arnd@arndb.de, holzheu@de.ibm.com

> cifs and nfs (probably others) have some mount options which are mount
> order dependent ie may be invalid or ignored when you have more than
> one mount to the same server, or mount the same resource in two places
> with different options.  In the long run, at least for cifs, we may be
> able to better handle a user mounting to the same server twice with
> e.g. different security options (authentication, packet signing ...),
> but in the meantime are there any thoughts on whether those type of
> mount options should be displayed differently

I think they should be displayed normally, just as all the other
options.  If an option is shared by multiple mounts, that option
should be displayed for all of them.

This is similar to the case of per-mount vs. per-superblock options,
which aren't separated either.

Miklos
