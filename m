From: "bmoon" <bo@anthologysolutions.com>
Subject: how to fix the file system which has a dangling file?
Date: Thu, 19 Jun 2003 11:55:14 -0700
Message-ID: <00ac01c33694$5266e2c0$6b01a8c0@bmoon>
References: <200306162226.39701.russell@coker.com.au> <1056030719.6758.97.camel@tiny.suse.com> <200306200046.52292.russell@coker.com.au> <1056035446.1071.143.camel@moss-huskers.epoch.ncsc.mil> <1056036084.6758.114.camel@tiny.suse.com> <1056043514.1071.199.camel@moss-huskers.epoch.ncsc.mil> <1056045995.6758.139.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14635-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello!

I accidently ran a novice application to create a big file, that was bigger
than the size of available disk space.

So it created a dangling file which can not be removed, even I can not
remove the directory including that file.

I ran "fsck -f" , it did not help.

It is on EX2 file system.

Please provide me any idea to remove it.

Thanks,

Bo
