From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 12:19:54 +0300
Message-ID: <20040827091954.GZ1284@nysv.org>
References: <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com> <20040826183532.GP1501@ca-server1.us.oracle.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20901-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826183532.GP1501@ca-server1.us.oracle.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, Jamie Lokier <jamie@shareable.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 11:35:32AM -0700, Joel Becker wrote:
>	Question:  Is "cat /foo/bar/baz.tar.gz/metas" the attribute
>directory or a directory in the tarball named "metas"?

This has been fought over on the reiserfs-list ad nauseaum, but
it's a valid point.

That's why I tend to rename metas/ into ..metas/ to avoid
name clashes, even if I've never had a directory named metas/
apart from what Reiser4 ships.

It is then debatable if it should be renamed before it's too
late, have it renamable in the kernel configs (and the name
exported via /sys or something) or just leave it be.

-- 
mjt

