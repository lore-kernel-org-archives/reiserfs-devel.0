From: David Masover <ninja@slaphack.com>
Subject: Re: Mask moderation policy
Date: Sun, 10 Apr 2005 12:18:26 -0500
Message-ID: <42595FE2.8040003@slaphack.com>
References: <4254E668.40300@namesys.com> <42558937.8000906@namesys.com> <4255E152.3060808@namesys.com> <4257154F.7010700@slaphack.com> <20050409072957.GG1399@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050409072957.GG1399@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Nate Diller <ndiller@namesys.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Markus T=F6rnqvist wrote:
> On Fri, Apr 08, 2005 at 06:35:43PM -0500, David Masover wrote:
>=20
> [i.agree.snip]
>=20
> A bit of philosophizing and thinking out loud ensued:
>=20
>=20
>>Or could this be done in existing security plugins?  Am I correct in
>>thinking that when a file is accessed, the file's security plugin (not
>>the program's) is called?
>=20
>=20
> Wouldn't it be easiest to skip the idea of a file in exe.mask
> as a fallthrough and have everything as directories?
>=20
> $ mkdir -p bash.mask/dev/input/mouse0
> $ # The directory will be visible
> $ cat >> bash.mask/dev/input/acl
>=20
>>allow group all
>>allow user all
>>EOF
>=20
> $ # Then we set an acl of sorts on the mouse device
> $ cat >> bash.mask/dev/input/mouse0/acl <<EOF
>=20
>>deny group all
>>allow group mouse
>>allow user ninja, mjt
>>EOF
>=20
> $ # You have to be in the mouse group and run bash to see /dev/input/mous=
e0
>=20
> But how should it be handled when something runs under bash?
> Should bash deny all and /usr/sbin/gpm.mask/dev/input/mouse0 allow
> the mouse group to access?

/usr/sbin/gpm.mask/dev/input/mouse0 allows it, and bash denies it.

Basically, a deny takes precedence.  If something isn't explicitly
allowed somewhere, it's denied.  What I'm saying is that it should be
possible to explicitly allow '*', and then explicitly deny things that
you don't want.

That's to maintain sanity when you don't have the entire distro cooperating.

> I suppose exclusive masks could also be seen as somewhat redundant, as
> everything is denied by default, so masks could be handled by careful
> per-group and -user allows..

What I mean is, there should be an option to deny-by-default or
allow-by-default.  If we're doing this on the user, for instance:

echo policy allow > /etc/passwd/.../ninja/mask
echo deny > /etc/passwd/.../ninja/mask/home/samurai

This gives ninja access to everything except /home/samurai.  In
practice, it'd probably be more like:

echo policy allow > /etc/passwd/.../ninja/mask
echo policy deny > /home/samurai/.../mask
echo allow samurai >> /home/samurai/.../mask

In the second example, ninja is denied from /home/samurai because the
/home/samurai mask is more specific, and they are both policies.  In
general, the more specific restrictions win, and all others being equal,
"deny" wins.

What I'm not sure about is how to bring back a true root shell.  In the
above example, the third command would fail, because /home/samurai would
be invisible to everyone (policy deny) and so no one would be able to
set its mask.

Maybe a "god" flag of some sort?

echo god root > /bin/bash/.../mask

So that when root runs bash, it and any programs launched by it are able
to view all files.  Sometimes that's not what you want, so you add a
program which drops "god" status.  For example:

$ ls /home/samurai
bin maildir
$ incarnate ls /home/samurai
ls: /home/samurai: No such file or directory
$ ls /home/samurai
bin maildir

(Incarnate is pseudocode.  Call it avatar, call it mortal, whatever.)

> Another issue with this is the amount of text parsing the above example
> has to do. How to handle corrupt lines? Missing users?

Corrupt lines return an error.  It might be a wierd error (I/O or
out-of-space,  for instance), but it'd be an error.  That's also how you
prevent users who own a file from making it invisible to root, which is
annoying even with the god flag.

Missing users is the same thing.  Once it gets parsed, we can turn it
into a UID anyway.  We could even link every acl that lists a user to
the /etc/passwd file somehow (in metadata, automatically) so that when
we remove a user, we can easily delete all acls which mention them.

> if (!S_ISDIR(dentry->d_inode->i_mode)) is a lot lighter than the acl
> parsing..

Only has to be done while it's set, and it could concievably be done in
userspace (perl, anyone?).  We're talking about the initial parsing,
right?  It could be optimized, but are people really going to be
changing their mask acl's 100 times a second?

Also, I'm not opposed to doing this all with files/dirs, if you can find
a good, clean way to do so.  It's worth wasting a few CPU clock cycles
and sparing a few end-user brain cycles.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQllf4ngHNmZLgCUhAQJTjQ/9H3DM1PjmkkfXrDVRrTaXvPSiWuO4z0wI
Kngj8mJSfNlk8rAmlVo9jZ3s5yxwHFkfphnLN4lY4bwNUvqLvbIHaoA42AgqDqEb
RfcOgcJy0RUq9u7g9GaJTHGnbztNKd/bii+r1fyVvGZGVSWavIrqqLYs4m5qaK5Y
JIaZ4HP5KRnK6qiQ2HdeoHKV54mjRyDOBSGnxQiRevWx94vyX1Mur7B4rp6JETeG
vvhPc/Xx3MwMwGXeE1kAa4TmYtDsU4yBMVDV9+QwYcsya5sCAzwXrIrzHC0P393X
SN8ki2Jww8T1gLb9rmtFLCRpTNde9IdWzKamh7DV+3+kigukycRmqxIF+MF3K2ID
F1lcSPJ6T7U2YAfZtNblRLZhxMIlv+KSYtgTNB7SSFkRya/7UCDLZ2R9TXUfwQAb
Edn32zZDcwlVif9BTmNylwgSu81/YgqGEEQBBDgybBYo9Ndjzk8Z0ZfSnzDF3PqB
6G3SB75zJI3KC8HyYFOJODJdQXyG/jovzsHsz1O+oTPIf/HfzCJf0u+qMTabnV4m
XoneFEhMxMdb+JdPo7WMNm3PJH5OxdXVaVljuEBBDkLe3HPSRwHgWz/BIrAshmBo
chKeavUeMgotcytR0YhW9AWe/iUfQt4bGLHGLcBnSl3LCBdnICN+MjRvqbj08Kjs
y1slJ/fVmzk=3D
=3DmiG/
-----END PGP SIGNATURE-----
