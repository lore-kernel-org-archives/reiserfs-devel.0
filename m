From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: starting with ".." could break stuff
Date: Fri, 02 Apr 2004 11:29:12 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <8765ciqr6v.fsf@uhoreg.ca>
References: <200404010546.i315kEvY019805@sirius.cs.pdx.edu> <20040402035617.GC2158@zero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Tom" == Tom Vier <tmv@comcast.net> writes:

Tom> i bet there's a few apps that, when trying to skip .., only check
Tom> the first two chars of the name. this may or may not be a problem.

Then those apps are broken.  ..foo has always been a valid filename
(though highly uncommon).  ..metas doesn't introduce anything new -- it
only makes ..files more common.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

