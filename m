From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: The danger of bad external links
Date: Sun, 07 Dec 2003 13:15:51 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87n0a4trxk.fsf@uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com>
 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
 <3FD00272.7040607@ninja.dynup.net>
 <1070617453.5605.13.camel@schlappix.schnulli.de>
 <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca>
 <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk>
 <3FD27FF2.3000907@ninja.dynup.net> <878ylps6qq.fsf@uhoreg.ca>
 <1070788133.3fd2ee2545967@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Leo" == lrc1  <lrc1@st-andrews.ac.uk> writes:

[...]

Leo> So Unix hard-links should indeed be thought of as references to a
Leo> file rather than as the file itself.

A hardlink "is the file" just as much as the "original" file "is the
file".  Neither one should be given any privilege over the other.
That's what I mean when I say that an external hardlink shouldn't be
thought of as just a pointer.  Yes, technically, it is just a pointer,
as is the "original".  But normal people don't think of it that way.
Normal people think of the file *being* the file itself, and so if you
want to implement cross-filesystem hardlinking, normal people should be
able to treat the file just like a normal file.  Not like a pointer
that points to a remote resource that may or may not be available.

[...]

Leo> 1) As you know, unlink() does exactly what it says: it deletes the
Leo> specified link to a file. This deletes the file if and only if it
Leo> then has no hard-links left. Explicit file deletion does pretty
Leo> much the reverse: ...

Why is explicit file deletion needed?  UNIX systems have been running
fine without it for many many years.  Is there something special about
external hardlinks that requires this?

[...]

Leo> Once you have what you need to do explicit file deletion, it should
Leo> be easy to add weak non-symbolic links too. These are exactly like
Leo> hard links except that they don't keep a file from being deleted:
Leo> if a file has only weak non-symbolic links to it, it will be
Leo> gced. ...

OK, I think this is what I would call a firmlink.  "Weaklink" to me
would imply something that's weaker than a symlink.  A firmlink implies
something stronger than a symlink, but weaker than a hardlink.  But
that's just arguing language.  If you say "weaklink", now I'll know
what you mean.

Leo> 2) When a filesystem is unmounted, every external link to the files
Leo> on it should normally be deleted. ...

This breaks hardlink semantics by treating one of the links as
preferential over the other.

David pointed out another of my objections to this.  When you remount,
you should have some way of restoring the links.  But then you should
be careful to make sure that bad things don't happen in the mean time.

Another problem with this is that it depends on what order the
filesystems are unmounted.  If filesystem A has a link to file that's
physically stored on filesystem B, and filesystem A gets unmounted
first, then the link won't be updated when filesystem B gets
unmounted.  Then, when you remount filesystem A, you have a broken link.

Leo> 3) When either of the two filesystems involved in an external hard
Leo> link screw up then the link may block or break, and there is no
Leo> realistic way to prevent this.  But then this is nothing new. Any
Leo> filesystem which screws up can mangle internal hard links, corrupt
Leo> file bodies, block all calls to it forever, or what have you. ...

Sure, but then this is because of programming error, or bad hardware.
If you do cross-filesystem hardlinking, broken hardlinks will become a
matter of normal system operation, and will basically be the norm,
rather than the exception.


What I'm really wondering, though, is why we need cross-filesystem
hardlinking in the first place.  I have only ever seen approximately one
good use of hardlinking, and it wouldn't have benefited from having any
cross-filesystem capability.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

