From: Isaac Chanin <chanin@WPI.EDU>
Subject: Re: AMD64 testing
Date: Wed, 22 Dec 2004 13:57:50 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0412221355370.17614-100000@ccc3.wpi.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

Well, there're a few things you ought to try.  First off you'll need 
Alex's reiser4/AMD64 patch, which you can get at 
http://marc.theaimsgroup.com/?l=reiserfs&m=110219571330701&w=2 and then 
you probably ought to try Jake's resier4 killing commands, those're at 
http://marc.theaimsgroup.com/?l=reiserfs&m=109947213108486&w=2.

About the status of reiser4 on AMD64, well, you can find a lot more in 
those two threads.  In brief, I'm currently running a full system entirely 
on entirely reiser4, aside from /boot, and it has been mostly stable so
far.


Isaac

