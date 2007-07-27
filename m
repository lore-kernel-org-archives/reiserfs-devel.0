From: "Steve French" <smfrench@gmail.com>
Subject: Re: request for patches: showing mount options
Date: Fri, 27 Jul 2007 11:04:12 -0500
Message-ID: <524f69650707270904j24038282le55f3981dff560a@mail.gmail.com>
References: <E1IEQ7q-0000qE-00@dorka.pomaz.szeredi.hu>
	 <1185550256.3203.77.camel@raven.themaw.net>
	 <E1IERvH-00016M-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=mzj+SD+N9c7rvCvmPzFcuCkwVr2lwwqmETzvHATyB50oCHK+/ocy+W//I1IQqcXOnv+Ynm4KGXg8il92Qj6gvrT0490IwRw2K2MefLTYns1hd6D1kE9R288C/GGnG2eB5lZmfWTbzWpoEbGNFgF2BLG1x3rLaBpvbEji1Et+Zf8=
In-Reply-To: <E1IERvH-00016M-00@dorka.pomaz.szeredi.hu>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: raven@themaw.net, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, kzak@redhat.com, ericvh@gmail.com, lucho@ionkov.net, zippel@linux-m68k.org, hpa@zytor.com, rathamahata@php4.ru, dhowells@redhat.com, sfrench@samba.org, mhalcrow@us.ibm.com, phillip@hellewell.homeip.net, hirofumi@mail.parknet.co.jp, mikulas@artax.karlin.mff.cuni.cz, wli@holomorphy.com, shaggy@austin.ibm.com, vandrove@vc.cvut.cz, trond.myklebust@fys.uio.no, aia21@cantab.net, mark.fasheh@oracle.com, kurt.hackel@oracle.com, reiserfs-devel@vger.kernel.org, bfennema@falcon.csc.calpoly.edu, dushistov@mail.ru, xfs-masters@oss.sgi.com, arnd@arndb.de, holzheu@de.ibm.com

cifs and nfs (probably others) have some mount options which are mount
order dependent ie may be invalid or ignored when you have more than
one mount to the same server, or mount the same resource in two places
with different options.  In the long run, at least for cifs, we may be
able to better handle a user mounting to the same server twice with
e.g. different security options (authentication, packet signing ...),
but in the meantime are there any thoughts on whether those type of
mount options should be displayed differently

On 7/27/07, Miklos Szeredi <miklos@szeredi.hu> wrote:
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
>
> Miklos
>


-- 
Thanks,

Steve
