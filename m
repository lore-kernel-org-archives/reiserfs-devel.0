From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: build failure 11/05 snapshot
Date: Tue, 12 Nov 2002 15:06:49 +0300
Message-ID: <15824.61145.425680.783111@laputa.namesys.com>
References: <Nikita@namesys.com>
	<15823.65288.345634.69230@laputa.namesys.com>
	<200211112053.gABKrDf29415@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200211112053.gABKrDf29415@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cliff White <cliffw@osdl.org>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Cliff White writes:
 > Code now builds, module will not install:
 > 
 >  modprobe reiser4
 > /lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o: unresolved symbol 
 > balance_dirty_pages

Hmm. This is strange. balance_dirty_pages() is marked
EXPORT_SYMBOL_GPL() in mm/page-writeback.c.

 > /lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o: unresolved symbol 
 > page_states__per_cpu

Yes, this is known bug in the handling of exports of per-cpu data. Try
this patch (by Rusty Russell):
----------------------------------------------------------------------
diff -urpN --exclude TAGS -X /home/rusty/devel/kernel/kernel-patches/current-dontdiff \
--minimal linux-2.5.45/include/asm-generic/percpu.h \
                working-2.5.45-tmp/include/asm-generic/percpu.h
--- linux-2.5.45/include/asm-generic/percpu.h	2002-10-31 12:36:56.000000000 +1100
+++ working-2.5.45-tmp/include/asm-generic/percpu.h	2002-11-02 09:20:06.000000000 \
+1100 @@ -35,4 +35,10 @@ extern unsigned long __per_cpu_offset[NR
 #define EXPORT_PER_CPU_SYMBOL(var) EXPORT_SYMBOL(var##__per_cpu)
 #define EXPORT_PER_CPU_SYMBOL_GPL(var) EXPORT_SYMBOL_GPL(var##__per_cpu)
 
+/* Genksyms can't follow the percpu declaration.  Give it a fake one. */
+#ifdef __GENKSYMS__
+#undef DEFINE_PER_CPU
+#define DEFINE_PER_CPU(type, name) type name##__per_cpu
+#endif /*__GENKSYMS__*/
+
 #endif /* _ASM_GENERIC_PERCPU_H_ */
----------------------------------------------------------------------

 > /lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o: insmod 
 > /lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o failed
 > /lib/modules/2.5.47-rfs/kernel/fs/reiser4/reiser4.o: insmod reiser4 failed
 > -------------
 > Will be re-trying on a different machine.
 > Will try to build reiser4 into the kernel this time.
 > cliffw

Nikita.

 > 
 > 
