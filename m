From: "Burnes, James" <james.burnes@gwl.com>
Subject: Chris/Jeff/Reiserfs ACL/xattr squabble not necessary
Date: Thu, 29 Apr 2004 10:53:32 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469EE5@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18290-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

Maybe what is needed is an interim v3 release, meant to bridge the
current VFS acl semantics with future VFS *innovations*.  In other words
to take people who wisely chose v3 instead of ext2/etc and allow them to
bridge into the future while still embracing the reiser vision.
(reiservision? sounds like a new TV feature.  "Linux!  Now enhanced with
ReiserVision (tm) ;-)

Ahem, sorry.  I don't know what the future VFS plans are, but an
object-oriented filesystem extension in VFS and Reiser4 would be a match
made in heaven.  In other words, don't get bogged down in the VFS
semantics squabble.  Leap frog the entire discussion and go for the
whole enchilada.  OO fs in VFS.

Excuse my ignorance if this has already been planned or discarded as a
silly idea.

jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Christian Mayrhuber [mailto:christian.mayrhuber@gmx.net]
> Sent: Thursday, April 29, 2004 5:35 AM
> To: reiserfs-list@namesys.com
> Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary
> additional namespace to ReiserFS
>=20
> On Wednesday 28 April 2004 14:45, you wrote:
> > On Wed, 2004-04-28 at 05:44, Markus TXrnqvist wrote:
> > > On Wed, Apr 28, 2004 at 10:22:36AM +0200, Christian Mayrhuber
wrote:
> > > >I wonder if Novell/SuSE would take over full Reiserfs3
maintainership
> as
> > > >namesys is now concentrating on the next big step: Reiser4.
> > >
> > > This would be an EXCELLENT idea; something that a SuSEist should
take
> > > seriously if reading this list.
> >
> > SUSE has been a major reiserfs v3 contributor for a long time, in
code,
> > testing and userbase.  My goal here is not to change our working
> > relationship with namesys, only to convince Hans that he needs to
> > rethink the way v3 has been maintained.
> Good Luck!
> Hans seems to fear xattrs like the devil fears holy water.
>=20
> The additional unnecessary namespace is not needed by users, but acl's
> are - at least for the ones operating a samba server.
>=20
> The Reiserfs stabilization process lasted till midlife of 2.4. With
that
> experience in mind Reiser4 will be a NO-NO for server usage till
kernel
> 2.8.1x. If there are no acl's available for Reiserfs its server users
will
> turn their tide towards a fs that has data=3Dordered + acl support.
> The only linux filesystem that has both features is ext3.
> I prefer reiserfs over ext3 for server usage, mostly because it can do
> online
> growing which is  a valueable feature in the combination with lvm. The
> only
> other linux filesystem able to do that is xfs.
> Data integrity trough data=3Dordered + acl's + online growing would =
make
> Reiserfs the best enterprise fs available for Linux, at least until
> Reiser4
> is stable enough.
>=20
> Due to the great work of Namesys and SuSE engineers Reiserfs has
developed
> that far, denying features that make sense and that are an
implementation
> of
> an accepted interface in the linux vfs layer, is just sad.
>=20
> --
> lg, Chris

