From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Sat, 06 Dec 2003 21:11:35 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87d6b1s7fs.fsf@uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com>
 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
 <3FD00272.7040607@ninja.dynup.net>
 <1070617453.5605.13.camel@schlappix.schnulli.de>
 <3FD08F73.4070404@ninja.dynup.net> <87zne7xltp.fsf@uhoreg.ca>
 <1070750513.3fd25b311ae75@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16268-reiserfs=m.gmane.org@namesys.com>
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

Leo> The solution I suggest is to throw out the "one volume, one tree"
Leo> requirement.  The volume's tree then becomes a forest, with every
Leo> file with no parent in the volume being the root of a tree.

[...]

Leo> Thus the answer to your question above would be that the file would
Leo> be in ... whatever filesystem it happened to be in, not necessarily
Leo> that of /any/ of its parents.

Umm.  You aren't answering the problem that I posed, and your solution
doesn't solve the issue.  If you have a file that is hardlinked from a
read-only filesystem to a read-write filesystem (or vice versa), then
can you write to that file or not.  As a hardlink, the file should
inherit from its filesystem, but since it is essentially contained on
two filesystems (where it actually physically resides is unimportant),
as hardlink semantics would require, the file must both be read-write
and read-only.

David also points out problems with your solution in maintaining
consistency, which I agree with.

(BTW, David, I'm dropping our other conversation about partitions, since
it is very off topic, and not really very productive, since I don't
think you're advocating that we should remove the capability of having
multiple partitions.)

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

