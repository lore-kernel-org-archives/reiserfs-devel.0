From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Snapshots a la NetApp?
Date: Mon, 24 Mar 2003 13:49:35 +0100
Message-ID: <20030324124934.GD1318@vestdata.no>
References: <200303221822.34401.phma@webjockey.net> <33433.10.20.2.148.1048390681.squirrel@alpha> <20030323111831.GF12916@marowsky-bree.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13352-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030323111831.GF12916@marowsky-bree.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lars Marowsky-Bree <lmb@suse.de>
Cc: kend@xanoptix.com, reiserfs-list@namesys.com

On Sun, Mar 23, 2003 at 12:18:31PM +0100, Lars Marowsky-Bree wrote:
> > I'm just wondering if there's any development being done on NetApp-like
> > snapshots.  (This differs from LVM snapshots in that it's file-by-file,
> > instead of volume based.)  If not, has anyone given it any consideratio=
n?=20
> > It would be a huge win for the RAID-in-a-box folks, and, speaking as a
> > sysadmin, is something about which I dream frequently.
>=20
> Well, implementing it at the LVM level isn't entirely bad though. What ki=
nd of
> advantage would have implementing at the filesystem level have? It would =
need
> to compensate at least the disadvantage of being less general.

I think the main advantage of having it in the filesystem is that it
makes the snapshots available to the users. This makes it possible for
regular users to undelete / restore files without having to contact the
sysadmin.=20

As for linux implementations of NetApp-like snapshots you should check
out snapfs:=20

http://www.mountainviewdata.com/us/product/product_snap_1.html
http://www-mddsp.enel.ucalgary.ca/People/adilger/snapfs/
http://sourcefrog.net/projects/snapfs/


--=20
Ragnar Kj=F8rstad
Zet.no
