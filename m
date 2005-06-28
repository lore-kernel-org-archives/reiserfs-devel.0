From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: How to user reiser4 and crypt plugin ??
Date: Tue, 28 Jun 2005 13:59:13 -0400
Message-ID: <878y0updla.fsf@evinrude.uhoreg.ca>
References: <Pine.GSO.4.58.0506281054200.2602@sysss01h> <42C16B43.7060706@namesys.com>
 <Pine.GSO.4.58.0506281133260.2602@sysss01h>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24767-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, 28 Jun 2005 11:38:30 -0400 (EDT), Keven Murphy <murphyk@gdls.com> said:

> Thank you for the reply.  Do you see any issues with using reiser3 or
> reiser4 file system on a loop-back encrypted device?

I'm using reiser4 on a loopback encrypted device without problems.
(But then, I haven't had any hardware problems or powerlosses.)

> Some of the docs I have found say to stick with ext2 for the
> filesystem. I was thinking reiser still would be a better choice.

From what I hear, you should avoid using journaled filesystems on a
file-based loopback that is stored on a journaled filesystem.  I believe
that the reason for that is that a file-based loopback that is stored on
a journaled filesystem does not guarantee certain write ordering or that
journaled filesystems depend on.

But using a journaled filesystem on a device-based loopback should be
fine.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

