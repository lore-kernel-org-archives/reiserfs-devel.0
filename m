From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 21:23:20 +0200
Message-ID: <20030711212320.20245509.philippe.gramoulle@mmania.com>
References: <20030710052931.GA17957@namesys.com>
	<20030711154415.GI17180@namesys.com>
	<1057943343.13317.65.camel@tiny.suse.com>
	<200307111927.06650.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14901-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307111927.06650.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-15?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, Marc-Christian Petersen <m.c.p@gmx.net>, Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com


Hello Dieter,

Before we  used to host web files so reiserfs + quota was mandatory. We cou=
ld live without the data-logging
code. Now that we use reiserfs for fsync intensive applications, data-loggi=
ng + quota + latest
IO improvements from Chris that were committed recently in 2.4.22-pre and i=
t will soon become a must have.

Of course i wish that it would all be included in 2.4.22 but if Marcello do=
esn't agree
i guess, we'll continue to use the out-of-tree patches and diff's that all =
people here kindly provided
for years.

Thanks,

Philippe

On Fri, 11 Jul 2003 19:27:06 +0200
Dieter N=FCtzel <Dieter.Nuetzel@hamburg.de> wrote:

  | > Marcelo seems to like being really conservative on this point, and I
  | > don't have a problem with Oleg's original idea to just do relocation =
in
  | > 2.4.22 and the full data logging in 2.4.23-pre4 (perhaps +quota now t=
hat
  | > 32 bit quota support is in there).
  |=20
  | So, it's another half year away...?
