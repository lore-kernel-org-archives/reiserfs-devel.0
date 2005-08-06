From: michael chang <thenewme91@gmail.com>
Subject: Re: recovering from "rm -rf"
Date: Fri, 5 Aug 2005 21:22:56 -0400
Message-ID: <b14e81f005080518221d61993c@mail.gmail.com>
References: <42F3A08A.30102@planet.nl> <42F3C73B.9040808@slaphack.com>
	 <b14e81f0050805135739c94933@mail.gmail.com>
	 <42F3D760.7090008@slaphack.com> <op.su10y3q7th1vuj@localhost>
	 <42F3E7F1.1030205@slaphack.com> <42F3EF37.3090705@edsons.demon.nl>
	 <42F3F4A4.2050505@slaphack.com>
	 <b14e81f0050805172275d01c26@mail.gmail.com>
	 <42F40CFE.3040001@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25323-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F40CFE.3040001@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: PFC <lists@boutiquenumerique.com>, reiserfs-list@namesys.com, rudy@edsons.demon.nl

> that.  I could have just resized the filesystem, but it was Reiser4.

*sigh* And that is why there are two features in Reiser4 that I am
still waiting for before I upgrade: resizing partitions (preferably
both shrink and grow) and the repacker (online or otherwise).  [And
maybe something that will tell me which kernels have the online
repacker and which ones don't, (e.g. if I only get the repacker by
applying a namesys patch).]  Otherwise I'd be using Reiser4 right now.
