From: Robert Lazzurs <lazzurs@lazzurs.net>
Subject: Re: linux and nfs issues
Date: Thu, 29 Jan 2004 12:41:51 +0000
Message-ID: <1075380111.624.242.camel@manson.ednet.co.uk>
References: <1075376569.633.166.camel@manson.ednet.co.uk>
	 <20040129130517.61e26e31@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16650-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040129130517.61e26e31@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

On Thu, 2004-01-29 at 12:05, Philippe Gramoull=E9 wrote:
> Hello Robert,
>=20
> Well, you don't tell if this is a problem for you.
> Is the server working fine though ?
>=20
> As the log say, you can safely ignore this.
>=20
> We have this warning logged for months, and everything's been working fin=
e here.

Sorry, I should have made that more clear.  Yes, we are having issues,
this is what I have seen on the clients from postfix.

Jan 28 11:03:35 liszt-01/liszt-01 postfix/smtp[31184]: fatal: update
queue file active/4/D/4DF43CE6AD: Stale NFS file handle

However I have to be honest and say that I cannot relate directly the
above error to the kernel error I posted........however I can say for
sure that it is an NFS issue.

Thanks, kind regards - RL

--=20
MSN:lazzurs@everybuddy.com	|"All that is etched in stone
Yahoo:admroblaz AIM:admroblaz	|is truly only scribbled in
ICQ:66324927			|sand" - RL
Jabber:admroblaz@jabber.org	|Join Eff http://www.eff.org
e-mail:lazzurs@lazzurs.myftp.org|Take care all - Rob Laz


