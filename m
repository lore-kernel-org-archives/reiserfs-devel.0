From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: carrying links too far? (was Re: A bold idea (Re: Carrying
 Attributes too Far))
Date: Sat, 06 Dec 2003 21:26:37 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <878ylps6qq.fsf@uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com>
 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
 <3FD00272.7040607@ninja.dynup.net>
 <1070617453.5605.13.camel@schlappix.schnulli.de>
 <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca>
 <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk>
 <3FD27FF2.3000907@ninja.dynup.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16269-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "David" == David Masover <jedi@ninja.dynup.net> writes:

[...]

David> I guess the main problem I have with this is that it only works
David> when we're talking about all the filesystems on the local
David> machine, and then only so far.  It kind of falls apart with
David> removable filesystems like floppies and cds.

And network mounts.

OK, another problem with Leo's scheme (and with hardlinking across
filesystems).  If I create a hardlink from partition A to partition B
(i.e. the file physically resides on partition B), and then unmount
partition B, I should still be able to access the file, since hardlink
semantics stipulate that the "link" on partition A is the actual file
itself, and not just a pointer.  But the file is not accessible, since
partition B is unmounted.  So things break.

Hmm.  Maybe later I'll write a couple of paragraphs on why it is
impossible to handle cross-filesystem hardlinking in any sane way.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

