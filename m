From: Nicolas STRANSKY <Nico@stransky.cx>
Subject: Re: BitTorrent+Reiser4: curiouser and curiouser
Date: Mon, 25 Sep 2006 21:27:36 +0200
Message-ID: <ef9ajj$ccv$1@sea.gmane.org>
References: <4513827A.50809@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29978-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4513827A.50809@slaphack.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le 09/22/2006 08:28 AM, David Masover a =E9crit :
> Azureus had a problem.  Once it got up to a good clip downloading, it
> would thrash the disk.  It would thrash the disk, and the system, so
> hard that even web browsing was difficult, due to disk access being
> many, many times slower than Internet access, even an Internet which is
> being hogged by BitTorrent.

Just to add my 2=A2, I have exactly the same problem with azureus + r4.
Azureus starts to make constant disk writes at ~500-700kB/s when
downloading a file on a r4 partition.
I had opened a bugreport for azureus, but it now appears that this
problem is reiser4 specific as I cannot reproduce it with other filesystems.
https://sourceforge.net/tracker/?func=3Ddetail&atid=3D575154&aid=3D1558227&=
group_id=3D84122

--=20
Nico
On ne trouve gu=E8re d'ingrats tant qu'on est en =E9tat de faire du bien.
	-+- Fran=E7ois de La Rochefoucauld (1613-1680), Maximes 306 -+-

