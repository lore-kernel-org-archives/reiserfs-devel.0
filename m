From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: Terrible performance (<100kb/sec) in a cp -Raf
Date: Fri, 18 Jun 2004 11:07:59 +0200
Message-ID: <20040618110759.63901f99@blade.concept-micro.com>
References: <oyd4qpee0fv.fsf@bert.cs.rice.edu>
	<oyd3c4utf1q.fsf@bert.cs.rice.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <oyd3c4utf1q.fsf@bert.cs.rice.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le 17 Jun 2004 09:49:53 -0500, Scott A Crosby <scrosby@cs.rice.edu> a =E9cr=
it
:

> I appreciate the help, but I am using an external USB drive, not an
> external firewire drive. The kernel patch only modifies the
> ieee1394_core.c file, which is unused in my system.

Uh, I wonder why I read "firewire" when it was "USB" ;)

> Also, my error seems related to Fabian Sturm's report a couple of days
> ago about 'no space left on device'. When I waited for the bulk copy
> to stop, 'cp' reported no space available even though the partitian is
> only 17% used.=20

So it may not be USB related after all. Tried kernel 2.6.7 ?
