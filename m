From: Anders Widman <andewid@tnonline.net>
Subject: Re: kswapd CPU usage and heavy disk IO
Date: Thu, 9 Jan 2003 17:50:34 +0100
Message-ID: <8831168500.20030109175034@tnonline.net>
References: <200301091431.54451.russell@coker.com.au>
 <3E1D9D10.40700@emageon.com> <200301091742.51101.Dieter.Nuetzel@hamburg.de>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301091742.51101.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-1?B?RGlldGVyIE78dHplbA==?= <Dieter.Nuetzel@hamburg.de>
Cc: Brian Tinsley <btinsley@emageon.com>, Russell Coker <russell@coker.com.au>, ReiserFS <reiserfs-list@namesys.com>, Rik van Riel <riel@nl.linux.org>, Andrea Arcangeli <andrea@suse.de>, Linux Kernel List <linux-kernel@vger.kernel.org>


> Are you sure it is a ReiserFS and not a kernel thing?

I  would  think it is probably not. I have seen this also when running
things  like  "badblocks  /dev/hdb"  and  the  kswapd  eats up all CPU
recourses.  Then  again I am always using ReiserFS so I do not know if
the  ReiserFS  is the cause or not.. But judging from badblocks is not
FS dependantI think there is no wrong with ReiserFS =)

//Anders

