From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: reiser4 performance
Date: Mon, 8 Aug 2005 21:55:45 -0400
Message-ID: <e692861c05080818551a300f36@mail.gmail.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com>
	 <e692861c05080816136f9d70bc@mail.gmail.com>
	 <42F7F6DC.2080706@slaphack.com>
	 <e692861c050808175818078a30@mail.gmail.com>
	 <42F807D7.9090900@slaphack.com>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25370-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F807D7.9090900@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On 8/8/05, David Masover <ninja@slaphack.com> wrote:
> "Reiser4 would be great if..." is getting old.  It is great, and it's
> getting even better pretty fast.
>=20
> And, by the way, if the transaction interface gets done, it's not just
> databases that will benefit, but also small files.  After all, what kind
> of transactions are used for your OpenOffice document? =20
...

Well there doesn't actually need to be a transaction interface for
postgresql's needs.. it just needs a fairly limited set of assurances
from the VFS/FS that ... aren't usually provided. Beyond that, it
already handles its own transactions.  It looks like from Hans' reply
the reiser4 already provides everything needed.. which I had
suspected.
