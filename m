From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: carrying links too far? (was Re: A bold idea (Re: Carrying
 Attributes too Far))
Date: Sun, 07 Dec 2003 13:25:56 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87iskstrgr.fsf@uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com>
 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
 <3FD00272.7040607@ninja.dynup.net>
 <1070617453.5605.13.camel@schlappix.schnulli.de>
 <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca>
 <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk>
 <3FD27FF2.3000907@ninja.dynup.net>
 <1070803113.3fd328a961d00@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16283-reiserfs=m.gmane.org@namesys.com>
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

Leo> There are several different ways you can handle filesystems which
Leo> are frequently mounted and remounted.

I don't see any way that would work reasonably well.  Can you give an
example of one way?

Leo> Old single-tree filesystems can probably be adapted or fooled into
Leo> working reasonably well with external hard links too.

I'm not sure what you mean by this.  I think any filesystem that needs
to work with external hardlinks, in either direction, needs to be
patched -- either to be able to store the location of an external
hardlink, or to be able to update a refcount without having a new local
reference.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

