From: Dirk Mueller <dmuell@gmx.net>
Subject: 2.4.19-pre7 / corruption on unwanted reboot
Date: Sat, 4 May 2002 23:11:47 +0200
Message-ID: <20020504211147.GA20092@matrix.wg>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi, 

I've seen HEAVY file corruption on unwanted reboots (like pressing the reset 
button accidently) on reiserfs with this kernel on 3 machines now. 

The symptom is that it finds a LOT of files to "unlink" on journal replay, 
which I find suspicious as those machines are lightly loaded. 

I didn't follow the development too closely the last few weeks, but I 
believe that something turned worse in this respect lately. 

Note that reiserfsck doesn't find any error in the file system structure 
before and after the journal replay on reboot, 
still many files (especially those that were not touched for several hours 
before the reboot) contain complete garbage after the journal replay. 


Dirk
