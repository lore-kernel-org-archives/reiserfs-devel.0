From: Paul Stewart <stewart@parc.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 10:43:58 PDT
Message-ID: <1093887838l.11947l.1l@orlando>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com>
	<412F7D63.4000109@namesys.com> <20040827230857.69340aec.pj@sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040827230857.69340aec.pj@sgi.com> (from pj@sgi.com on Fri,
	Aug 27, 2004 at 23:08:57 -0700)
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: Paul Jackson <pj@sgi.com>
Cc: Hans Reiser <reiser@namesys.com>, riel@redhat.com, ninja@slaphack.com, torvalds@osdl.org, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On 2004.08.27 23:08, Paul Jackson wrote:
> Hans wrote:
> > We create filename/pseudos/backup, and that tells the archiver what =20
> > to do.....
>=20
> Instead of exposing the old semantics under a new interface, why not
> expose the new semantics under a new interface.

Here's another take on the same theme.  To see attrs on files, one can =20
either use a newly developed application which can use special new =20
syscalls/flags on syscalls a Paul Jackson recommends.  However from an =20
old shell or application one can also open the attribute node on
/home/myself/foo.txt by checking out /attr/home/myself/foo.txt/, which =20
points to the "as directory" node on the filesystem that foo.txt points =20
to.

The strange part of this idea is that the /attr filesystem wouldn't be =20
conventionally browsable.  An opendir() on any path would return the =20
attributes, not the subdirectory contents, even if the target was a =20
conventional directory.  File based operations (open(), unlink(), etc) =20
would operate on the "as directory" node of the dirname() of the file =20
argument.  The /attr filesystem would be completely virtual, honoring =20
the permissions, crossing filesystems, and inheriting the root =20
directory of the calling process.

Just a thought from a Linux fs layman -- certainly one of the Reiser =20
unwashed masses.

--
Paul


