From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Fri, 11 Oct 2002 12:40:41 +0200
Sender: lars@marowsky-bree.de
Message-ID: <20021011104041.GC29452@marowsky-bree.de>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <001b01c26fff$26d23850$0101a8c0@bummer> <20021010165854.4381ed7e.philippe.gramoulle@mmania.com> <3DA5B971.3040400@namesys.com> <20021010195338.138dffcf.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021010195338.138dffcf.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On 2002-10-10T19:53:38,
   Philippe Gramoull=E9 <philippe.gramoulle@mmania.com> said:

> Yes, that's what i meant by "not *out of the box* snapshots".

Well, LVM functionality comes out of the box with all modern distributions.

> We quite never played with LVM as it adds another software layer and i
> didn't feel it was mature enough at the time we put everything in product=
ion
> but given the benefits we might want to give it a try.

It is very mature in my experience.

> BTW, Hans, what you would recommand : LVM or EVMS ?

With 2.4, go with LVM1. The jury is still out whether the successor will be
EVMS or LVM2 in 2.5/2.6, but I personally have decided to quite like EVMS.


Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
Principal Squirrel
Research and Development, SuSE Linux AG
=20
``Immortality is an adequate definition of high availability for me.''
	--- Gregory F. Pfister

