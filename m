From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: request for patches: showing mount options
Date: Fri, 27 Jul 2007 16:20:28 +0200
Message-ID: <E1IEQg8-0000ut-00@dorka.pomaz.szeredi.hu>
References: <E1IEQ7q-0000qE-00@dorka.pomaz.szeredi.hu> <524f69650707270710u7c21aea0v5d997484f33b3434@mail.gmail.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-reply-to: <524f69650707270710u7c21aea0v5d997484f33b3434@mail.gmail.com>
	(smfrench@gmail.com)
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: smfrench@gmail.com
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, kzak@redhat.com, ericvh@gmail.com, lucho@ionkov.net, zippel@linux-m68k.org, hpa@zytor.com, raven@themaw.net, rathamahata@php4.ru, dhowells@redhat.com, sfrench@samba.org, mhalcrow@us.ibm.com, phillip@hellewell.homeip.net, hirofumi@mail.parknet.co.jp, mikulas@artax.karlin.mff.cuni.cz, wli@holomorphy.com, shaggy@austin.ibm.com, vandrove@vc.cvut.cz, trond.myklebust@fys.uio.no, aia21@cantab.net, mark.fasheh@oracle.com, kurt.hackel@oracle.com, reiserfs-devel@vger.kernel.org, bfennema@falcon.csc.calpoly.edu, dushistov@mail.ru, xfs-masters@oss.sgi.com, arnd@arndb.de, holzheu@de.ibm.com

> What do you consider the best example so far of a kernel module's
> equivalent of "parse_mount_options" (handling a mix of options of
> different types) and show_options.

For example gfs2 is pretty good.  It has lots of different type of
options, and it handles them in remount as well as mount.

Miklos
