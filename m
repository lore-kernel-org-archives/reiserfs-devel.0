From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Wed, 17 Mar 2004 12:04:15 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87y8pzjtgw.fsf@uhoreg.ca>
References: <20040317075333.96561.qmail@web60404.mail.yahoo.com> <40580A55.7030809@cse.iitd.ernet.in>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Nishant" == Nishant Sharma <nishantt@cse.iitd.ernet.in> writes:

Nishant>     I wonder if it is possible to put this "plugin
Nishant> infrastructure" in the user space rather than kernel space, by
Nishant> putting it in the glibc implementation. ...

I've thought about this too, but I think it would be harder to put this
in glibc.  Something like gnome-vfs is able to use plugins easily,
because it uses a URL-like syntax, and so it can tell what plugin to use
based on the format of the filename.  But for the type of stuff we
would want to do, glibc would have to make a bunch of kernel calls to
determine up to when, in the filename, the kernel can handle, and when
it has to start doing its processing.  So if you requested the file:
/home/hubert/music/foo.mp3/..albumcover/cover.jpg, I imagine the
sequence of events would have to be something like:
- glibc asks the kernel for /home/.../cover.jpg
- kernel returns "file not found"
- glibc asks the kernel for /home/.../..albumcover
- kernel returns "file not found"
- glibc asks the kernel for /home/.../foo.mp3
- kernel returns file handle
- glibc does its processing to extract the album cover.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

