From: David Masover <ninja@slaphack.com>
Subject: Re: Mask moderation policy
Date: Sun, 10 Apr 2005 17:21:16 -0500
Message-ID: <4259A6DC.3080206@slaphack.com>
References: <4254E668.40300@namesys.com> <42558937.8000906@namesys.com> <4255E152.3060808@namesys.com> <4257154F.7010700@slaphack.com> <20050409072957.GG1399@nysv.org> <42595FE2.8040003@slaphack.com> <20050410202153.GH1399@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23838-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050410202153.GH1399@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Nate Diller <ndiller@namesys.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Markus T=F6rnqvist wrote:
> On Sun, Apr 10, 2005 at 12:18:26PM -0500, David Masover wrote:
>=20
> This email goes un-proof-read, I'm too far asleep now :)
>=20
>=20
>>/usr/sbin/gpm.mask/dev/input/mouse0 allows it, and bash denies it.
>>
>>Basically, a deny takes precedence.  If something isn't explicitly
>>allowed somewhere, it's denied.  What I'm saying is that it should be
>>possible to explicitly allow '*', and then explicitly deny things that
>>you don't want.
>=20
>=20
> What about still skipping file parsing:
> # Every group is denied, as they and users are by default (?)
> $ mkdir -p /bin/bash.mask/dev/input/mouse0/group_deny/
>=20
> # Every user is allowed (Big-ass contradiction, but users apply still her=
e)
> $ mkdir /bin/bash.mask/dev/input/mouse0/user_allow/
# I'd make it
$ touch /bin/bash.mask/dev/input/mouse0/.../user_allow/all


I'm accepting the bash.mask, though that should really be bash/.../mask,
but suppose a program wants to allow its group (say gpm wants to allow
mouse) regardless of what the policy is (allow-by-default or
deny-by-default).  If an empty user_allow is allow-by-default, the
program will inadvertently change it to deny-by-default, while what it
wanted to do was add a redundant allow.

That's the logic behind my next comment:

> # Only mjt is allowed (Cutting down on the contradiction ;)
> $ touch /bin/bash.mask/dev/input/mouse0/user_allow/mjt=20

No, that shouldn't be it.  That should specify that user mjt is allowed.
 If you want ONLY mjt to be allowed, you should have to
$ touch /bin/bash.mask/dev/input/mouse0/.../user_deny/all

If you want, replace "all" with something that's not likely to be a
username, or isn't an alowed username.  Usernames probably aren't
allowed to have colons in them, for example.  I think "all" is fine.

> This example is a bit fishy, as it's so closely tied to the end-user;

Not just because of that.  You don't seem to have the inheritance
spelled out clearly there.  For instance, user should be more specific
than group -- it should be possible to explicitly deny group "users",
and then explicitly allow group "mjt".

> What does Namesys think; Should it be strictly per-process? Is any of this
> user/group stuff here even remotely wanted?

More importantly, does Namesys have a better way of achieving the same
effect with only per-process views?

There's no question whether it's wanted.  I'm a user, and I want it.
It's a good feature, and it logically makes sense.  But we've been
hacking pseudocode for less than a day on this.  Maybe Namesys has some
better design ideas?

>>That's to maintain sanity when you don't have the entire distro cooperati=
ng.
>=20
> Or on any desktop. I think it's a lot easier always to enable everything
> by default and then deny.

Actually, I find it's easier to deny-by-default for some things.  I
don't run everything as root.  It'd take forever to enumerate all the
things I'd want to deny myself as a user, vs. occasionally allowing
something via sudo or chmod.

But, it's equally as difficult to figure out every single thing a given
binary needs to see (unless you already know), vs. finding something you
want to keep from that particular binary, or to hide from everyone.

> So just for each binary you create the mask directories (later a reiser4
> meta entries) group_allow and user_allow, then explicitly create
> group_deny and user_deny to return priority to the denys and only then
> start slamming in things like=20
> /usr/sbin/apache2.mask/etc/passwd/user_deny/www-data
>=20
> But I'm tired and have the flu so I may not be thinking straight.

apache2.mask should allow some things, actually.  Also, maybe
/etc/passwd contains a file called user_deny.  Best to be unambiguous.

Does apache2 drop permissions later?  Is that the point of this, that
Apache needs to see passwd until it drops permissions?

>>What I mean is, there should be an option to deny-by-default or
>>allow-by-default.  If we're doing this on the user, for instance:
>=20
>=20
> I like that.
> What do you think of my idea to make allow-by-default allowable with
> an mkdir? That seems to me like an easy way to avoid the issue.
>=20
> $ mkdir -p /bin/bash.mask/user_allow/ # everyone sees everything through =
bash.
>=20
>=20
>>echo policy allow > /etc/passwd/.../ninja/mask
>=20
>=20
> What does this line exactly do? :P

I'm thinking that this /etc/passwd/.../ninja/mask is an ACL file
controlling a global mask for user ninja.  Basically, ninja is allowed
by default.  This applies to any binary running under user ninja,
because it's set in /etc/passwd, which seemed the logical place to set
global options for unix-like users.

Actually, now that I think of it, I should probably do:

echo allow ninja > /.../mask

This allows ninja access to anything in /, provided that a specific
program or subdirectory/file doesn't override that.

>>echo policy deny > /home/samurai/.../mask
>>echo allow samurai >> /home/samurai/.../mask
>=20
>=20
> For which process is this? Bash still? looks a bit more like generically
> ACL'ing the current security model...

Yes, only it's actually hiding the existance of the directory.  It also
allows bash to override that.  So, for example, suppose you've got a
database server -- let's say mysql -- with databases in /var/lib/mysql.
 In order to prevent people from screwing with mysql data, or attemting
to back it up in an inconsistent state, we do this:

##I'm using a new notation now.  Watch out for buggy pseudocode.
##Since we're creating a file, this denies everything, and programs
##can't accidentally change the policy by touching something inside.
$ touch /usr/bin/mysql/.../mask/deny
##Allow /var/lib/mysql to user mysql, since we're deny-by-default
$ mkdir -p /usr/bin/mysql/.../mask/allow_user/mysql/var/lib/mysql

I'm putting the allow_user bit in front of the path, because that way
the path can contain any wierd names in in that we like.  For example,
we could allow deal with paths like "/backup/mysql_mask/allow_user"...
With that scheme, the only path we can't deal with is ".", "..", or "..."

Now, every time mysql starts up, it does this:

$ touch /var/lib/mysql/.../mask/deny

And every time it shuts down properly, it does this:

$ rm /var/lib/mysql/.../mask/deny

This effectively blocks all binaries, users, and groups from accessing
/var/lib/mysql when mysql is running, unless they are the /usr/bin/mysql
binary, running as user mysql, or if they are /bin/bash (or spawned by
/bin/bash), running as root.

>>What I'm not sure about is how to bring back a true root shell.  In the
>>above example, the third command would fail, because /home/samurai would
>>be invisible to everyone (policy deny) and so no one would be able to
>>set its mask.
>=20
>=20
> Haa! Yes! And giving root immunity in this is a very nasty idea, as many
> exploits in servers work through the root user.

And many system administrators work through the root user.  You
demonstrate that below:

> I'm too tired to think of any workaround now :P

I did, see below:

>>Maybe a "god" flag of some sort?
>>echo god root > /bin/bash/.../mask
>=20
>=20
> The "nikita" flag, god@laputa ;)
>=20
>=20
>>So that when root runs bash, it and any programs launched by it are able
>>to view all files.  Sometimes that's not what you want, so you add a
>>program which drops "god" status.  For example:
>=20
>=20
> What if it were the other way around?
>=20
> (Above example stubbornly rewritten to my syntax and bash)
>=20
> This is by default as well, but let's play for a while that we allowed
> someone and did this and then started a new bash after this command.
> $ mkdir /bin/bash.mask/user_deny/home/samurai

Already wrong.  My syntax would deny ALL programs, and ALL users, unless
specifically allowed.

> $ /bin/bash
> bash: could not chdir to $HOME, using / instead
> $ mkdir /bin/bash.mask/user_allow/samurai/home/samurai/
> mkdir: cannot create directory /bin/bash.mask/user_allow/samurai/home/sam=
urai:
> No such file or directory
>=20
> Oh dear!
>=20
> We can't go home and we can't set the mask either.
> One really really really important question here is,
> WHAT THE HELL KIND OF A RIGHT DOES THE USER HAVE TO GROPE AT A SYSTEM
> BINARY'S INTERNALS IN THE FIRST PLACE?!

The user is setting permissions on something they own.  That should be
on /home/samurai.mask, not /bin/bash.mask.  Samurai should be able to
block people from /home/samurai, to keep out us ninjas.  But if us
ninjas are too good for him -- one of us has a root account -- we should
be able to allow ourselves back in.

bash# touch /home/samurai/.../mask/user_allow/ninja

> This is too much for me, let's get back on this some other day.
> A case like this should not arise in any case.

Yes it should.  Look at the mysql example above.  It's reasonable to say
that only the mysql binary should be allowed to access /var/lib/mysql,
but root should be able to override that.  If mysql refuses to die, a
kill -9 will very likely not reverse the mask, and you'd have to use a
bootdisk of some sort, just to change a permission.

That's why there is a root user in the first place.

>>$ ls /home/samurai
>>bin maildir
>>$ incarnate ls /home/samurai
>>ls: /home/samurai: No such file or directory
>>$ ls /home/samurai
>>bin maildir
>=20
>=20
> In this case is incarnate a userspace program, a kernel interpretation
> in execsomething() or a shell alias or what?

All of the above.  Basically, we're assuming that if a program 'exec's
another program, the new program doesn't inherit any "allow"s.  So,
under normal circumstances, if we give bash a god flag, it only applies
to bash builtins

# echo /home/samurai/*
bin maildir
# ls /home/samurai
ls: /home/samurai: No such file or directory

Since the vast majority of commands run from a root prompt are simple
Unix-y things like ls, I'm saying that the god flag should pass from
parent process to child process unless the parent process explicitly
forbids it.

To make this simpler, I'm saying that incarnate should be a program
which launches another program (given to it in arguments), but forbids
it from having the god flag.  It would probably also be a bash builtin.

Actually, now that I think of it, it makes much more sense to make root
entirely immune to masks, and to have distros be rearranged such that
there is an administrative user who gets almost all the permissions that
root does.  Alternatively, we could make a super-root user (uid -1?)
which is allowed to do everything root does, plus bypass the masks.

In any case, saying that "most unix exploits are through root" doesn't
imply that root is a bad thing.  If they don't get you with root,
they'll get you with the kernel.  IMHO, it's far better to prevent them
from getting root -- have more things run as users with restrictive view
masks on -- than to limit root and thus limit your own effectiveness.

> What about having it the other way around?
> The root user can say:
> $ ls /home/samurai
> ls: /home/samurai: No such file or directory
> $ omnipotent ls /home/samurai
> bin maildir pr0n
>=20
> And that's it. But how do we protect omnipotent here?

Can't.  You could prevent it from being run by anyone but root, but
that's not really much better.

>>Corrupt lines return an error.  It might be a wierd error (I/O or
>>out-of-space,  for instance), but it'd be an error.  That's also how you
>=20
>=20
> Maybe 666 Corrupt line?
> It really sucks to return an error that's "close enough maybe if you
> know what I mean"

True, but sometimes you have to if the interface is limited.  Suppose
can't do something like the above, maybe because we can only return an
error code up to 256, maybe because all the codes are spoken for, or
maybe because we'll be torn to deaths by conservatives for using the
number of the beast.  If we can't use a good error code, it's better to
just have some kind of fatal error (so the program doesn't think it
worked) and tell users to look at dmesg.

>>prevent users who own a file from making it invisible to root, which is
>>annoying even with the god flag.
>=20
>=20
> So, uhh, a corrupt line hides everything from root?
> Even in your incarnate scheme I don't see how this is, sorry.

No, a corrupt line fails AS YOU ADD IT, because ultimately this would be
done via meta-files.  It'd look and feel like a normal file, but as soon
as you try to write a syntax error to the file, you get an IO error or
something.

With the incarnate scheme, users can hide their files from everyone else
by setting file-specific but exe-generic masks.  But masks don't apply
to a root bash prompt.  If root wants to launch a server or see what it
looks like to not be god, they use "incarnate", but if they don't use
that command, then the masks get completely ignored, even if they are
somehow corrupt.

>>Missing users is the same thing.  Once it gets parsed, we can turn it
>>into a UID anyway.  We could even link every acl that lists a user to
>=20
>=20
> Bad user, ret =3D -1, -1 !=3D current_uid
> And there we have it. woohoo \:D/

Again, not a problem with meta-files.  You get the same kind of error,
but you don't get it when the file is accessed, but rather when its mask
is set.

>>the /etc/passwd file somehow (in metadata, automatically) so that when
>>we remove a user, we can easily delete all acls which mention them.
>=20
>=20
> That's actually not so bad an idea.
>=20
> But this I believe is something where a directory-based scheme is
> easier. What if we have a UserObject and a DirectoryObject that
> were .. err.. cast or something, inexchangeably?
>=20
> Might still lead to some weird problems for a later time, but possible
> better than compiling ACL's. Maybe. But ACL's are greppable with ease.
> I dunno.

I like the directory scheme.  I'm beginning to think that ACLs should
just be a frontend to that -- in the same way that passwd could be a
frontend to a bunch of files.

>>>if (!S_ISDIR(dentry->d_inode->i_mode)) is a lot lighter than the acl
>>>parsing..
>>
>>Only has to be done while it's set, and it could concievably be done in
>>userspace (perl, anyone?).  We're talking about the initial parsing,
>=20
>=20
> The acl parsing? But how would the kernel remove that perl's result
> from readdir() or somesuch?

say what?

## I mean, this:
$ acl=3D"policy such and such\nmore acl voodoo"
$ echo -e "$acl" > /some/where/.../mask_acl
## should do the same thing as this:
$ echo -e "$acl" | ./make_acl.pl /some/where

That is, unless I'm modifying a mask, perl isn't being run by the
kernel.  Now, what's that about readdir?

>>right?  It could be optimized, but are people really going to be
>>changing their mask acl's 100 times a second?
>=20
>=20
> This is also correct.
>=20
> So, which is lighter? Once caching all ACL's into memory and keeping them
> there or doing more S_ISDIR lookups?
> I'd almost tend to agree with you, but I don't really like that idea :)
>=20
> What about memory reservation? Some people claim Reiser4 is already
> a bit too cpu-intense, what if it becomes memory-intense as well?

It's not going to be memory-intensive, except when we want to change the
masks.  That's like saying that setacl or vim or mkdir are too
memory/cpu-intensive.  NO ONE'S GOING TO CARE if they actually
understand it.  Of course, if they misunderstand, they will think we're
bloated, so we'd better write good docs ;)

>>Also, I'm not opposed to doing this all with files/dirs, if you can find
>>a good, clean way to do so.  It's worth wasting a few CPU clock cycles
>>and sparing a few end-user brain cycles.
>=20
>=20
> I think you mean "we", and not just the two of us ;)
> The same goes for text file parsing and syntax ;)

Text file syntax can be as simple as I said -- three possible commands,
each takes one argument.  Or three variables, if you like.

Either way, it's a tiny Perl script to take my text files and make them
into your directories.  And it probably takes very little time to do the
S_ISDIR lookups (or maybe something that ends in EXISTS?) vs caching in
RAM, but I wouldn't know.

I know reiser4 theory, not source code, though that will change soon, I
think.  I'm thinking that I should do the offline resizer.  Right now,
we can't even expand reiser4 filesystems.  This is a bug.  And shrinking
them is theoretically simple enough that I'm foolish enough to take it
on over the summer.

> Hope this catches someone's interest, I'd hate for this idea-bouncing
> to be between the two of us and later buried.

Archived, I hope.  But maybe we should be a little less verbose?

As someone once said, "I wrote you a long paper because I didn't have
time to write you a short one."

> Nate? Zam? Hans? Anyone?

It's a weekend.  Have some patience.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQlmm3HgHNmZLgCUhAQJ59w/+IrdgC0Ia1es7yvRGYwuMIASYi6Feu5V8
ax5xQdoOAlxMz+q72AjZoCHDBIeRKa/XW+4y35uUozuIazapUQk4yKFH+ZOe6zYN
mUVRtNxoyqda6X87PC4mltJqNCp9jV7DOHEcPJetoMJ/9sWScqvkYBDgoBcJnjp2
kkyMMgr8nxCBYLvMiF8VarQcy4MeRlIOP6vl1RU96pFOcB3/jbSsVyKEz5KD6zvM
9Nad4qpvrTubTOEAMT4fGx7BtpmvykaN0l+RIXHT+Dei0vWX4PxjVpk5Vy0ISgI9
VTv5esju++O+CanPBrdmWmK6W+OVMbS6bUMMg0omILntJuSofBuBuXEeG882Vs0e
zYIOooIDRGPcE7vUmd4uQVYCn08Jvu3/M2gEHtcLD3tGMAGd2Qpy8Y6Mglju6gUB
nuNWp+Yek2Bs43EW+yeTQgWMpO3LiBX8DVv3orPRM/XLCazM15EYMR/K4yoCD4C/
L1mnRcLem4KXzusr3iEsmswKuzG6OQbyYDnY8hcpUOqqR8ewFOJ9Im4l3+M2XUCS
zN92933GEbX5dhhWFY1Bg1NctlTep76fed+wrdXZZw6pXs66pN8uXyLvAmHnLo8u
IB3bGU85Y5giJq17WhLfRJnFCw4nIC0BkomPJl+vo/8nl7JYuo5cyci13tHytqIv
a85hluQ1yc0=3D
=3DMDWn
-----END PGP SIGNATURE-----
