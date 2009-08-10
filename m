From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: linux-next: reiserfs lockout with xattr ?
Date: Mon, 10 Aug 2009 22:08:26 +0200
Message-ID: <4A807E3A.8050703@free.fr>
References: <4A79CA90.8080101@free.fr> <20090808002726.GI4999@nowhere> <4A7E9C63.4090400@free.fr> <20090809233302.GD6089@nowhere>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090809233302.GD6089@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Kernel development list <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Le 10/08/2009 01:33, Frederic Weisbecker a =E9crit :
>=20
> Thanks a lot for this report. Reiserfs xattrs are definetly paths I
> haven't tested deeply.
>=20
> I'm trying to reproduce these issues and will let you know once I get
> a fix.
>=20
> (Btw, if you're still running this tree, you should update with the
> latest patch I just pushed, it's a very important fix).
>=20
> Thanks,
>=20
> Frederic.

I tried with your lastest patch (git head is at "kill-the-bkl/reiserfs:=
=20
fix early readdir offset increment"), and the lockout still happens.

~~
laurent
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
