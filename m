From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 00:25:56 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040829232556.GB16297@parcelfarce.linux.theplanet.co.uk>
References: <412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com> <20040829150231.GE9471@alias> <4132205A.9080505@namesys.com> <20040829183629.GP21964@parcelfarce.linux.theplanet.co.uk> <20040829185744.GQ21964@parcelfarce.linux.theplanet.co.uk> <41323751.5000607@namesys.com> <20040829212700.GA16297@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408291431070.2295@ppc970.osdl.org> <1093821430.8099.49.camel@lade.trondhjem.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093821430.8099.49.camel@lade.trondhjem.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Linus Torvalds <torvalds@osdl.org>, Hans Reiser <reiser@namesys.com>, flx@msu.ru, Paul Jackson <pj@sgi.com>, riel@redhat.com, ninja@slaphack.com, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Sun, Aug 29, 2004 at 07:17:10PM -0400, Trond Myklebust wrote:
> P=E5 su , 29/08/2004 klokka 17:50, skreiv Linus Torvalds:
> > The general VFS layer has a lot of rules, and avoids these problems by
> > simply never having aliases between two directories. If the same direct=
ory
> > shows up multiple times (which can happen with bind mounts), they have =
the
> > exact same dentry for the directory, it's just found through two differ=
ent
> > vfsmount instances. That's why vfsmounts exist - they allow the same na=
me
> > cache entry to show up in different places at the same time.
>=20
> So could you explain what is stopping us from reducing the whole problem
> to the bind mount problem? IOW have "a/" be a directory that acts as if
> it is dynamically bind mounted on top of the file "a".
>=20
>=20
> Is it just the fantasy of supporting hard-links across "stream
> boundaries" (as in "touch a b; ln b a/b; ln a b/a")? I'm pretty sure
> nobody wants to have to add cyclic graph detection to their filesystems
> anyway. 8-)
>=20
> What other issues would need to be addressed?

Go upthread and read.
