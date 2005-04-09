From: "Chester R. Hosey" <chosey@nauticom.net>
Subject: Re: Protect/Backup Encrypted FS
Date: Fri, 08 Apr 2005 22:27:42 -0400
Message-ID: <42573D9E.1050308@nauticom.net>
References: <200504051448.55893.shakim@bluebottle.com> <200504091156.28552.shakim@bluebottle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200504091156.28552.shakim@bluebottle.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shannon <shakim@bluebottle.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

What configuration? I'm not really sure what you're asking, which means
that it's difficult to formulate an answer. People on this list are
generally very willing to help, but their ability to help is limited by
how much information you give about what you're looking to do.

As far as backing up a partition and restoring that backup, use tar. GNU
tar (which is almost certainly the default on GNU/Linux systems) is
quite full-featured and should be able to serve your needs.

If you're asking how to inform a GNU/Linux system about partitions you
want to have mounted, you're probably looking for the /etc/fstab file.
Try "man fstab" to see the manual page, and examine your current
/etc/fstab to see what partitions the operating system knows about (with
respect to filesystem type, where to mount by default, whether to mount
on boot, etc.).

If this hasn't provided you with the information you need to find an
answer, perhaps you could try a bit more specifically. Describe the
situation in which you find yourself, and what you hope to be able to
do. Bonus points are awarded if it's a question specific to ReiserFS, as
this is the topic of this list.


Shannon wrote:
| I haven't received a reply to this, so I'm going to be more specific:
|
| When you create an encrypted partition, where is this configuration
stored?
|
| On Tue, 5 Apr 2005 02:48 pm, Shannon wrote:
|
|>/		10GB	Reiser
|>/home	40GB	Reiser encrypted FS
|>/swap	300mb
|>
|>
|>As per the harddrive configuration, if my / partition becomes corrupted or
|>if I choose to install a fresh copy of SuSe9.2 Pro over / and remount
|>/home, what do need to backup or how do I backup the files needed to
|>restore the encrypted partition /home

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCVz2erDBoMHxfhXwRAmJrAJ98d6Ia3pcrMwNn4He610fBWtX/EQCgvFCv
mbT2w8dPxAi5otfpTWzbBOM=
=Xq6Q
-----END PGP SIGNATURE-----
