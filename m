From: Chris Mason <mason@suse.com>
Subject: updated data logging available
Date: 11 Jul 2003 17:21:03 -0400
Message-ID: <1057958462.13318.78.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,

ftp.suse.com/pub/people/mason/patches/data-logging/2.4.22

Has a merge of the data logging and quota code into 2.4.22-pre4 (should
apply to -pre5).  Overall, the performance of pre5 + reiserfs-jh is nice
and smooth, I'm very happy with how things are turning out.

Thanks to Oleg for merging data logging with his reiserfs warning
patches and hole performance fixes.

The relocation and base quota code is now in, so our number of patches
is somewhat smaller.  The SuSE ftp server might need an hour or so to
update, please be patient if the patches aren't there yet.

-chris


