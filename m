From: David Masover <ninja@slaphack.com>
Subject: Re: can't compile with reiser4
Date: Fri, 30 Apr 2004 18:15:33 -0500
Message-ID: <4092DE15.4010709@slaphack.com>
References: <4092DCD1.6000107@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18342-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4092DCD1.6000107@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

gah!  looks like something got chopped out!  maybe I tapped the trackpad
or something...

what I know I typed before was:

most Gentoo packages (including glibc) on my system now either fail to
install...

| glibc) on my system now either fail to install, continue trying to
| install forever (make caught in an infinite loop), or install but don't
| work later.  My / is reiser4, with separate mountpoints for /boot, /sys,
| /proc, /dev, /dev/pts, and /dev/shm.  So this doesn't make sense...
|
| I think I've figured out one reason it's failing, though:  I've found a
| certain place where if I do something like 'make foo.o', it builds foo.o
| just fine (out of foo.c), but foo.c gets its mtime updated right along
| with foo.o -- making foo.o out of date.  This is not just defeating the
| purpose of 'make' (being able to rebuild a selective portion of a
| program and not the whole thing, based on mtimes) but causes at least
| one program (sudo) to not install properly.
|
| The way that works is that 'make' is called once for the build, with all
| the paths (including --sysconfdir) set to their ultimate destinations in
| /, and then 'make install' is called again, with these paths set to the
| same thing, but inside the install tree -- so instead of /etc, we get
| /var/tmp/portage/sudo-1.6.7/install//etc
| (I may not have those versions or paths right.)
|
| This is fine, because 'make install' is usually just copying files
| around, so we want the files copied to that temporary install directory
| (so we can do an atomic merge).  But because so many .c files are just
| as new as the .o files, so much (if not everything) must be rebuilt
| during 'make install' -- which means sudo becomes hardcoded to look for
| its config file somewhere in /var/tmp.
|
| More details if you want them...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQJLeFHgHNmZLgCUhAQKE+A/9GqPGq4kkrI7sBJE7ORLlqMATnmsPnQm8
qKsSFOll5tkU0EIFdd9wF6SdRp29TtwuFolEYKKS+K+rkjNOF+JQTbJCc8Um/Gzx
zBxViv0m4au95tl7vRRCfwiqEfWbvaqK91PV3inB3KH3WFYI7ZpyyUARYOLErr+T
/ZIrt5Y6rjVp4d0b7i42wWsgPwyf67Tym0tte9vnjJ7HyepxxkozfGWjFWCICHNm
TsRbEQsk90rX/43c1uEr+UVDjx/8MeowvrC1OXjDgeDt+xm+/quZF9ciw+fgjS0v
ET4ntHRcURKSqu6PBDW5dyIMErDlbEMFXwRJF6Q6Ix4aVgdzw2xJPqx4Uufyi1ky
zSUa7W/DyrdYfHA3rhFT+39ICl5qvQONNfxXuKZpfvQzOyZ+MsOoWVnepWxo25K8
/m7TbsIrtgaYcwvqDVc8HWJu7vxO6VtOygn2xkDYvbLpC6M/nsufS+RZEzY0t7AY
wOXWD3835VRdVITXpdxgJnpKhtl780fmkyCARUF8d50VjeY8qh5w4XrCZpg3vXXf
itETN9xjzxb/76DmIE1PBgNVwCSP3vetcYeGBUKO8ZyIM3rz5gb183A6YJkTNJgj
T3WXZ7XNTxrvaePq2kx2gC4tj5EbEnZVgFM91EnKMfqlg6nXuyKiY8vYStawmERP
HurbLTkRzls=
=HJ4j
-----END PGP SIGNATURE-----
