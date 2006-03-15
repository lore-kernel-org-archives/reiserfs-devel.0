From: Andreas =?iso-8859-1?Q?Sch=E4fer?= <gentryx@gmx.de>
Subject: Re: State of the Reiser4 FS
Date: Wed, 15 Mar 2006 09:57:45 +0100
Message-ID: <20060315085745.GA21609@wintermute>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com> <1142336718.7415.55.camel@tribesman.namesys.com> <194f62550603140732j6ef10757j@mail.gmail.com> <4417BEC4.6060506@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4417BEC4.6060506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On 23:14 Tue 14 Mar     , Hans Reiser wrote:
> I generally believe that the per 4k
> approach used throughout the linux kernel is not as CPU efficient as
> sending larger groups of pages through the layers all at once.  In other
> words, there is a reason we have bios, and we need to learn the lesson
> from them that they teach us, and abstract it into a general design
> approach.

This is a bit OT, but still: I think you're absolutely right there. This 4k 
approach causes funny thing even in completely different areas. 

I've recently been playing around with openMosix (transparent process 
migration between Linux hosts over the network) and there the write 
preformance is totally spoiled (>50% performance loss) just because 
copy_from_user is only called for 4k block when writing (and these 
requests then suffer from the high network latency). 

If larger blocks would be used, this performance flaw wouldn't exist at 
all... Just my 2 cents

-Andreas
