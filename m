From: Hans Reiser <reiser@namesys.com>
Subject: Reiser4 status as of this weekend
Date: Sat, 15 May 2004 14:45:25 -0700
Message-ID: <40A68F75.2030306@namesys.com>
References: <003a01c4377d$d653eac0$7d02a8c0@toronto.chantrynetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <003a01c4377d$d653eac0$7d02a8c0@toronto.chantrynetworks.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Treleaven <rtreleaven@chantrynetworks.com>, ReiserFS List <reiserfs-list@namesys.com>

Russell Treleaven wrote:

>Hi Hans,
>
>Your website has been saying "Reiser4 is in final testing, and will ship
>soon!" for a long time.
>Terms like long and soon are kinda vague. How long has the website
>stated that Reiser4 will ship soon?
>I really like the idea and wan't to try out Reiser4.
>
>Sincerely,
>
>Russell Treleaven
>
>
>
>  
>
Some users are saying that it is rock solid (please contradict dear 
readers).  We the developers can use iozone to make it crash by mmapping 
more than all of ram and dirtying all the mmapped pages.  Linux is not 
well structured for managing memory under that circumstance.   The clean 
fix for that for reiser4 given the way the Linux design is,  is 
substantial work to do right, and is in progress.  We currently have a 
fix that costs performance, and are fixing the performance issue (which 
is fixable but requires code....).

We would probably have it ready to ship this week, but Nikita is leaving 
Namesys after having done a great job here for way too little pay, and 
that means we need to have him and Saveliev spend a full week doing a 
code review before he goes, and Zam and I are busy earning the next 
month payroll money by doing work for digeo, and such is the free 
software "business".  Sigh.

So, stay tuned, and check again in two weeks.

Hans
