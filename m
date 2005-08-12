From: Tarmo =?ISO-8859-1?Q?T=E4nav?= <tarmo@itech.ee>
Subject: Re: BUG: reiserfs+acl+quota deadlock
Date: Fri, 12 Aug 2005 18:56:00 +0300
Message-ID: <1123862161.14093.4.camel@localhost>
References: <1123643111.27819.23.camel@localhost>
	 <20050810130009.GE22112@atrey.karlin.mff.cuni.cz>
	 <1123684298.14562.4.camel@localhost>
	 <20050810144024.GA18584@atrey.karlin.mff.cuni.cz>
	 <42FCB873.8070900@namesys.com>  <42FCBC00.2040903@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FCBC00.2040903@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@suse.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, mason@suse.com, grev@namesys.com

Vladimir V. Saveliev wrote:
> =20
> > It looks like the problem is that reiserfs_new_inode can be called
> > either having xattrs locked or not.
> > It does unlocking/locking xattrs on error handling path, but has no idea
> > about whether
> > xattrs are locked of not.
> > The attached patch seems to fix the problem.
> > I am not sure whether it is correct way to fix this problem, though.

I tested the patch, it did not fix the problem. Is there any way that I
could help diagnose the problem? (so far I have not tried reiserfs or
kernel debug options, could those help?)


On R, 2005-08-12 at 11:10 -0400, Jeff Mahoney wrote:
>=20
> Does this patch actually fix it? It shouldn't.
>=20
> The logic is like this: If a default ACL is associated with the parent
> when the inode is created, xattrs will be locked so that the ACL can be
> inherited. Since reiserfs_new_inode is called from the VFS layer with
> inode->i_sem downed, {set,remove}xattr is locked out. The default ACL
> can't be removed/added/changed while reiserfs_new_inode is running.
> Therefore, if there is a default ACL, xattrs must be locked.

I don't know if you read my report on this bug, but note that it had
no requirement for any ACL's to be used (even default ACL's), there was
only need for acl support to be enabled when mounting the partition.



--=20
Tarmo T=E4nav <tarmo@itech.ee>

