From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: reiser4 plugins
Date: Sun, 26 Jun 2005 01:07:38 -0400
Message-ID: <e692861c05062522071fe380a5@mail.gmail.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>
	 <42BCD93B.7030608@slaphack.com>
	 <200506251420.j5PEKce4006891@turing-police.cc.vt.edu>
	 <42BDA377.6070303@slaphack.com>
	 <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu>
	 <42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24608-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BE3645.4070806@cisco.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lincoln Dale <ltd@cisco.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On 6/26/05, Lincoln Dale <ltd@cisco.com> wrote:
> the l-k community have asked YOU may times.  any lack of response isn't
> because of the kernel cabal .. its because YOU are refusing to entertain
> any notion that what Reiser4 has implemented is unpalatable to the
> kernel community.

A lot of this is based on misconceptions, for example in recent times
reiser4 is faulted for layering violations.. But it doesn't have them,
it neither duplicates nor modifies the VFS.

It has also been requested that reiser4 be changed to move some of
it's operations above the VFS... not only would that not make sense
for the currently provided functions, but merging was put off
previously because of changes to the VFS.... now that it doesn't
change the VFS we are asking hans to push it off until it does??

It's a filesysem for gods sake. Hans and his team have worked hard to
minimize its impact and they are still willing to accept more
guidance, even if their patience has started to run a little thin. =20
The acceptance of reiser4 into the mainline shouldn't be any larger
deal than any other filesystem, but yet it is...
