From: Jan Kara <jack@ucw.cz>
Subject: Re: ReiserFS quota and 2.6.10
Date: Wed, 23 Feb 2005 12:13:46 +0100
Message-ID: <20050223111346.GA9269@atrey.karlin.mff.cuni.cz>
References: <20050222201726.31044.qmail@web86510.mail.ukl.yahoo.com> <20050223102811.GC31151@atrey.karlin.mff.cuni.cz> <200502231201.28550.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200502231201.28550.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter =?iso-8859-2?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, Yiannis Mavroukakis <i.mavroukakis@btinternet.com>

> Am Mittwoch, 23. Februar 2005 11:28 schrieb Jan Kara:
> > > Because I like to keep people happy, especially Valdis
> > > Kletnieks, I'll repost my query from another email
> > > account without a disclaimer..here we go.
> > >
> >   :) The disclaimer was quite longer than the message...
> > >
> > > ==========
> > >
> > > >From the subject, you have probably already guessed
> > >
> > > what I am about to ask..
> > > Is quota working ok with vanilla 2.6.10 with ReiserFS?
> >
> >   Yes, the quota should be working fine - I suggest to wait a bit for
> > 2.6.11 as it has fixed some deadlocks in the quota code appearing under
> > high load.
> 
> Is this "fixed" in SLES kernels already?
  These problems are fixed in the current SUSE kernel and hence will be
fixed in 9.3 and newer "products". But it's not in anything older...

								Honza

