From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 07 Apr 2004 14:07:55 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87k70ru0ec.fsf@uhoreg.ca>
References: <no.id> <200404050401.i3541XVk004592@sirius.cs.pdx.edu>
 <87fzbj9fws.fsf@uhoreg.ca> <200404051222.07071.marcelo@macp.eti.br>
 <4072BEEF.9060802@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Hans" == Hans Reiser <reiser@namesys.com> writes:

Hans> New users hate languages with lots of punctuation in the keywords.
Hans> Mr. Demidov correctly reminded me of this, and of the history of
Hans> users hating such languages, and this caused me to abandon ..metas
Hans> for metas.  Mr Demidov, can you say more about this history?

Well, I don't know exactly what Mr. Demidov was thinking, but I know
that one common complaint about Perl is the punctuation in front of
variable names.  However, for UNIX filesystems, there's a lot of
precedent for at least a single leading dot in filenames, so I don't
think it should be a problem to call it ".metas".  It is also not
something that would be extremely common, so it wouldn't be like having
a Perl program pocked with punctuation.  (Alliteration unintentional.)

The leading dot also flags the file as being somewhat "special" -- two
leading dots would flag it as being more so.  Although my own personal
sense of aesthetics is biased against two dots, using two dots would be
well justified, and I personally wouldn't consider it a critical issue.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

