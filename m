From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Carrying Attributes too Far
Date: Fri, 05 Dec 2003 00:27:43 -0500
Message-ID: <87llprj0kw.fsf@uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com>
 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16238-reiserfs=m.gmane.org@namesys.com>
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

Leo> Cleaning up cross-filesystem links after explicit file deletion is
Leo> a related but simpler problem.

This breaks hard linking semantics.  When one side of the link is
deleted, the file should still be accessible from the other side.
(When you create a hard link, both the original and the link become
indistinguishable.)

I do not think there is *any* good way of implementing hard linking
across filesystems that does not break in one case or another.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

