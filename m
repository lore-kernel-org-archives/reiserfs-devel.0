From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Another panic!
Date: Tue, 23 Nov 2004 22:47:44 +0200
Message-ID: <20041123204744.GF26192@nysv.org>
References: <20041121163755.GV26192@nysv.org> <20041121172031.GW26192@nysv.org> <41A1FDAD.9040903@namesys.com> <20041122160122.GZ26192@nysv.org> <41A21DF9.7060907@namesys.com> <41A21EE4.9090602@namesys.com> <20041122165902.GA26192@nysv.org> <20041122185228.GB26192@nysv.org> <1101210439.2151.52.camel@tribesman.namesys.com> <20041123160052.GE26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22541-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041123160052.GE26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vladimir Saveliev <vs@namesys.com>
Cc: "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com, Cal <hihone@bigpond.net.au>

On Tue, Nov 23, 2004 at 06:00:52PM +0200, Markus T=F6rnqvist wrote:
>
>It did, well, at least I tried it once and it did :)
>

Uhh-uh, well, there were problems; some dead dpkg processes...

So there seems to be something I'm not getting.

I'm afraid I didn't take up the notices about the files having an
unexpected state (3), actually the file in question was the file
list of xprt-common, somewhere in /var/, and lessing it gave
an Input/Output Error...

Anyway, now doing an fsck, this will take some time, and I'll try
to get more debug out of it as well...

I just hope those dead processess were something with sudo and the
I/O Error not playing nice, because I really want this patch to work ;)

Keep you posted...

--=20
mjt

