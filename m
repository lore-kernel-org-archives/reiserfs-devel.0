From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Mask moderation policy
Date: Sun, 10 Apr 2005 23:21:53 +0300
Message-ID: <20050410202153.GH1399@nysv.org>
References: <4254E668.40300@namesys.com> <42558937.8000906@namesys.com> <4255E152.3060808@namesys.com> <4257154F.7010700@slaphack.com> <20050409072957.GG1399@nysv.org> <42595FE2.8040003@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Return-path: <reiserfs-list-return-23836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42595FE2.8040003@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Nate Diller <ndiller@namesys.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 10, 2005 at 12:18:26PM -0500, David Masover wrote:

This email goes un-proof-read, I'm too far asleep now :)

>/usr/sbin/gpm.mask/dev/input/mouse0 allows it, and bash denies it.
>
>Basically, a deny takes precedence.  If something isn't explicitly
>allowed somewhere, it's denied.  What I'm saying is that it should be
>possible to explicitly allow '*', and then explicitly deny things that
>you don't want.

What about still skipping file parsing:
# Every group is denied, as they and users are by default (?)
$ mkdir -p /bin/bash.mask/dev/input/mouse0/group_deny/

# Every user is allowed (Big-ass contradiction, but users apply still here)
$ mkdir /bin/bash.mask/dev/input/mouse0/user_allow/

# Only mjt is allowed (Cutting down on the contradiction ;)
$ touch /bin/bash.mask/dev/input/mouse0/user_allow/mjt=20

Then we want gpm to see the device, _as long as it's run with group mouse_:
# Ensure this is possible at all
$ mkdir -p /usr/sbin/gpm.mask/dev/input/mouse0/group_allow

# And then constraint gpm runs as group mouse:
$ touch /usr/sbin/gpm.mask/dev/input/mouse0/group_allow/mouse

This example is a bit fishy, as it's so closely tied to the end-user;
the mjt user will use the mouse regardless of what, because his box
boots up, starts gpm, with the mouse group, and can access the mouse
device via all this.

What does Namesys think; Should it be strictly per-process? Is any of this
user/group stuff here even remotely wanted?

>That's to maintain sanity when you don't have the entire distro cooperatin=
g.

Or on any desktop. I think it's a lot easier always to enable everything
by default and then deny.

So just for each binary you create the mask directories (later a reiser4
meta entries) group_allow and user_allow, then explicitly create
group_deny and user_deny to return priority to the denys and only then
start slamming in things like=20
/usr/sbin/apache2.mask/etc/passwd/user_deny/www-data

But I'm tired and have the flu so I may not be thinking straight.

In fact, this should be a bit more like it is now..
At the moment a file means total fallthrough, a directory represents a file.

/path/to/exe.mask/[mask_mode]/(optional_specification)/masked/path/

In that scheme=20
/masked/path/foo/bar
/masked/path/AAAAA/BBBB
and friends would adhere to whatever mask_mode (eg. allow_user)
and optional_specification (ninja) are set to.

/path/to/exe.mask/user_allow/ninja/masked/path/

/masked/path would then not be visible to mjt, as it's denied by default
and he could be given access to /masked/path/AAAAA/ by branching the
mask tree off at exe.mask/user_allow.

/path/to/exe.mask/user_allow/mjt/masked/path/AAAAA

Thank god this is only used for a few pieces of software, most of this
is pretty much like the basic security model we already have :)

>What I mean is, there should be an option to deny-by-default or
>allow-by-default.  If we're doing this on the user, for instance:

I like that.
What do you think of my idea to make allow-by-default allowable with
an mkdir? That seems to me like an easy way to avoid the issue.

$ mkdir -p /bin/bash.mask/user_allow/ # everyone sees everything through ba=
sh.

>echo policy allow > /etc/passwd/.../ninja/mask

What does this line exactly do? :P

>echo policy deny > /home/samurai/.../mask
>echo allow samurai >> /home/samurai/.../mask

For which process is this? Bash still? looks a bit more like generically
ACL'ing the current security model...

>In the second example, ninja is denied from /home/samurai because the
>/home/samurai mask is more specific, and they are both policies.  In
>general, the more specific restrictions win, and all others being equal,
>"deny" wins.

This is true, this is how it should be.
Let's get back later in the message on text file parsing :>

>What I'm not sure about is how to bring back a true root shell.  In the
>above example, the third command would fail, because /home/samurai would
>be invisible to everyone (policy deny) and so no one would be able to
>set its mask.

Haa! Yes! And giving root immunity in this is a very nasty idea, as many
exploits in servers work through the root user.

I'm too tired to think of any workaround now :P

>Maybe a "god" flag of some sort?
>echo god root > /bin/bash/.../mask

The "nikita" flag, god@laputa ;)

>So that when root runs bash, it and any programs launched by it are able
>to view all files.  Sometimes that's not what you want, so you add a
>program which drops "god" status.  For example:

What if it were the other way around?

(Above example stubbornly rewritten to my syntax and bash)

This is by default as well, but let's play for a while that we allowed
someone and did this and then started a new bash after this command.
$ mkdir /bin/bash.mask/user_deny/home/samurai
$ /bin/bash
bash: could not chdir to $HOME, using / instead
$ mkdir /bin/bash.mask/user_allow/samurai/home/samurai/
mkdir: cannot create directory /bin/bash.mask/user_allow/samurai/home/samur=
ai:
No such file or directory

Oh dear!

We can't go home and we can't set the mask either.
One really really really important question here is,
WHAT THE HELL KIND OF A RIGHT DOES THE USER HAVE TO GROPE AT A SYSTEM
BINARY'S INTERNALS IN THE FIRST PLACE?!

He sees in /bin/bash.mask/ _only the files /bin/bash.mask allows_?

This is too much for me, let's get back on this some other day.
A case like this should not arise in any case.

>$ ls /home/samurai
>bin maildir
>$ incarnate ls /home/samurai
>ls: /home/samurai: No such file or directory
>$ ls /home/samurai
>bin maildir

In this case is incarnate a userspace program, a kernel interpretation
in execsomething() or a shell alias or what?

What about having it the other way around?
The root user can say:
$ ls /home/samurai
ls: /home/samurai: No such file or directory
$ omnipotent ls /home/samurai
bin maildir pr0n

And that's it. But how do we protect omnipotent here?

>Corrupt lines return an error.  It might be a wierd error (I/O or
>out-of-space,  for instance), but it'd be an error.  That's also how you

Maybe 666 Corrupt line?
It really sucks to return an error that's "close enough maybe if you
know what I mean"

>prevent users who own a file from making it invisible to root, which is
>annoying even with the god flag.

So, uhh, a corrupt line hides everything from root?
Even in your incarnate scheme I don't see how this is, sorry.

>Missing users is the same thing.  Once it gets parsed, we can turn it
>into a UID anyway.  We could even link every acl that lists a user to

Bad user, ret =3D -1, -1 !=3D current_uid
And there we have it. woohoo \:D/

>the /etc/passwd file somehow (in metadata, automatically) so that when
>we remove a user, we can easily delete all acls which mention them.

That's actually not so bad an idea.

But this I believe is something where a directory-based scheme is
easier. What if we have a UserObject and a DirectoryObject that
were .. err.. cast or something, inexchangeably?

Might still lead to some weird problems for a later time, but possible
better than compiling ACL's. Maybe. But ACL's are greppable with ease.
I dunno.

>> if (!S_ISDIR(dentry->d_inode->i_mode)) is a lot lighter than the acl
>> parsing..
>Only has to be done while it's set, and it could concievably be done in
>userspace (perl, anyone?).  We're talking about the initial parsing,

The acl parsing? But how would the kernel remove that perl's result
=66rom readdir() or somesuch?

>right?  It could be optimized, but are people really going to be
>changing their mask acl's 100 times a second?

This is also correct.

So, which is lighter? Once caching all ACL's into memory and keeping them
there or doing more S_ISDIR lookups?
I'd almost tend to agree with you, but I don't really like that idea :)

What about memory reservation? Some people claim Reiser4 is already
a bit too cpu-intense, what if it becomes memory-intense as well?

>Also, I'm not opposed to doing this all with files/dirs, if you can find
>a good, clean way to do so.  It's worth wasting a few CPU clock cycles
>and sparing a few end-user brain cycles.

I think you mean "we", and not just the two of us ;)
The same goes for text file parsing and syntax ;)

Hope this catches someone's interest, I'd hate for this idea-bouncing
to be between the two of us and later buried.

Nate? Zam? Hans? Anyone?

Thanks!

--=20
mjt


--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCWYrhIqNMpVm8OhwRAoA8AKCuC4wTybJ2fyIbdceN5hHCao2nRwCfeorX
MUtoe92JqjFtCpcE/SM/14s=
=iexP
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
