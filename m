From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: XFS corruption during power-blackout
Date: Thu, 30 Jun 2005 21:44:37 +0200
Message-ID: <20050630194437.GC8374@wohnheim.fh-wedel.de>
References: <254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org> <OFC7BE2BBA.42F70A93-ON88257030.00595A48-88257030.005A99A3@us.ibm.com> <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <054069.b93858d6b97c07747dc32be2dd8981b254d981528781006053dce7be58de88865a43b162.IBX@taniwha.stupidest.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Wedgwood <cw@f00f.org>
Cc: Bryan Henderson <hbryan@us.ibm.com>, Al Boldi <a1426z@gawab.com>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

On Thu, 30 June 2005 11:46:27 -0700, Chris Wedgwood wrote:
> On Thu, Jun 30, 2005 at 12:30:20PM -0400, Bryan Henderson wrote:
>=20
> > In others, it implements "everything that was buffered when sync()
> > started is hardened before the next sync() returns,"
>=20
> That is what happens now.  I'm not sure any other behavior makes sens=
e
> does it?
>=20
> If it happens differently I would call that a bug.

While I agree with all the rest, this part confuses me.  Do you mean
that sync() should altually return immediatly, but the second sync()
block until all data present at the time of the previous sync() is
hardened?

Or do you rather mean that a single sync() should block until all data
currently present is hardened?

J=F6rn

--=20
It is better to die of hunger having lived without grief and fear,
than to live with a troubled spirit amid abundance.
-- Epictetus
-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
