From: Brian Tinsley <btinsley@emageon.com>
Subject: Re: Legato (was: what do you do that stresses your filesystem?
Date: Sun, 05 Jan 2003 11:00:26 -0600
Message-ID: <3E1864AA.7020209@emageon.com>
References: <3E06F360.7000708@namesys.com> <3E0D364F.1010008@emageon.com> <3E17EA01.1080309@namesys.com> <20030105114942.GN24344@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hendrik Visage wrote:

>It's also an interesting thing to see the impact of the traversing
>of the filesystem during backups.
>  
>

This is something that is hurting us badly right now! When our backup 
product starts scanning half terabyte filesystems with millions of 
files, it can essentially bring the machine to its knees (i.e., system 
time stays in the 90% range).


-- 

-[========================]-
-[      Brian Tinsley     ]-
-[ Chief Systems Engineer ]-
-[        Emageon         ]-
-[========================]-



