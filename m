From: Ricardo Reis <rreis@aero.ist.utl.pt>
Subject: Re: quota on 2.4.20
Date: Tue, 13 May 2003 13:44:08 +0100 (WEST)
Message-ID: <Pine.LNX.4.52.0305131343200.30505@betty>
References: <Pine.LNX.4.52.0305131156320.30017@betty> <20030513105447.GA18413@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-list-return-14088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030513105447.GA18413@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Cc: reiserfs-list@namesys.com


> Anyway you have not enough quota options selected, I outlined ones that y=
ou need
> to enable.
>
> > CONFIG_QUOTA=3Dy
> > # CONFIG_QFMT_V1 is not set
> > # CONFIG_QFMT_V2 is not set
> > # CONFIG_QIFACE_COMPAT is not set
>
> This one (CONFIG_QIFACE_COMPAT) is only needed if you use old quotatools =
(read help).
> If you think you need it, it will add one more config entry and you need =
to select vfv0 there

hi!
Only after using that last option everything started to work... thx for
your time!

greets,

R.Reis

"Non Serviam"

("Ent=E3o... voc=EA est=E1 com um ferro na m=E3o porqu=EA?")

n.p.: computer hmmm, nth sinphonie
n.r.:

=09=09=09<- Send with Pine Linux/Unix/Win/Mac OS->
