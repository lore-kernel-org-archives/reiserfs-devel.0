From: =?ISO-8859-1?Q?Thomas_R=F6sner?= <dtrauma.lkml@gmail.com>
Subject: Re: reiser4 plugins
Date: Wed, 29 Jun 2005 21:32:32 +0200
Message-ID: <ec88f49305062912323a1ee1be@mail.gmail.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>
	 <42BCD93B.7030608@slaphack.com>
	 <200506251420.j5PEKce4006891@turing-police.cc.vt.edu>
	 <42BDA377.6070303@slaphack.com>
	 <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu>
	 <42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com>
	 <e692861c05062522071fe380a5@mail.gmail.com>
	 <42BE563D.4000402@cisco.com> <42BE5DB6.8040103@slaphack.com>
Reply-To: =?ISO-8859-1?Q?Thomas_R=F6sner?= <dtrauma.lkml@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24809-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BE5DB6.8040103@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Hi,

I hereby throw myself into the neverending flames called "reiser4
plugins" - may it please the gods.

David Masover (who really could use pgp mime attatchments):
> So, the API becomes something like:
>=20
> cat crypto/inflated/foo         # transparently decompressed
> cat crypto/raw/foo.gz           # raw, gzip-compressed

Wee, I've seen this before. Wait, its AVFS! But didn't AFVS work with
any underlying fs? Even nfs?

cd foo.zip#/bar/
cat foo.tgz#/bar/plonk.txt

There is no reason why there shouldn't be a gpg AVFS-plugin, too. OK,
AVFS worked via coda's redir.o and IMHO we need smth like this in 2.6.
But, apart from more efficient compression on disk (if that really
ever works) you didn't show any convincing use cases.

Or am I fundamentally wrong?

regards,
  Thomas
