From: Chris Mason <mason@suse.com>
Subject: Re: Highmem on or off ?
Date: 12 Apr 2002 14:01:21 -0400
Message-ID: <1018634481.14429.146.camel@tiny>
References: <20020412112212.420491e1.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020412112212.420491e1.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

On Fri, 2002-04-12 at 05:22, Philippe Gramoull=E9 wrote:
>=20
> Hi,
>=20
> What you you recommend with a current 2.4.19-pre6 kernel ( i applied
> speedup patch as well) for Highmem in terms of stability on a rather
> heavily loaded NFS server.
>=20
> Would you recommend to turn highmem off or i can safely turn it on ?

I would suggest using andrea's kernels for speed with highmem.  He has
patches that eliminate bounce buffers for most scsi and ide cards, as
well as many VM tweaks.

-chris


