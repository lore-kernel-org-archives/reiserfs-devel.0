From: Oleg Drokin <green@namesys.com>
Subject: Re: big reiserfs regression in 2.4.20-pre2
Date: 20 Aug 2002 18:31:27 -0500
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <929.87510511211$1029886093@news.gmane.org>
References: <20020817100507.GA10770@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020817100507.GA10770@rushmore>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rwhron@earthlink.net
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hello!

On Sat, Aug 17, 2002 at 06:05:07AM -0400, rwhron@earthlink.net wrote:

> >   Is regression going away if you pass this mount option to reiserfs:
> >      -o alloc=preallocmin=4:preallocsize=9
> Yes.  

Great, I just found that we forgot to enable preallocation with new block
allocator by default. This is easily fixable of course.

Thanks for the info.

Bye,
    Oleg 
