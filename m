From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 14:42:34 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87eklky0kl.fsf@uhoreg.ca>
References: <20040826150202.GE5733@mail.shareable.org> <4136E0B6.4000705@namesys.com>
 <1117111836.20040902115249@tnonline.net>
 <200409021327.22998.v13@priest.com>
 <16695.12190.58678.877396@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "John" == John Stoffel <stoffel@lucent.com> writes:

V13> I believe you mean something simillar to:
V13> file1.txt;1
V13> file1.txt;2
V13> file1.txt;3 (yeap, it's VMS)

[...]

John> In any case, while I do like this feature, I'm not sure how we
John> would cleanly implement this inside the unix namespace, or if
John> inside a new namespace, how that new namespace would be joined
John> with a standard Unix one.

  file1.txt/..version/1

or, for those version control systems like svn and arch where the
version number refers to the version of the whole project tree:

  project/..version/1/file1.txt

You could even export strange things like:

  project/..by-date/2004-08-24/file1.txt

to see what the file looked like on August 24.  Or

  project/..diff/3-1/file1.txt

to see a diff between version 3 and 1.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

