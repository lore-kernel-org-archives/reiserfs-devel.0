From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 22:00:14 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <87ad1xvhz5.fsf@uhoreg.ca>
References: <20040330123546.GA5229@nysv.org> <4069B659.3070606@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17607-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Hans" == Hans Reiser <reiser@namesys.com> writes:

Hans> I think that metas/ should be defined as a macro, and users should
Hans> feel free to change it and recompile as suits their needs.

I had though about maybe making it a mount option, I don't really like
the idea, as it can induce confusion.  You can't just sit in front of
any Linux computer that uses Reiser4, and know how to easily access the
pseudofiles.  It may also confuse script writers.  I think it's best to
try to pick a sensible default that is the least likely to have people
up in arms.

P.S.  I really do think you guys are doing a great job, and look
forward to giving it a test run soon.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

