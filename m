From: Miguel <turtle.power@wanadoo.es>
Subject: Re: "df -i" support
Date: Fri, 14 May 2004 17:32:27 +0200
Message-ID: <20040514173227.5b0541b5.turtle.power@wanadoo.es>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
	<1084439945.14090.6209.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084439945.14090.6209.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, 13 May 2004 13:19:06 +0400
Vladimir Saveliev <vs@namesys.com> wrote:

> Hello
>=20
> On Thu, 2004-05-13 at 11:34, Miguel wrote:
> > Hi
> > We have several machines running as MTA's using reiser for the mail
> > queue, we usually check the number of files (well an approximation)
> > using the output of "df -i" command on our monitorization plugins
> > this may be not very acurate but is very fast and didn't affect the
> > MTA's work.
> >=20
> > With reiser the output of df -i is no longer usable,
>=20
> IIRC, reiserfs always reported -1 as a total number of inodes and a
> number of free inodes.
> At whihc kernel it was useable for you?

mmmh seems that my question was not very clear

We are migrating our mtas from ext3 to reiserfs and the monitorization
(a plugin) relies on the output of df -i, this output is very diferent
between those filesystems, because reiserfs always return -1 as a total
number of inodes.

I want to know if there's another command to get similar info from
reiserfs partitions since reiserfs doesn't use/has inodes (I think that
you call this leafs).


IFAIK you implement some kind of trickery related to inodes to make NFS
work in the past, this is correct? You can easily map (virtual)inodes to
whatever internal estructure reiserfs has?.


>=20
> >  we changed this to
> > "find | wc -l" variations but it hurts the performance.
> >=20
> > There's a command to count the number of leafs (that's the name?) of
> > a tree from a reiser partition? or other orientative value?.(we
> > mount with notail)
> >=20
> > Tnx
>=20


--=20
La resistencia es f=FAtil todos ser=E9is asimilados
