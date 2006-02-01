From: malcolm <malcolm@malcolm-agnew.de>
Subject: reiaserfs --rebuild-tree
Date: Wed, 1 Feb 2006 10:00:18 +0100
Message-ID: <200602011000.21636.malcolm@malcolm-agnew.de>
References: <E1F47g7-0005Y2-O3@dime94.dizinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <E1F47g7-0005Y2-O3@dime94.dizinc.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

What's gone horribly wrong here?


% fsck.reiserfs --rebuild-tree /dev/hdf5
...
pass0: block 327693, item 41: The file [81025 81082] has the wrong mode 
(?rwxrw-r--), corrected to (-rwxrw-r--)
pass0: block 327693, item 43: The file [81025 81083] has the wrong mode 
(?rwxrw-r--), corrected to (-rwxrw-r--)
pass0: block 327693, item 45: The file [81025 81084] has the wrong mode 
(?rwxrw-r--), corrected to (-rwxrw-r--)
...

It's happened twice now within 2 days. The reiserfs partition was created out 
of the box by SuSE 10.0. The other 2 harddiscs seem to be o.k.

Malcolm Agnew
