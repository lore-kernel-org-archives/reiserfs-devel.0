From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: hashes in reiser3.6
Date: Thu, 25 Nov 2004 12:03:27 +0300
Message-ID: <1101373407.1628.17.camel@tribesman.namesys.com>
References: <2f4958ff041118114530134bff@mail.gmail.com>
	 <419D031D.9050807@novell.com>  <2f4958ff04112015003b0bca9e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff04112015003b0bca9e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grzegorz =?iso-8859-2?Q?Ja=B6kiewicz?= <gryzman@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello

On Sun, 2004-11-21 at 02:00, Grzegorz Ja=B6kiewicz wrote:
> On Thu, 18 Nov 2004 15:16:29 -0500, Jeff Mahoney <jeffm@novell.com> wrote:
>=20
> > If the filesystem is already established, you can't switch hashes. The
> > hash is global to the filesystem, so if you were to change it, lookups
> > would fail and you wouldn't be able to find any of your files.
> >
> > If you're creating a new filesystem, you can use the --hash argument to
> > mkreiserfs. Under most circumstances, the filesystem code will
> > automatically discover which hash you're using at mount time.
>=20
> Thanks, but the trick is that I would like to switch over existing
> partition to other hash.
> I know, I can copy over all data on side, and recreate partition from
> scratch, but it's just way too painfull. It should be possible to do
> this in much easier way.
> So you say, that reiserfs doesn't store filenames in strucures, but
> uses just hashes to lookup ? Shouldn't it be possible to go through
> all structures on the partition, and recreate hashes, but using
> different key function ?
> I am prepared to spend some time,and do this.


I am afraid you will have to create a special tool to do this trick.
If such tool does not exist  - it is much easier to rehash using spare
partition.

