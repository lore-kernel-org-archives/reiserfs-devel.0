From: Sander <sander@humilis.net>
Subject: succes story reiserfsck
Date: Wed, 17 Mar 2004 21:17:58 +0100
Message-ID: <20040317201758.GA5080@favonius>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi all,

Reiserfs on my notebook got currupted badly, most likely due to the
kernel version (2.5.75), but maybe bad hardware too. In the end it even
wouldn't finish the scripts anymore at boot, during which reiserfs
errors flooded the console.

Reiserfsck (3.6.13) did a _great_ job in recovering the fs. Lots of
files in lost+found, but the fs was usable again. Not that anything
important was on the fs, but is was interesting and reassuring to see
that reiserfsck is capable to fix the quite broken fs.

Thanks for the fs!

-- 
Humilis IT Services and Solutions
http://www.humilis.net
