From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Bug in plugin/object/obj40/obj40_repair.c
Date: Thu, 28 Aug 2003 15:36:28 +0400
Message-ID: <200308281536.28393.vitaly@namesys.com>
References: <3F4DE72A.60306@davehollis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F4DE72A.60306@davehollis.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David T Hollis <dhollis@davehollis.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>


Hi David,

On Thursday 28 August 2003 15:27, David T Hollis wrote:
> I was having trouble compiling reiser4progs due to warnings being
> treated as errors and came across this function that GCC reported 'info
> possibly being used uninitialized'.  In looking at it, it does look
> bad.  Info is never assigned to anything before it is being accessed. I
> don't know what it is supposed to point to so I can't provide a patch at
> this time, but I thought I'd bring it up.
>
>
> /* Checks that @obj->info.start is SD of the wanted file.  */
> errno_t obj40_stat(obj40_t *obj, stat_func_t stat_func) {
>         object_info_t *info;
>         errno_t res;
>
>
>         aal_assert("vpf-1200", obj != NULL);
>
>
>         if (!info->start.plug) {
> ^^^^^^^^^^^^^^^^^^^^^
>                 if (!obj->core->tree_ops.valid(info->tree, &info->start))
>                         return RE_FATAL;

thank you for the report, I am fixing it now.

-- 
Thanks,
Vitaly Fertman
