From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Reiser4 status as of this weekend
Date: Sun, 16 May 2004 01:10:17 +0300
Message-ID: <20040515221017.GL1232@nysv.org>
References: <003a01c4377d$d653eac0$7d02a8c0@toronto.chantrynetworks.com> <40A68F75.2030306@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40A68F75.2030306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Russell Treleaven <rtreleaven@chantrynetworks.com>, ReiserFS List <reiserfs-list@namesys.com>

On Sat, May 15, 2004 at 02:45:25PM -0700, Hans Reiser wrote:

>Some users are saying that it is rock solid (please contradict dear 
>readers).  We the developers can use iozone to make it crash by mmapping 

I haven't had problems for a long time.

Then again, I haven't used iozone ever.

>well structured for managing memory under that circumstance.   The clean 
>fix for that for reiser4 given the way the Linux design is,  is 
>substantial work to do right, and is in progress.  We currently have a 
>fix that costs performance, and are fixing the performance issue (which 
>is fixable but requires code....).

Would you say this is the biggest issue?
What about NFS?

>We would probably have it ready to ship this week, but Nikita is leaving 
>Namesys after having done a great job here for way too little pay, and 

!!!
This is terrible news... I'm sorry, I'm at a loss of words...

Nikita, hope to see you on IRC still and thanks for all the great
work and the help you've given me and everyone else.

Best of luck.

>that means we need to have him and Saveliev spend a full week doing a 
>code review before he goes, and Zam and I are busy earning the next 
>month payroll money by doing work for digeo, and such is the free 
>software "business".  Sigh.

This may be a tactless question, but what about the grant for implementing
views? It was insufficient?

Have you also considered making it easier for the community to write code?
I'm not talking about write-access handed liberally to bitkeeper, but
maybe some coding guide and stuff could be more prominently available?

>So, stay tuned, and check again in two weeks.

Best of luck to the rest of you too.

-- 
mjt

