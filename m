From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: allocator options, kernel 2.6.7
Date: Thu, 17 Jun 2004 02:05:49 +0200
Message-ID: <20040617020549.76445f3e@rayanne>
References: <20040617012918.1cc93df9@rayanne>
	<1087429133.8002.15.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19223-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1087429133.8002.15.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Wed, 16 Jun 2004 19:38:53 -0400, Chris Mason <mason@suse.com> a =E9crit :

> > Does that mean that I could have problem fixing some of my filesystems
> > if they happened to need reiserfsck ?
> >=20
> There's a reiserfsprogs patch as well, which was sent to Vitaly.  I've
> attached it to this message.

Ok, so in the worst case filesystem can be checked, given that
used reiserfsck is recent enough. Getting last reiserfsck is always a good
advice anyway ;)

> It seemed best to keep the changes for 2.6.7 somewhat more limited.  The
> allocator patches are going through a big QA round at SUSE as well right
> now, so any remaining problems should get ironed out very shortly.

Once again doing a great work (and answering lightning fast ;) )

Many thanks,
Pierre.
