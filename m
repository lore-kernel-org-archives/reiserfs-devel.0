From: Robert Lazzurs <lazzurs@lazzurs.net>
Subject: Re: linux and nfs issues
Date: Thu, 29 Jan 2004 14:33:54 +0000
Message-ID: <1075386834.624.269.camel@manson.ednet.co.uk>
References: <1075376569.633.166.camel@manson.ednet.co.uk>
	 <20040129130517.61e26e31@philou.gramoulle.local>
	 <1075380111.624.242.camel@manson.ednet.co.uk>
	 <20040129141004.63f06c23@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16652-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040129141004.63f06c23@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Thu, 2004-01-29 at 13:10, Philippe Gramoull=E9 wrote:
> Hello,
>=20
> Well, i'd advise you to upgrade to latest kernel if you can.
> Then if you can't i'd advise you not to put the postfix mail queue over N=
FS, but over
> local and fast disks.

Well the reason that we run the queues over NFS is because we have many
mail application servers for redundancy, however if we host the mail q's
locally then when we loose an app server we loose the mail.

> Besides the problems you described, this is quite a performance hit even =
for a moderate
> busy server.

To be honest that is not the bottleneck in the system, our current load
is about 300000 messages a day and we have found that just one PIII
server with 256Mb ram can take the messages in, spam scan, virus scan
and deliver the messages to NFS hosted maildir in under 1 second.

> And to quote Postfix author:
>=20
> "Couple years ago I talked with someone at WebTV. They ran Postfix
> queues on top of NFS. As a result of their experience I added one
> NFS workaround to Postfix. However, NFS is not a perfect emulation
> of a local disk, and strange things can happen occasionally.

I have taken this up with the postfix list, if this is the case then the
decision is clear, either postfix handles the situation better or we
have to use another MTA in our situation.

Take care - RL

--=20
MSN:lazzurs@everybuddy.com	|"All that is etched in stone
Yahoo:admroblaz AIM:admroblaz	|is truly only scribbled in
ICQ:66324927			|sand" - RL
Jabber:admroblaz@jabber.org	|Join Eff http://www.eff.org
e-mail:lazzurs@lazzurs.myftp.org|Take care all - Rob Laz


