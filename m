From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Wed, 17 Mar 2004 12:19:11 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87u10njss0.fsf@uhoreg.ca>
References: <94121091767-BeMail@cr593174-a> <40586501.1070005@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "David" == David Masover <ninja@slaphack.com> writes:

David> Alexander G. M. Smith wrote:
Alexander> ...  I (and others) think it would be better for this to be
Alexander> done at the file system level.  That way you can leverage all
Alexander> sorts of other utilities and

David> What about a reiser4 plugin?

I would think that would count as being in the filesystem level.

David> What about a plugin that is mostly in userspace?

That just reminded me of lufs[1], which allows you to create a userspace
daemon that communicates with the lufs module to provide access to a
(virtual) filesystem.  They say that it's slow, because it uses UNIX
domain sockets for the communication, so it's more suitable for mounting
remote filesystems, where network lag would dominate.  (You also
wouldn't get all the nifty stuff that Reiser4 gives you, like
pseudo-files.)  But I bet that (at this point in time) it's probably
easier to write a lufs daemon than a reiser4 plugin, so it might be good
for prototyping.  Faraz might want to look at using that for his
project.

[1] http://lufs.sourceforge.net/lufs/

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

