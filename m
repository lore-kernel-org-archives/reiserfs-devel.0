From: Hubert Chan <hubert@uhoreg.ca>
Subject: Why do we need openat? (was: The argument for fs assistance in
 handling archives)
Date: Wed, 01 Sep 2004 22:30:41 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87acw9bdwu.fsf_-_@uhoreg.ca>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain>
 <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
 <20040902002431.GN31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011800270.2295@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Linus" == Linus Torvalds <torvalds@osdl.org> writes:

[...]

Linus> This is why I want to have stronger reasons for real VFS
Linus> support. I see the Samba argument, and I buy that one, if only
Linus> because it has such a high consistency requirement (let's face
Linus> it, people expect more guarantees of their file servers than of
Linus> most other things). But on the other hand, the Samba guys
Linus> apparently _are_ happy with "openat()", so they don't necessarily
Linus> need any normal namespace stuff.

Maybe things have got lost in this thread (or these many threads), so
bear with me, but what exactly does openat() gain us that we can't get
from exporting things from the normal file namespace?  The only issue
that I've seen raised is that you need to be able to distinguish between
the contents of a directory and its substreams.  And I've responded that
streams should be stuck in a specially-named subdirectory (like
..streams) (which should be done even if only files could contain
substreams), to which I have seen no objections raised (not even as much
as a "you're stupid"), and so can only assume nobody (who cares) has any
objections.

So as far as I can see, openat() has no advantages, and exporting
things through the normal namespace has several advantages, such as:
- can manipulate substreams using legacy programs -- no modifications
  needed.  And don't tell me "runat" until someone shows me how to deal
  with my GIMP/emacs problem.
- useful for exporting different things (streams, acl's or other access
  control schemes, xattrs, version control, automatic untar, ...)
- only need to modify tar (and backup programs) once -- any new
  filesystem extensions, no matter how complex, can be exported through
  the filesystem interface, and tar will be able to catch them.
- referring to the substreams is simpler ("foo.txt/streams/bar"
  instead of "the bar stream of foo.txt"), which leads to simpler user
  interface.  This is even more marked if we, for some strange reason,
  discover that it's a good idea for streams to be allowed to have
  substreams of their own ("foo.txt/streams/bar/streams/baz" vs. "the
  baz stream of the bar stream of foo.txt")
- I think I'm forgetting some...

If this is indeed the case, then it seems to me that the logical choice
is to export streams through the normal file namespace.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

