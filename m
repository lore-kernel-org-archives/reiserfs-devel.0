From: Oleg Drokin <green@namesys.com>
Subject: call for testers. reiserfs_file_write() implementation.
Date: Wed, 14 Aug 2002 18:49:38 +0400
Message-ID: <20020814184938.A12116@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

    After some time of development and internal testing, I am releasing
    this in public (obviously before pushing it to Marcelo).
    There are two patches at
    ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending/testing
    These implement reiserfs_file_write() support (patches are against
    2.4.20-pre2) that should speedup writes for those applications
    that actually care about st_blksize content of stat(2) output.
    (including cp and dd of course)
    Before submittig these to Marcelo we'd like to get more wide testing,
    of course. So if you can try these and report any problems, that
    would be very much appreciated.
    Also first patch considerably speedups hole creation (I remember report
    about creating 128G empty file was taking ages, this should fix this).
    
    Please note that these patches are not compatible with Chris Mason's
    datalogging patches, though we will do a merge later of course.

Bye,
    Oleg
