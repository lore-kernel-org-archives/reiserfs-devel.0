From: Alexander Zarochentcev <zam@namesys.com>
Subject: Re: Online resize
Date: Fri, 19 Jul 2002 20:36:27 +0400
Message-ID: <15672.16395.383427.620647@backtop.namesys.com>
References: <OF4A0C85A9.BB67F078-ON85256BFB.004CD26A@pok.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <OF4A0C85A9.BB67F078-ON85256BFB.004CD26A@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hi!

Steve Pratt writes:
 > I somehow overlooked ReiserFS's ability to do online expand when I wrote
 > the EVMS FSIM.  I would like to correct that problem.  Are there any
 > restrictions as to when this can or can't be performed? 

1. reiserfs can be only expanded over the end of filesystem.
2. old pre-3.5.12 (or 13?) format with grouped bitmap blocks can't be expanded. 

 >  Is there any
 > minimum utility level that know to invoke the remount?   If not, it will be
 > simple to add.

The user-level resize_reiserfs (from reiserfsprogs package) can act as a
front-end for the in-kernel reiserfs resizer code.

 > 
 > Steve
 > 
 > EVMS Development - http://www.sf.net/projects/evms
 > Linux Technology Center - IBM Corporation
 > (512) 838-9763  EMAIL: SLPratt@US.IBM.COM
 > 
 > 
 > 
 > 

-- 
Alex.
