From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <kernel@ragnark.vestdata.no>
Subject: Re: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Thu, 31 Oct 2002 21:17:47 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20021031211747.V30076@vestdata.no>
References: <15809.21559.295852.205720@laputa.namesys.com> <20021031161826.A9747@infradead.org> <15809.22856.534975.384956@laputa.namesys.com> <20021031163104.A9845@infradead.org> <20021031173311.GA23959@clusterfs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20021031173311.GA23959@clusterfs.com>; from adilger@clusterfs.com on Thu, Oct 31, 2002 at 10:33:11AM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christoph Hellwig <hch@infradead.org>, Nikita Danilov <Nikita@Namesys.COM>, Linus Torvalds <Torvalds@Transmeta.COM>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Thu, Oct 31, 2002 at 10:33:11AM -0700, Andreas Dilger wrote:
> On Oct 31, 2002  16:31 +0000, Christoph Hellwig wrote:
> > What about chaing truncate_inode_pages to take an additional len
> > argument so you don't have to remove all pages past an offset?
>=20
> That would be what we have been calling "punch", and is quite useful
> for putting holes in files (i.e. making them sparse again).  This
> can be used for InterMezzo (among other things) so that the KML log
> file can be growing at the end, but being punched out at the start
> so it doesn't use up a lot of disk space.

It's also very useful for HSM-software (Hirarcial Storage Management).


--=20
Ragnar Kj=F8rstad
Big Storage
