From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: A file-based interface for mount
Date: Wed, 09 Jul 2003 15:17:22 -0400
Sender: news <news@main.gmane.org>
Message-ID: <877k6r8q7x.fsf@labatt.uhoreg.ca>
References: <3F078EF1.6090908@mrs.umn.edu> <3F0C161B.6030707@namesys.com>
 <16140.7137.369855.682433@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Nikita" == Nikita Danilov <Nikita@Namesys.COM> writes:

[...]

Nikita> But what exactly is an advantage of this interface?  If user is
Nikita> allowed to mount arbitrary file system at /some-place, it can
Nikita> mount something containing suid binary and here we go.

I'm also wondering what advantages this interface would have.  As far
as I can tell, you lose more than you gain -- can't specify mount
options, file system type, etc.  It also seems very unintuitive to me.
From what I can see, the only advantages that you gain would be more
easily done by writing a custom SUID binary, which reads some
configuration file somewhere to determine if the user has proper
permissions, etc.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

