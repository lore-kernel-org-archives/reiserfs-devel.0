From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 18:50:46 +0300
Message-ID: <200403111839.49951.vitaly@namesys.com>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com> <Pine.LNX.4.58.0403110848380.1969@web1.mmaero.com> <1079014534.9475.265.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079014534.9475.265.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>, jlewis@lewis.org
Cc: reiserfs-list@namesys.com

> > > Yes, this looks like reiserfsck got into endless loop. If it is still
> > > there lets break and fix reiserfsck bug.
> > > For this we need you to do extract filesystem metadata with
> > >
> > > debugreiserfs -p /dev/thatdevice | bzip2 -c > metadata.bz2
> > >
> > > and allow us to download that file.
> >
> > How soon could we expect a response to that?
>
> fsck maintainer will work on it when he is on his working place. Now he
> is not, though

wrong, I can look into it just after you make the metadata.

-- 
Thanks,
Vitaly Fertman
