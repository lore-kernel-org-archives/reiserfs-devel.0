From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: some basic questions
Date: Wed, 05 Nov 2003 12:20:09 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <8765hyag1i.fsf@uhoreg.ca>
References: <1067880381.17873.9.camel@redeeman.linux.dk> <1068044839.32072.0.camel@redeeman.linux.dk>
 <87d6c6ahjz.fsf@uhoreg.ca> <1068051933.32075.10.camel@redeeman.linux.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Redeeman" == Redeeman  <redeeman@metanurb.dk> writes:

Redeeman> the reiserfs test partition i have is version 3.6

Yes.  3.6 does not have data logging.  Chris's patches are supposed to
be merged into the main Linux tree with data=ordered as default
eventually, but I do not think this has happened yet.

Reiser4, AFAIK, does not have the same problem.  Everything should be
atomic in Reiser4.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

