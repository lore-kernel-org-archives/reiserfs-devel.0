From: Chris Mason <mason@suse.com>
Subject: Re: Fwd: Re: 2.4.19-rc1-jam2 (-rc1aa2)
Date: 10 Jul 2002 21:26:42 -0400
Message-ID: <1026350802.4952.0.camel@tiny>
References: <200207110235.22875.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10958-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207110235.22875.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Andrea Arcangeli <andrea@suse.de>, "J.A. Magallon" <jamagallon@able.es>

On Wed, 2002-07-10 at 20:35, Dieter N=FCtzel wrote:
> Hello Chris,
>=20
> symbol clash between latest -AA (-jam2, 00-aa-rc1aa2) kernel and your=20
> data-logging stuff ;-(

You should be able to drop the EXPORT_SYMBOL(balance_dirty); from my
patch.

-chris


