From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Quota patches and  kinoded versions
Date: Tue, 29 Oct 2002 20:18:53 +0100
Message-ID: <20021029201853.73380d45.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs <reiserfs-list@namesys.com>

Hi Chris,

I need to rebuild an up-to-date 2.4 quota aware kernel for Reiserfs 3.6 and
i see this difference between what i run now ( 2.4.19-pre6) and the files on your FTP servers:

Since march 2002 ( timestamps of my files) , it was kinoded-8-2.4.19-pre3 and i see that
kinoded-8-2.4.19-pre7 is of Sept 2002. Other files didn't change.

We have some regular oopses on servers which act as fileservers ( ReiserFS+NFS) and i wonder
whether i should upgrade regarding this.

Also, do you plan to sync quota patches with 2.4.20pre or with 2.4.20 final once its out ?

Thanks,

Philippe.

