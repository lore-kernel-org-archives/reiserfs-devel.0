From: David Masover <jedi@ninja.dynup.net>
Subject: Re: More on Hard Links
Date: Tue, 09 Dec 2003 20:44:53 -0600
Message-ID: <3FD688A5.9070508@ninja.dynup.net>
References: <5450026541-BeMail@cr593174-a> <20031209052107.58404.qmail@web25009.mail.ukl.yahoo.com> <87vfopyghf.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16314-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87vfopyghf.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hubert Chan wrote:

[...]

>Really, it's a compromise.  I look at this situation and say: this is
>why we can't have cross-filesystem hardlinks.  Others may look at it
>and say: I really want cross-filesystem hardlinks, and so this is what
>I will do, which is reasonable, and doesn't completely suck.
>
>  
>

Now, the only question left is, why would someone really want 
cross-filesystem hardlinks?  With the distributed FS stuff, you don't 
need them.  (about that -- hopefully this distributed FS will function 
like RAID?)  On a single machine, the reasons I've heard for having 
separate filesystems are:

1)  speed.  We all know that it sucks to have /tmp on the same partition 
as /usr.  /tmp gets fragmented, /usr should not.  In addition, one can 
place stuff that needs faster access on a faster area of the disk, and 
generally organize things to minimize seeking.
    Solution:  All of this seems so purely mechanical that the FS should 
(eventually) be able to do it by itself.  The advantages of a single 
partition (aside from hardlinks) are that one can know nothing about the 
space requirements of a given directory, and the system will adapt itself.

2)  security.  If /bin (or any system-owned binaries) are on a partiton 
where a user has write access somewhere, that user can hardlink files 
from /bin to their own directory (say /home), so that any security patch 
applied to the original binary will overwrite it, and the user still has 
their broken copy.  If the executable has setuid, the user can now root 
the system, no matter how fanatic the admin is about updates.
    Solution:  Don't let users make hardlinks of files they wouldn't be 
allowed to create in the first place.  For example, I can't create a 
file as a normal user, make it setuid, and make it owned by root.  Short 
of this, I feel confident that at least Gentoo's package management 
software could be modified to automatically truncate every file to zero 
before it's overwritten, thus making any hardlink copies worthless.

3)  sanity.  If /tmp gets filled up, you can't create any more temporary 
files.  If /var get's filled up, for the most part, you can't log.  But 
if you manage to fill up _all_ your disk space, things get dangerous.  
Also, sometimes admins do stupid things like 'rm -rf /', and mounting / 
read-only can help.
    Solution:  Disk quotas, and a plugin that prevents you from doing 
stupid things.  For example, if I can recursively apply permissions to a 
dir, and there's a special permission that makes it impossible to remove 
a file, instead of 'mount / -o remount,ro', I'd just 'echo 1 > 
/..recursive/immutable' (or something).  Of course, now I have to go in 
and set other dirs to rewritable, but we do that in fstab anyway, and 
the nice thing here is, those settings are persistant, even without a 
config file.

4)  easier.  Maybe you have two disks.  Maybe you already have a 
partition set up a certain way.  I can't argue against this, but...
    Solution:  LVM or RAID should help here, if you really need 
hardlinks from between two otherwise physically separated dirs.  If you 
can't afford the slowdown (if any) of something like LVM, you should 
seriously consider how important cross-fs hardlinks are to you -- if 
they aren't important enough to sacrifice some speed, are they important 
enough to pay someone to code (or code yourself)?  (I don't know the 
answer to that.)


Of course, this is just how I'd like it to be.  Right now it's still 
better (at least for me) to have separate hard disks.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9aIqAisZLIF6uqOAQIX/Q//ds2BQA9XxqHA9Ntf8kQyQ6tjEfRrstVc
IZ+dBGgG/XCpizripp1+U4nW9JsLJ/TTrm2PDMC1TfLfen1P7pzgpXFP+Gxs7aTO
Y44M6LkOfAVNA1CoCLVjOaSe4Sm+dGhzZtJym74mNffvyHu163lYDEO5Qrb61HMD
um3DqH3KfXGQXZeboegbtuy1jWKYeRz+CpjLPhu/VH8iHPGNfu/9fCqP9vO3tnbr
gP82dRXM94P/MEP8pr8LmZ7OhD9gahvbO/ZgFQq2RedmpPEZKOMXHEQokWhcMCkh
bHQYK07Vc1lwuoZ4ffXnrNCrm19LGqD2qZE8NR1Yi7oLgprkOhjWZC9e2fzxywyY
QYvq6zAtQ05gmoIOYpLJiBSJzuYGfkLARCahK2BAepowbB624ic51QxGb8dbPFkl
SSDtXhf34u5wHPfGBYTdmIy8N5zmL4GAGUa/kyAqvtfZWTC7JJMGun/gPBup7FHG
WNT9a5ayZh4+9CXoJZxDXkGusARr7obI3DTDEtjyYNBfasn6drjbLzDskjKk6ZiK
yWW2VHfYpvFWMi0nuVlqwz4apmHLtvu3YyNhMV4nYsIMNQl2pf+wBlF7db7dkAu7
jNLgp46ka7PIazmQXXUkds8eYLGgKktv1UrKnTschvZyAKOrkzgwzyDN07K1UT0u
YY7VktA+0Qg=
=Z4ZJ
-----END PGP SIGNATURE-----

