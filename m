From: Hans Reiser <reiser@namesys.com>
Subject: Re: AS performance with reiser4 on 2.6.3
Date: Fri, 27 Feb 2004 21:57:54 +0300
Message-ID: <403F9332.7040804@namesys.com>
References: <403EBB87.2070504@namesys.com>	<200402271704.i1RH45E19258@mail.osdl.org> <16447.31708.873806.565855@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16447.31708.873806.565855@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: markw@osdl.org, piggin@cyberone.com.au, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Nikita Danilov wrote:

>markw@osdl.org writes:
> > 
> > Yes, PostgreSQL uses fsync for its database logging.  I can certainly
> > enable the capture on copy option.  
>
>Please don't, it is not stable enough yet.
>  
>
It will be stable enough when we release on Monday though, yes?

> >                                     Does that produce something that I
> > need to manually capture?
> > 
> > Mark
>
>Nikita.
>
>
>  
>


-- 
Hans


