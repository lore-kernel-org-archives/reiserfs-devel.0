From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: dmapi support for reiser4
Date: Thu, 30 Jun 2005 09:12:49 +0200
Message-ID: <20050630071249.GR31371@vestdata.no>
References: <20050628093408.GA23882@lisa.goe.net> <1119958258.3495.52.camel@tribesman.namesys.com> <20050629115713.GC3610@lisa.goe.net> <42C323AA.1070802@nauticom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42C323AA.1070802@nauticom.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chet Hosey <chosey@nauticom.net>
Cc: Bjoern JACKE <bjoern@j3e.de>, reiserfs-list@namesys.com

On Wed, Jun 29, 2005 at 06:41:46PM -0400, Chet Hosey wrote:
> >> I would guess that it is rather operating system feature than a
> >> filesystem one. Can you please point some source of information about
> >> DMAPI?
>=20
> Is there a standard VFS interface that these filesystems present, or is
> it done via filesystem-specific extensions? If the latter, perhaps you
> should consider submitting a kernel patch that adds the required
> interface to the VFS layer, and note in your submission that XFS and JFS
> aren't compliant.

The OpenXDSM project intended to extend the VFS layer with a few extra
functions and to implement a generic XDSM/DMAPI layer on top of that.

The project never really got anywhere and the sourceforge webpage has
been removed, but you can still find some pointers to the VFS
discussions if you google for OpenXDSM.

In short, the filesystems needed to be extended with functionality in
two primary areas:
- persistent storage of metadata
- beeing able to punch holes in existing files.

The first item has since been solved by extended attributes, and I
believe there were some ideas about how to change truncate to also be
able to punch holes. There were probably a few more things needed to be
done, but I don't remember. Google probably knows.

> You said that "reiser4 will not be a real competitor without this". A
> competitor in what market? Can you name an application that depends on
> DMAPI and is so important that without that particular application
> Reiser4 is not appropriate for storing files?

DMAPI is used for Hirarchial Storage Management, migrating unused files
to slower medium such as tape. It can also be used by backupsystems.

I should add though, that not everybody that does HSM are big fans of
DMAPI. It's quite possible that it would be just as productive to add a
_different_ API for HSM to linux as adding DMAPI.

> Just curious, as I'd not heard of DMAPI prior to your post, but you
> claim it's quite important.

It is important in a relatively narrow (high end) market, not really for
desktops and low end servers.


--=20
Ragnar Kj=F8rstad
