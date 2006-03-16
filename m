From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29
Date: Thu, 16 Mar 2006 20:35:01 +0300
Message-ID: <200603162035.01567.zam@namesys.com>
References: <20060315075034.GC17577@zeus.uziel.local> <200603161028.38749.zam@namesys.com> <20060316171928.GA22618@zeus.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060316171928.GA22618@zeus.uziel.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: reiserfs-list@namesys.com

On Thursday 16 March 2006 20:19, Christian Trefzer wrote:
> Hi zam,
>
> On Thu, Mar 16, 2006 at 10:28:37AM +0300, Alexander Zarochentsev 
wrote:
> > I guess it was in release_unix_file where get_exclusive_access is
> > called outside reiser4_context.
> >
> > can you please replace the old patch by the attached one?
>
> Sure I can, but so far I did not have any further trouble after
> applying your first patch. 

Thanks.

I looked one more time at my second patch and realized now that is it 
not needed, it solves problem which can't happen.  I was thinking too 
much trying to invent a situation where the first patch fails :)

> It seems to me that exchanging the two 
> patches won't bring the BUG back, so I will report in a few days with
> something along the lines of "thank you very much". You will, on the
> other hand, definitely hear from me if the thing BUGs on me again ; )
>
> Thanks for your time!
>
> Chris

-- 
Alex.
