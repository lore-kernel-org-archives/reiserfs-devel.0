From: Anders Widman <andewid@tnonline.net>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 16:39:52 +0200
Message-ID: <347580893.20030428163952@tnonline.net>
References: <3EAD34D5.8030108@solidcode.net>
 <200304281417.h3SEHudA003449@turing-police.cc.vt.edu>
 <1742847756.20030428162843@tnonline.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1742847756.20030428162843@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Note that *any* solution has to deal elegantly with the case of a transfer
> that fails partway through.  No amount of 'fuser' or reiser trickery will
> fix the case where you are receiving a 400mb TIFF, and the connection is
> closed after 250M is transferred.


   Does not Samba take care of this?



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

