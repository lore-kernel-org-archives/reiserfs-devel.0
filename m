From: Hans Reiser <reiser@namesys.com>
Subject: Re: power loss -> corruption
Date: Thu, 08 May 2003 22:58:35 +0400
Message-ID: <3EBAA8DB.3080202@namesys.com>
References: <m1k7d11yaz.fsf@orchid.mirar.org>	<200305081348.42359.Dieter.Nuetzel@hamburg.de>	<m1fznp1w3a.fsf@orchid.mirar.org>	<200305081502.47455.Dieter.Nuetzel@hamburg.de> <m17k911sq4.fsf@orchid.mirar.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m17k911sq4.fsf@orchid.mirar.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mirar <mirar-yg@mirar.org>
Cc: =?ISO-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, reiserfs-list@namesys.com

You have run into the disadvantage of meta-data journaling, which is 
that files that you are writing to may be corrupted if you crash.  This 
disadvantage exists for performance reasons: using traditional 
journaling approaches such as V3 uses, if you journal the data you must 
write it twice.  V3 also offers you the option of performing ordered 
writes, in which, if I remember right, metadata is only updated after 
the data reaches disk.

V4 uses a completely different technology we call wandering logs, in 
which every filesystem operation is performed as a fully atomic 
transaction, and because of its new design, there is very little 
performance cost (in fact, reiser4 is higher performance than V3).  We 
hope V4 will be ready for prime time sometime this summer.

-- 
Hans


