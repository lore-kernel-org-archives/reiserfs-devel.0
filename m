From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 19:03:35 +0100
Message-ID: <200301311903.35770.Dieter.Nuetzel@hamburg.de>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <1044021310.15684.154.camel@tiny.suse.com> <3E3A8515.5010701@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3A8515.5010701@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>, Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Lars Marowsky-Bree <lmb@suse.de>, reiserfs-list@namesys.com

Am Freitag, 31. Januar 2003 15:15 schrieb Hans Reiser:
> Chris Mason wrote:

> >The fact that nobody actually ships a vanilla kernel should make it
> >pretty clear the stock releases are not ready for the tasks our
> >customers need them for.
>
> This is not clear to me at all.

Only two little examples (VM not ReiserFS ;-):

Oracle and SAP need -aa VM.
Some pieces missing for ages in the stock kernel.

=2Dac (base for RH?) has the O(1)-scheduler (-aa now, too) and low-lat.

Nothing in stock.

Peace,
	Dieter

PS Go on with your great ReiserFS 3.x (when will we see data-logging in sto=
ck)=20
and Reiser4 work.
=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

