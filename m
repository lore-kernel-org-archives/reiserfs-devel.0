From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: snapshot, checkpoints
Date: Thu, 10 Jun 2004 06:54:27 +0200
Message-ID: <20040610065427.622450fb@rayanne>
References: <20040527065259.99429.qmail@web51306.mail.yahoo.com>
	<1085641393.1915.199.camel@tribesman.namesys.com>
	<20040527092727.GO4990@nysv.org>
	<20040604131005.hmvps8wcw4sccgcs@www.wagland.net>
	<200406041925.i54JPZgp025255@turing-police.cc.vt.edu>
	<40C14E9C.4000706@slaphack.com>
	<116CD3CA-B709-11D8-A933-000A95CD704C@kungfoocoder.org>
	<40C78D86.2060305@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40C78D86.2060305@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Wed, 09 Jun 2004 17:21:58 -0500, David Masover <ninja@slaphack.com> a
=E9crit :

> Good, then we don't have to immediately rewrite the wheel.  But I still
> would rather that we do this eventually.  My concept has the changes
> stored on the same partition, seems like it may be faster, and opens the
> door for a filesystem-based cvs.

Look for "copy-on-write links" (cow links for short) in archives, or with
Google; You'll find many hits, including a message from 2000 suggesting the
idea has been around since at least 1997...
