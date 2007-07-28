From: Ian Kent <raven@themaw.net>
Subject: Re: request for patches: showing mount options
Date: Sat, 28 Jul 2007 14:45:59 +0800
Message-ID: <1185605159.8326.5.camel@raven.themaw.net>
References: <E1IEQ7q-0000qE-00@dorka.pomaz.szeredi.hu>
	 <1185550256.3203.77.camel@raven.themaw.net>
	 <E1IERvH-00016M-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <E1IERvH-00016M-00@dorka.pomaz.szeredi.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, kzak@redhat.com, ericvh@gmail.com, lucho@ionkov.net, zippel@linux-m68k.org, hpa@zytor.com, rathamahata@php4.ru, dhowells@redhat.com, sfrench@samba.org, mhalcrow@us.ibm.com, phillip@hellewell.homeip.net, hirofumi@mail.parknet.co.jp, mikulas@artax.karlin.mff.cuni.cz, wli@holomorphy.com, shaggy@austin.ibm.com, vandrove@vc.cvut.cz, trond.myklebust@fys.uio.no, aia21@cantab.net, mark.fasheh@oracle.com, kurt.hackel@oracle.com, reiserfs-devel@vger.kernel.org, bfennema@falcon.csc.calpoly.edu, dushistov@mail.ru, xfs-masters@oss.sgi.com, arnd@arndb.de, holzheu@de.ibm.com

On Fri, 2007-07-27 at 17:40 +0200, Miklos Szeredi wrote:
> >   all - fs has options, but doesn't define ->show_options()
> >   some - fs defines ->show_options(), but some options are not shown
> >   noopt - fs does not have options
> >   good - fs shows all options
> >   patch - I have a patch
> 
> [...]
> 
> > > autofs      all
> > 
> > I'm not sure I understand this.
> > How does autofs show it's options without a ->show_options method?
> 
> It doesn't.  The "all" means, all of them need to be added to
> ->show_options(), not that all are shown.

Oh .. sorry, I wasn't paying enough attention.

But now might be a good time to propose the removal of autofs and rename
autofs4 to autofs. I would need to provide some way to map autofs4
module load requests to autofs for backward compatibility but haven't
thought about that yet.

> 
> I can see now that this is slightly confusing, sorry.
> 
> So the ones that need attention are "all" and "some".  The others are
> fine in theory.  Of course I may have missed something.
> 
> > > autofs4     some
> > 
> > OK, uid and gid aren't shown.
> > That should be straight forward to fix.
> > What's your time frame for this?
> 
> ASAP ;)
> 
> 2.6.24 would be a nice, but it won't be easy...

The autofs4 (and, if needed autofs) should be straight forward.
I'll do these.

Ian


