From: Radim Kolar <hsn@cybermail.net>
Subject: problems with /var/lib/dpkg/info
Date: Sat, 10 Aug 2002 11:05:29 +0200
Message-ID: <20020810090529.GA411@home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11152-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I have 3 debian gnu linux machines here with reiserfs. I am using
reiserfs about 2 years and when i have some kind of problem with
reiserfs  -  it is allways  with /var/lib/dpkg/info  directory.
It looks like  there is  too many hash collisions or reiserfs  do not
likes long directories.

Because of my previous bad experiences with losing this directory -  i am
using rdist to backup it now. In some cases both directories (original
and backup) are corrupted. 

i have 3090 files  in  this directory - this is not  that much, on ext2
it is quite slow when compared to reiser, but ext2 do not have any
problems with directory  corruption here. Anybody experienced this?
