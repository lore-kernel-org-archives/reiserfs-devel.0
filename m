From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: using of XATTRs instead of pseudo files for accessing reiser4
	file attributes.
Date: Mon, 05 Apr 2004 21:22:39 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87lll97vds.fsf@uhoreg.ca>
References: <1081169185.3548.373.camel@watt.suse.com> <38261445506-BeMail@cr593174-a>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Alexander" == Alexander G M Smith <agmsmith@rogers.com> writes:

Alexander> One of the big points is to cut down on the number of APIs
Alexander> and gain in saved effort.  Listing attributes?  Just use good
Alexander> old ReadDir().  With a common name space, you can use grep
Alexander> and other well developed tools to deal with attributes.  And
Alexander> so on.

But if programs are using xattrs for other filesystems, then people
don't want to have to detect when they're running on Reiser4, and switch
to using ReadDir() et al.  So while the philosophical side of me says
that using normal file operations is the better thing to do, the
pragmatic side of me says that there should be at least some sort of
compatibility layer that uses the xattrs API and makes the appropriate
translation for Reiser4.  (And whether or not that really is the best
thing to do runs along the same lines as whether or not WINE helps
migration from Windows to GNU/Linux.)

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

