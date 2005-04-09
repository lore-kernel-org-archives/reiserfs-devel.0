From: David Masover <ninja@slaphack.com>
Subject: Re: Protect/Backup Encrypted FS
Date: Fri, 08 Apr 2005 23:14:40 -0500
Message-ID: <425756B0.10508@slaphack.com>
References: <200504051448.55893.shakim@bluebottle.com> <200504091156.28552.shakim@bluebottle.com> <42573D9E.1050308@nauticom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42573D9E.1050308@nauticom.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Chester R. Hosey" <chosey@nauticom.net>
Cc: Shannon <shakim@bluebottle.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chester R. Hosey wrote:
> What configuration? I'm not really sure what you're asking, which means
> that it's difficult to formulate an answer. People on this list are
> generally very willing to help, but their ability to help is limited by
> how much information you give about what you're looking to do.
> 
> As far as backing up a partition and restoring that backup, use tar. GNU
> tar (which is almost certainly the default on GNU/Linux systems) is
> quite full-featured and should be able to serve your needs.

Rsync if you've got a networked computer.  dd if you've got a spare
drive/partition exactly the size of the one you want to back up.
GmailFS if you want a free offline backup solution (~2GB)

> If you're asking how to inform a GNU/Linux system about partitions you
> want to have mounted, you're probably looking for the /etc/fstab file.
> Try "man fstab" to see the manual page, and examine your current
> /etc/fstab to see what partitions the operating system knows about (with
> respect to filesystem type, where to mount by default, whether to mount
> on boot, etc.).

The issue was crypto, I think.

> If this hasn't provided you with the information you need to find an
> answer, perhaps you could try a bit more specifically. Describe the
> situation in which you find yourself, and what you hope to be able to
> do. Bonus points are awarded if it's a question specific to ReiserFS, as
> this is the topic of this list.

Indeed.  And if you're having trouble figuring out how to ask your
question, you should probably try an IRC channel.  I know that #gentoo
on irc.freenode.net is very active and good at helping people with
Gentoo Linux, or at least redirecting them to an appropriate channel.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQldWsHgHNmZLgCUhAQLl6xAAknNiQNnICo1pmxkp1GM+/jtvcisV9erT
nmCH1BZ5RS5nRmt3ytagpjTdes7SY5kfyMH1Soon/uuu7hEriTGdzGlxsBqzOKqk
+AI40cXJw+HLG/y6+uhF++WochXOxFF3Xm6dKEQv576dUn1V8qKPP05GuUvVOUuX
77ImKJUkKqYG42v6Z0zPNrXlMGbRZbaT7kdrvznfCnzFQmAgkjXz70tafOUoMW+d
X192dY7BlqNxKCgm1duWJoOrfuj4QmpDVDzWM941jUupQ9duAVnwqmIBAzxRw5c1
x1tm4hX8F4ua6rr5Qm3mVJ66F+Pg3a3QpYTR01qLD7+Wl4h1B1Ra1mn8811FWXlr
X1d2W+xEUM6nRaJ/VbKVsBQRiPd5HCHly0fa0NIWTzdGg7M7k7/WM2xbABgGnZBo
ZgFfQ790LxFNo1mMOGqAF3jzisPR3AW1w4K4AleC4TgM7bP8sZS3Wpu84MWyl+I0
jMGqgo9g6zksJeKEkeEMz9noQIClJTlYFVUtDgz8wMjqDJKnPtrD31uFeVOcVYIS
lZnkvPampT2GcsxkWUR95Iyd5STUqEWbNKBiXZit0nQE0YWi5fWkhYMGnGgIfdfB
NvCDFhfwfIl/IwAz1OMRlIgA+ydT/YO1JjdMawzkBuVNxT/1e6/iMzQTBsaVN4ZC
boAxZ5Zd/rk=
=4oEh
-----END PGP SIGNATURE-----
