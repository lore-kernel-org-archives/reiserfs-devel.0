From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: AS performance with reiser4 on 2.6.3
Date: Fri, 27 Feb 2004 20:18:20 +0300
Message-ID: <16447.31708.873806.565855@laputa.namesys.com>
References: <403EBB87.2070504@namesys.com>
	<200402271704.i1RH45E19258@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402271704.i1RH45E19258@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: markw@osdl.org
Cc: reiser@namesys.com, piggin@cyberone.com.au, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

markw@osdl.org writes:
 > 
 > Yes, PostgreSQL uses fsync for its database logging.  I can certainly
 > enable the capture on copy option.  

Please don't, it is not stable enough yet.

 >                                     Does that produce something that I
 > need to manually capture?
 > 
 > Mark

Nikita.
