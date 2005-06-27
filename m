From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 01:52:21 -0400
Message-ID: <e692861c05062622521a62e73c@mail.gmail.com>
References: <ninja@slaphack.com> <42BF4570.9010405@slaphack.com>
	 <200506270505.j5R55Zsx005315@laptop11.inf.utfsm.cl>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24660-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506270505.j5R55Zsx005315@laptop11.inf.utfsm.cl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: David Masover <ninja@slaphack.com>, Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On 6/27/05, Horst von Brand <vonbrand@inf.utfsm.cl> wrote:
> Wonderful! I carefully "transparently encrypt" my secret files, so
> /everybody/ can read them! Now /that/ is progress!

All of this side feature argument is completely offtopic for the
inclusion of reiser4, but oh well.

In any case, the real use for encrypted files (vs encrypted
partitions) would be for doing things like tying keying into the login
process so that your files are only accessible while you are logged
in.  This would be a very nice feature on a multiuser system.
