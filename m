From: Nate Diller <ndiller@namesys.com>
Subject: Re: Mask moderation policy
Date: Sun, 10 Apr 2005 14:43:38 -0700
Message-ID: <42599E0A.6000907@namesys.com>
References: <4254E668.40300@namesys.com> <42558937.8000906@namesys.com>
 <4255E152.3060808@namesys.com> <4257154F.7010700@slaphack.com>
 <20050409072957.GG1399@nysv.org> <42595FE2.8040003@slaphack.com>
 <20050410202153.GH1399@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23837-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20050410202153.GH1399@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: David Masover <ninja@slaphack.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

heh, I guess moderation policy discussions are less interesting than=20
arguing over semantic interfaces :)

Markus T=F6rnqvist wrote:

>On Sun, Apr 10, 2005 at 12:18:26PM -0500, David Masover wrote:
>
>This email goes un-proof-read, I'm too far asleep now :)
>
> =20
>
>>/usr/sbin/gpm.mask/dev/input/mouse0 allows it, and bash denies it.
>>
>>Basically, a deny takes precedence.  If something isn't explicitly
>>allowed somewhere, it's denied.  What I'm saying is that it should be
>>possible to explicitly allow '*', and then explicitly deny things that
>>you don't want.
>>   =20
>>
>
>What about still skipping file parsing:
># Every group is denied, as they and users are by default (?)
>$ mkdir -p /bin/bash.mask/dev/input/mouse0/group_deny/
>
># Every user is allowed (Big-ass contradiction, but users apply still here)
>$ mkdir /bin/bash.mask/dev/input/mouse0/user_allow/
>
># Only mjt is allowed (Cutting down on the contradiction ;)
>$ touch /bin/bash.mask/dev/input/mouse0/user_allow/mjt=20
>
>Then we want gpm to see the device, _as long as it's run with group mouse_:
># Ensure this is possible at all
>$ mkdir -p /usr/sbin/gpm.mask/dev/input/mouse0/group_allow
>
># And then constraint gpm runs as group mouse:
>$ touch /usr/sbin/gpm.mask/dev/input/mouse0/group_allow/mouse
>
>This example is a bit fishy, as it's so closely tied to the end-user;
>the mjt user will use the mouse regardless of what, because his box
>boots up, starts gpm, with the mouse group, and can access the mouse
>device via all this.
>
>What does Namesys think; Should it be strictly per-process? Is any of this
>user/group stuff here even remotely wanted?
>
> =20
>
>>That's to maintain sanity when you don't have the entire distro cooperati=
ng.
>>   =20
>>
>
>Or on any desktop. I think it's a lot easier always to enable everything
>by default and then deny.
>
>So just for each binary you create the mask directories (later a reiser4
>meta entries) group_allow and user_allow, then explicitly create
>group_deny and user_deny to return priority to the denys and only then
>start slamming in things like=20
>/usr/sbin/apache2.mask/etc/passwd/user_deny/www-data
>
>But I'm tired and have the flu so I may not be thinking straight.
>
>In fact, this should be a bit more like it is now..
>At the moment a file means total fallthrough, a directory represents a fil=
e.
>
>/path/to/exe.mask/[mask_mode]/(optional_specification)/masked/path/
>
>In that scheme=20
>/masked/path/foo/bar
>/masked/path/AAAAA/BBBB
>and friends would adhere to whatever mask_mode (eg. allow_user)
>and optional_specification (ninja) are set to.
>
>/path/to/exe.mask/user_allow/ninja/masked/path/
>
>/masked/path would then not be visible to mjt, as it's denied by default
>and he could be given access to /masked/path/AAAAA/ by branching the
>mask tree off at exe.mask/user_allow.
>
>/path/to/exe.mask/user_allow/mjt/masked/path/AAAAA
>
>Thank god this is only used for a few pieces of software, most of this
>is pretty much like the basic security model we already have :)
>
> =20
>
And you've just answered your earlier question.  This model is useful=20
only to the degree that it acts independent of the userID priveleges of=20
the process, since there is already a mechanism for discriminating based=20
on user/group.  The key to masking's usefulness is that you can't gain=20
root to get around it.

That said, a full-fledged implementation of views would surely have to=20
take some user-specific data into account, but it remains to be seen how=20
the interface for this should be constructed.  A reasonable=20
implementation might use environment variables for user-specific views,=20
adding flexibility for the user.  Regardless, there is no reason to=20
think that such a feature should be used for per-user security, since=20
the user can simply execute their own copy of any program to get around=20
such restrictions by the administrator on the 'official' binary.

>>What I mean is, there should be an option to deny-by-default or
>>allow-by-default.  If we're doing this on the user, for instance:
>>   =20
>>
>
>I like that.
>What do you think of my idea to make allow-by-default allowable with
>an mkdir? That seems to me like an easy way to avoid the issue.
>
>$ mkdir -p /bin/bash.mask/user_allow/ # everyone sees everything through b=
ash.
>
> =20
>
>>echo policy allow > /etc/passwd/.../ninja/mask
>>   =20
>>
>
>What does this line exactly do? :P
>
> =20
>
>>echo policy deny > /home/samurai/.../mask
>>echo allow samurai >> /home/samurai/.../mask
>>   =20
>>
>
>For which process is this? Bash still? looks a bit more like generically
>ACL'ing the current security model...
>
> =20
>
>>In the second example, ninja is denied from /home/samurai because the
>>/home/samurai mask is more specific, and they are both policies.  In
>>general, the more specific restrictions win, and all others being equal,
>>"deny" wins.
>>   =20
>>
>
>This is true, this is how it should be.
>Let's get back later in the message on text file parsing :>
>
> =20
>
>>What I'm not sure about is how to bring back a true root shell.  In the
>>above example, the third command would fail, because /home/samurai would
>>be invisible to everyone (policy deny) and so no one would be able to
>>set its mask.
>>   =20
>>
>
>Haa! Yes! And giving root immunity in this is a very nasty idea, as many
>exploits in servers work through the root user.
>
>I'm too tired to think of any workaround now :P
>
> =20
>
>>Maybe a "god" flag of some sort?
>>echo god root > /bin/bash/.../mask
>>   =20
>>
>
>The "nikita" flag, god@laputa ;)
>
> =20
>
The way around this problem is simple.  If the super-user has created a=20
mask for, say, the init process, there would be no way to access the=20
denied paths while the system is running, or to delete the mask.  So=20
simply boot a kernel without masking support.  (We could add a boot flag=20
I suppose, but that's a low priority to me)

>>So that when root runs bash, it and any programs launched by it are able
>>to view all files.  Sometimes that's not what you want, so you add a
>>program which drops "god" status.  For example:
>>   =20
>>
>
>What if it were the other way around?
>
>(Above example stubbornly rewritten to my syntax and bash)
>
>This is by default as well, but let's play for a while that we allowed
>someone and did this and then started a new bash after this command.
>$ mkdir /bin/bash.mask/user_deny/home/samurai
>$ /bin/bash
>bash: could not chdir to $HOME, using / instead
>$ mkdir /bin/bash.mask/user_allow/samurai/home/samurai/
>mkdir: cannot create directory /bin/bash.mask/user_allow/samurai/home/samu=
rai:
>No such file or directory
>
>Oh dear!
>
>We can't go home and we can't set the mask either.
>One really really really important question here is,
>WHAT THE HELL KIND OF A RIGHT DOES THE USER HAVE TO GROPE AT A SYSTEM
>BINARY'S INTERNALS IN THE FIRST PLACE?!
>
>He sees in /bin/bash.mask/ _only the files /bin/bash.mask allows_?
>
>This is too much for me, let's get back on this some other day.
>A case like this should not arise in any case.
>
> =20
>
>>$ ls /home/samurai
>>bin maildir
>>$ incarnate ls /home/samurai
>>ls: /home/samurai: No such file or directory
>>$ ls /home/samurai
>>bin maildir
>>   =20
>>
>
>In this case is incarnate a userspace program, a kernel interpretation
>in execsomething() or a shell alias or what?
>
>What about having it the other way around?
>The root user can say:
>$ ls /home/samurai
>ls: /home/samurai: No such file or directory
>$ omnipotent ls /home/samurai
>bin maildir pr0n
>
>And that's it. But how do we protect omnipotent here?
>
> =20
>
>>Corrupt lines return an error.  It might be a wierd error (I/O or
>>out-of-space,  for instance), but it'd be an error.  That's also how you
>>   =20
>>
>
>Maybe 666 Corrupt line?
>It really sucks to return an error that's "close enough maybe if you
>know what I mean"
>
> =20
>
>>prevent users who own a file from making it invisible to root, which is
>>annoying even with the god flag.
>>   =20
>>
>
>So, uhh, a corrupt line hides everything from root?
>Even in your incarnate scheme I don't see how this is, sorry.
>
> =20
>
>>Missing users is the same thing.  Once it gets parsed, we can turn it
>>into a UID anyway.  We could even link every acl that lists a user to
>>   =20
>>
>
>Bad user, ret =3D -1, -1 !=3D current_uid
>And there we have it. woohoo \:D/
>
> =20
>
>>the /etc/passwd file somehow (in metadata, automatically) so that when
>>we remove a user, we can easily delete all acls which mention them.
>>   =20
>>
>
>That's actually not so bad an idea.
>
>But this I believe is something where a directory-based scheme is
>easier. What if we have a UserObject and a DirectoryObject that
>were .. err.. cast or something, inexchangeably?
>
>Might still lead to some weird problems for a later time, but possible
>better than compiling ACL's. Maybe. But ACL's are greppable with ease.
>I dunno.
>
> =20
>
>>>if (!S_ISDIR(dentry->d_inode->i_mode)) is a lot lighter than the acl
>>>parsing..
>>>     =20
>>>
>>Only has to be done while it's set, and it could concievably be done in
>>userspace (perl, anyone?).  We're talking about the initial parsing,
>>   =20
>>
>
>The acl parsing? But how would the kernel remove that perl's result
>from readdir() or somesuch?
>
> =20
>
>>right?  It could be optimized, but are people really going to be
>>changing their mask acl's 100 times a second?
>>   =20
>>
>
>This is also correct.
>
>So, which is lighter? Once caching all ACL's into memory and keeping them
>there or doing more S_ISDIR lookups?
>I'd almost tend to agree with you, but I don't really like that idea :)
>
>What about memory reservation? Some people claim Reiser4 is already
>a bit too cpu-intense, what if it becomes memory-intense as well?
>
> =20
>
>>Also, I'm not opposed to doing this all with files/dirs, if you can find
>>a good, clean way to do so.  It's worth wasting a few CPU clock cycles
>>and sparing a few end-user brain cycles.
>>   =20
>>
>
>I think you mean "we", and not just the two of us ;)
>The same goes for text file parsing and syntax ;)
>
>Hope this catches someone's interest, I'd hate for this idea-bouncing
>to be between the two of us and later buried.
>
>Nate? Zam? Hans? Anyone?
>
>Thanks!
> =20
>
A glimpse into my ideas for improving the granularity, then...

As mentioned in namesys.com/security_mask.html, the original intention=20
for the mask's root directory was the executable itself, in its Reiser4=20
metas directory.  There were two difficulties with this approach, which=20
caused us to settle for the ugly [exe].something hack.  First,=20
file/directory duality needs changes to the dentry code to exist without=20
fatal bugs, and second, creating and deleting normal files and=20
directories is not currently supported in Reiser4 metas (I found this=20
out the hard way: disable a few assertions and you can create some real=20
wierdness with touch/mkdir in metas).

Fixing these two problems is on the agenda, although I cannot speculate=20
where they fall in Hans' list of priorities.  Once duality is up and=20
running, the plan was to have more information about a mask node in its=20
file section, so that each component of a path in the mask can be more=20
specific about what it allows/denies.  As in:

mkdir -p bash.mask/home/nate/
echo 'deny */.*' > bash.mask/home

to prevent access to ~/.bashrc et al.  Don't consider this specific=20
functionality to be anything but a quickly composed example, since it is=20
likely that denials will have their own tree, as in

touch bash.allow/home/nate
touch bash.deny/home/nate/private

or something.  But that's the general idea, allow finer granularity by=20
specifying it within the mask directory's component data streams.

NATE
