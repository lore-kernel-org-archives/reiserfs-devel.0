From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Mask moderation policy
Date: Sat, 9 Apr 2005 10:29:57 +0300
Message-ID: <20050409072957.GG1399@nysv.org>
References: <4254E668.40300@namesys.com> <42558937.8000906@namesys.com> <4255E152.3060808@namesys.com> <4257154F.7010700@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Return-path: <reiserfs-list-return-23823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4257154F.7010700@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Nate Diller <ndiller@namesys.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2005 at 06:35:43PM -0500, David Masover wrote:

[i.agree.snip]

A bit of philosophizing and thinking out loud ensued:

>Or could this be done in existing security plugins?  Am I correct in
>thinking that when a file is accessed, the file's security plugin (not
>the program's) is called?

Wouldn't it be easiest to skip the idea of a file in exe.mask
as a fallthrough and have everything as directories?

$ mkdir -p bash.mask/dev/input/mouse0
$ # The directory will be visible
$ cat >> bash.mask/dev/input/acl
> allow group all
> allow user all
>EOF
$ # Then we set an acl of sorts on the mouse device
$ cat >> bash.mask/dev/input/mouse0/acl <<EOF
>deny group all
>allow group mouse
>allow user ninja, mjt
>EOF
$ # You have to be in the mouse group and run bash to see /dev/input/mouse0

But how should it be handled when something runs under bash?
Should bash deny all and /usr/sbin/gpm.mask/dev/input/mouse0 allow
the mouse group to access?

I suppose exclusive masks could also be seen as somewhat redundant, as
everything is denied by default, so masks could be handled by careful
per-group and -user allows..

Another issue with this is the amount of text parsing the above example
has to do. How to handle corrupt lines? Missing users?
if (!S_ISDIR(dentry->d_inode->i_mode)) is a lot lighter than the acl
parsing..

If this were implemented by extending what we have now; a file means
absolute fallback, a directory absolute visibility and no exclusions,
I believe the following might work.

touch bash.mask/dev/input/mouse0/mouse would allow the mouse group
to see the file. As I have zero experience in kernel code, I have none
to even pseudo here, but just check if "mouse" is a valid group..

This could be extended further with a scheme as follos:
$ find bash.mask/dev/input/mouse/
bash.mask/dev/input/mouse/group/mouse
bash.mask/dev/input/mouse/user/ninja
bash.mask/dev/input/mouse/user/mjt
$

Just two cents or something..

And great work, Namesys guys!

--=20
mjt


--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCV4R1IqNMpVm8OhwRAlOVAJ9VPlR/l66tHb0qIZIrGftLAMC5EACgi+HI
5WLCLLo018Kw7nLoYIA5r+Q=
=a4Y7
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
