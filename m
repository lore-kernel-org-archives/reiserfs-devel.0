From: David Masover <ninja@slaphack.com>
Subject: Re: Mask moderation policy
Date: Fri, 08 Apr 2005 18:35:43 -0500
Message-ID: <4257154F.7010700@slaphack.com>
References: <4254E668.40300@namesys.com> <42558937.8000906@namesys.com> <4255E152.3060808@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4255E152.3060808@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nate Diller <ndiller@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nate Diller wrote:
> Hans Reiser wrote:
> 
>> Nate, give them the code, and use the latest text we wrote for the
>> moderation policy guidelines.
>>
>>  
>>
> Ok guys, if you want the patch (and weren't clever/motivated enough to
> find it from the security_mask page source ;), go to
> www.namesys.com/mask/linux-2.6.12-rc1-mm1/maskb6.patch.   'Course no
> warranty, buggy as hell, yada yada...
> 
> The latest version of the moderation document that Hans mentioned is
> attatched.  I call it the God version, because it basically says we
> don't need any input from people like you anyway, we just appoint a
> benevolent dictator instead.  So give us feedback as to which policy is
> better, cause if you pick this version, it's the last input you get
> <laughs maniacally>

Just read http://www.namesys.com/blackbox_security.html

Sorry I'm so late on input, but I've had hell from school and no time to
read Namesys papers until now.

Can't find anything about user-specific masks.

This would be very useful -- the ability to apply a mask to an entire
user, or to apply different masks to the same executable based on which
user called that executable.

It would also be useful to have (the option of) exclusive masks as well
as inclusive masks.  For example, we might want to allow access to
everything in /home except for one specific user, or everything in /dev
except one specific person.

It'd also be nice to have an option of masks which apply to all
executables except one, or all users except one.  For instance, a
chroot'ed environment could be excluded from all programs except
/bin/chroot.

In fact, now that I think about it, the masks should probably be
plugan-ized a bit, such that every time a program tries to access a
file, the filename must be okayed by the mask plugin, then by the file's
own security plugins.  Directory listings may be filtered or denied
(not-found or permission denied) the same way -- program's mask plugin,
then file's security plugin.

Or could this be done in existing security plugins?  Am I correct in
thinking that when a file is accessed, the file's security plugin (not
the program's) is called?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQlcVT3gHNmZLgCUhAQJLhw/+PFjlsLT+QM40EELmcIAgRuAmnjjLWw3S
q6shlPtpE+HZdpyGurzf0leUdPUZStWHlXteV3Hbz2n5NknzmCsQni9D180mJMMj
ommDX2YReeTV4DN9FsfJAxG70zVvINAVj3o3BN1ZcYtWqCYn1jsX88UQzOiX68lK
1elJ4leV6abNf4fRY6m02i9ONu3UvwMQsD2wAqVm3lgxA1H8wJjwgj3alhQ7lmSQ
ZOw6uHKVrppDvxtTbnUxrT//yj23qE886Ja7z7t/NeesNSabp6nTxnD5ME/w5a1U
XV3gLeApAptGJvJ355OGZGQflmYQwuMlnxl0QqJ7luVfhT0c8UIZdY+BbR5tNG2G
QL8guUB/4MhkPLzGzVGMVBtdqtGkA0q0uF/rpKu/Un+ywfnSgynrNfRaHGqsKgRO
o+TJQD40deLpwb9Yog1ymEf6xMwl3KaMIgYJScE0VMx2Jxg4aBdcJl5IJw9Ud1w3
gCArpaF7BSdV4t98K1PKqcRcr2Kh495hEPijeWNXXLtQPJTVlIMbfxXrb9kgZclI
0UAXUh+MMIcx+Oa/mP0P0iqjvGAO7bHYBpipUUcSFxlPm7nqfkikNPHXA6IpKoCU
X4G9n43t/0r5CskZhf7fF/gpdqvtwuAqthgB1UQ4GmGUXfWbXdYj3kJy8xFZakvj
L34d72FlgKg=
=LDZQ
-----END PGP SIGNATURE-----
