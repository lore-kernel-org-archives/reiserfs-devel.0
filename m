From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Bug report: slab error at module removal
Date: Mon, 16 Aug 2004 18:23:17 +0400
Message-ID: <20040816142317.GH4703@backtop.namesys.com>
References: <87pt5uibur.fsf@barad-dur.crans.org> <20040815161604.GB4703@backtop.namesys.com> <87d61sjhml.fsf@barad-dur.crans.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87d61sjhml.fsf@barad-dur.crans.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Segaud <matt@minas-morgul.org>
Cc: reiserfs-list@namesys.com

On Sun, Aug 15, 2004 at 10:01:06PM +0200, Mathieu Segaud wrote:
> Alex Zarochentsev <zam@namesys.com> writes:
> 
> > On Sat, Aug 14, 2004 at 06:26:36AM +0200, Mathieu Segaud wrote:
> 
> >> slab error in kmem_cache_destroy(): cache `plugin_set': Can't free all objects
> >>  [<c0135c41>] kmem_cache_destroy+0xd1/0x130
> >>  [<f99bf57a>] plugin_set_done+0xa/0x30 [reiser4]
> >>  [<f99b9194>] shutdown_reiser4+0xf4/0x210 [reiser4]
> >>  [<c012a004>] sys_delete_module+0x144/0x180
> >>  [<c013ea9e>] unmap_vma_list+0xe/0x20
> >>  [<c013edcf>] do_munmap+0xef/0x150
> >>  [<c0103afd>] sysenter_past_esp+0x52/0x71
> 
> This does not seem to fix every leak...

ah, sorry, the fix was wrong, try this one:

diff -Nru a/plugin/plugin_set.c b/plugin/plugin_set.c
--- a/plugin/plugin_set.c	Mon Aug 16 18:21:38 2004
+++ b/plugin/plugin_set.c	Mon Aug 16 18:21:38 2004
@@ -328,7 +328,12 @@
 
 reiser4_internal void plugin_set_done(void)
 {
-	/* NOTE: scan hash table and recycle all objects. */
+	plugin_set * cur, * next;
+
+	for_all_in_htable(&ps_table, ps, cur, next) {
+		ps_hash_remove(&ps_table, cur);
+		kmem_cache_free(plugin_set_slab, cur);
+	}
 	kmem_cache_destroy(plugin_set_slab);
 	ps_hash_done(&ps_table);
 }

> I got the same message at module removal (this time the fs had been mounted,
> one of them was used to compile lirc, and each one was then umounted)
> 
> > can you try the following patch:
> >
> > # This is a BitKeeper generated diff -Nru style patch.
> > #
> > # ChangeSet
> > #   2004/08/15 20:07:10+04:00 zam@crimson.namesys.com 
> > #   plugin_set_done: first clean the hash table and free all elements, then remove the slab cache.
> > # 
> > # plugin/plugin_set.c
> > #   2004/08/15 20:07:07+04:00 zam@crimson.namesys.com +1 -1
> > #   plugin_set_done: first clean the hash table and free all elements, then remove the slab cache.
> > # 
> > diff -Nru a/plugin/plugin_set.c b/plugin/plugin_set.c
> > --- a/plugin/plugin_set.c	Sun Aug 15 20:12:29 2004
> > +++ b/plugin/plugin_set.c	Sun Aug 15 20:12:29 2004
> > @@ -329,8 +329,8 @@
> >  reiser4_internal void plugin_set_done(void)
> >  {
> >  	/* NOTE: scan hash table and recycle all objects. */
> > -	kmem_cache_destroy(plugin_set_slab);
> >  	ps_hash_done(&ps_table);
> > +	kmem_cache_destroy(plugin_set_slab);
> >  }
> >  
> 
> I forgot again to reenable DEBUG options. I will give it a try this night.
> 
> -- 
> Mathieu Segaud
> 

-- 
Alex.
