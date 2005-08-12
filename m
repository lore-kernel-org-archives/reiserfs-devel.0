From: michael chang <thenewme91@gmail.com>
Subject: Re: reiser4 problem with pam_mktemp
Date: Thu, 11 Aug 2005 20:42:57 -0400
Message-ID: <b14e81f00508111742908cf55@mail.gmail.com>
References: <42E907E4.7090003@parkheights.dyndns.org>
	 <42ECD354.8010304@namesys.com>
	 <42F97768.5010602@parkheights.dyndns.org>
	 <42F9EF8E.8050403@namesys.com>
	 <42FB3026.1050609@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25418-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FB3026.1050609@parkheights.dyndns.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sergey ivanov <seriv@parkheights.dyndns.org>
Cc: reiserfs-list@namesys.com

On 8/11/05, sergey ivanov <seriv@parkheights.dyndns.org> wrote:
> I have not succeeded with integrating reiser4 & pam_mktemp.
> From one side I recompiled kernel with reiser4 patches modified to
> return ENOTTY for attempt to deal with attributes, as tmpfs does.
> Pam_mktemp does not work after this. So I returned to the kernel with
> original Namesys' patches.

> # strace -o su.log -fF su - seriv

> 1993  mkdir("/tmp/.private", 0711)      =3D -1 EEXIST (File exists)
> 1993  lstat64("/tmp/.private", {st_mode=3DS_IFDIR|0711, st_size=3D7, ...}=
) =3D 0
> 1993  open("/tmp/.private", O_RDONLY)   =3D 3
> 1993  ioctl(3, EXT2_IOC_GETFLAGS, 0xbf9e37f8) =3D -1 EISDIR (Is a directo=
ry)

> So it looks like reiser4 tries to be good and answer to ioctl
> getting/setting attributes "EEXIST" and "EISDIR",
> and not return error "ENOTTY".

This seems kind of confusing -- the problem with the idea that all
files are files and directories... do we really want to be returning
that it's a directory here?  My guess is that this is the confusing
bit about this filesystem.  AFAIK, this is probably confusing the PAM
code or whatever.  *shrugs*

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
