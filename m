From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Carrying Attributes too Far
Date: Sat, 06 Dec 2003 21:48:41 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <874qwds5py.fsf@uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com>
 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
 <3FD07C4D.6090401@namesys.com>
 <1070753637.3fd267652753f@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16271-reiserfs=m.gmane.org@namesys.com>
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

Leo> Second, before implementing hard linking across directories you're
                                                     ^^^^^^^^^^^
I assume you meant "filesystems" there?

Leo> really going to need two-way links between directories and their
Leo> children.

I don't see why you would need this.  Can you explain?

Leo> * You'll also need explicit file deletion and if possible weak
Leo> non-symbolic links (..loose links).

What do you mean by "loose links"/"weak non-symbolic links"?

Leo> * More precisely, you'll need the call to discover the parents of a
Leo> given file.  The actual reference from child to parent is only
Leo> absolutely necessary for links across filesystems; on internal
Leo> links it's basically a performance optimisation.

Again, I do not see why this is needed.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

