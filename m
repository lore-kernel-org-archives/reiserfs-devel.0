From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Fri, 05 Dec 2003 11:37:22 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87zne7xltp.fsf@uhoreg.ca>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com>
 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
 <3FD00272.7040607@ninja.dynup.net>
 <1070617453.5605.13.camel@schlappix.schnulli.de>
 <3FD08F73.4070404@ninja.dynup.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16253-reiserfs=m.gmane.org@namesys.com>
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

David> Now, why would I use separate filesystems in the first place?
David> Two reasons: performance and security.  Right now, it's a lot
David> easier to have /var be a certain sized partition rather than
David> trying to enforce disk quotas. ...

There's more to security and good administration than just disk quotas.
You can have different partitions mounted read-only.[1] You have
different mount attributes such as nodev, nosuid, noexec.  You may even
want to take advantage of the fact that you can't hardlink across
partitions (you don't want users to be able to hardlink programs from
/usr/bin).  Separate partitions also allows you to easily reinstall by
blowing away your root partition (after copying your /etc), e.g. if
your system gets compromised.  And so forth.

[1] This presents another problem to hardlinking across partitions.
What if you try to hardlink a file from a read-only partition onto a
read-write partition (or vice versa)?  A hardlink is supposed to be
essentially the same on both sides, so will you be able to write the to
the file or not?  Whichever one you choose, something breaks.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

