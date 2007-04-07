From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: REISER4: fix for reiser4_write_extent
Date: Sat, 07 Apr 2007 14:51:48 +0200
Message-ID: <461793E4.5040706@free.fr>
References: <46157B5B.5000602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S965824AbXDGMwF@vger.kernel.org>
In-Reply-To: <46157B5B.5000602@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ignatich <ignatich@gmail.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Edward Shishkin <edward@namesys.com>

Le 06.04.2007 00:42, Ignatich a =C3=A9crit :
> While trying to find the cause of problems with reiser4 in recent=20
> kernels I came across this.
>=20
> Incomplete write handling seem to be missing from reiser4_write_exten=
t()=20
> thanks to reiser4-temp-fix.patch. Strangely, there is a patch by Edwa=
rd=20
> Shishkin that should address that issue, but it is missing from -mm=20
> tree. Please check.
>=20
>    Max
>=20

This patch was added to -mm tree the 14 Dec 2006 (see=20
http://www.mail-archive.com/mm-commits@vger.kernel.org/msg05338.html).

It was then dropped from -mm tree the 05 Mar 2007 (see=20
http://www.mail-archive.com/mm-commits@vger.kernel.org/msg10818.html),=20
with this comment:
	"This patch was dropped because it is obsolete"

No idea why it was obsolete. Does somebody know ?

~~
laurent
