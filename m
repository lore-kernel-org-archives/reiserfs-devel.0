From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: file as a directory
Date: Tue, 14 Dec 2004 19:16:27 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0412141914450.26545@yvahk01.tjqt.qr>
References: <200411301631.iAUGVT8h007823@laptop11.inf.utfsm.cl> 
 <41ACA7C9.1070001@namesys.com>  <1103043518.21728.159.camel@pear.st-and.ac.uk>
  <Pine.LNX.4.61.0412141812250.5600@yvahk01.tjqt.qr>
 <1103047919.28291.13.camel@pear.st-and.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1103047919.28291.13.camel@pear.st-and.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

>I don't imagine anyone would miss that behaviour, we can probably have
>something more useful than a
>cat: /etc: Is a directory
>message.

But if /etc can also be a file, cat would not complain!

>ok, I don't really care about the trailing slash. The reading method
>(read() vs. readdir()) may be enough to distinguish the uses. The
>trailing / is still a useful (and logical) visual notation though for
>the different meanings, so something like ls could give both versions.

Yes, indeed the idea itself is good. `ls` uses it to follow symlinks that 
point to directories:

ls -l /U
lrwxrwxrwx  1 root root 35 Dec  6 22:03 /U -> 
/media/usb-0000000000004287:0:0:0p

ls -l /U/
drwxr-xr-x   2 root root  48 Dec  6 14:27 .
drwxr-xr-x  31 root root 824 Dec 14 17:51 ..
-rw-r--r--  1 root root 1614 Dec 12 23:57 tstpasswd

>> What will ls do? 
>list both /etc/passwd and /etc/passwd/ perhaps?

Well, and before ls is tweaked to do so?



Jan Engelhardt
-- 
ENOSPC
