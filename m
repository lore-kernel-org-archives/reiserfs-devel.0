From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Thu, 18 Mar 2004 20:39:53 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87y8pxmx7a.fsf@uhoreg.ca>
References: <94121091767-BeMail@cr593174-a> <40586501.1070005@slaphack.com>
 <87u10njss0.fsf@uhoreg.ca> <405A2AFE.8060107@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17302-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "David" == David Masover <ninja@slaphack.com> writes:

[...]

David> A userspace daemon is what I was thinking, except that lufs is,
David> again, implementing an entire filesystem rather than piggybacking
David> on one that already exists.

Not sure what you mean by piggybacking on top of an existing filesystem.
It looks like lufs itself is just a link between the kernel and some
userspace code.  It isn't intended to be a completely new filesystem.
From what I can tell, its main purpose is to allow you to mount remote
filesystems, e.g. through ssh.  My guess is that the userspace code just
provides functions to implement things like open, opendir, read, etc.,
which should be easy to translate into shell calls, over ssh.  So it's
definitely simpler than Reiser4.  But I think you would be able to use
it to prototype something like ~/music/by_artist, which just does some
shell and id3 magic to find all the artists in ~/music and display a
nice list.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

