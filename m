From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Fri, 8 Nov 2002 20:25:48 +0300
Message-ID: <15819.62364.997716.421729@laputa.namesys.com>
References: <9918235451.20021106132043@kgpa.ru>
	<20021107090256.GC11974@mrball.net>
	<15818.17585.789642.675479@laputa.namesys.com>
	<20021108162743.GA21976@mrball.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11950-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021108162743.GA21976@mrball.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Todd Lyons <todd@mrball.net>
Cc: ReiserFS-List <reiserfs-list@Namesys.COM>

Todd Lyons writes:
 > Nikita Danilov wanted us to know:
 > 
 > > > Still compiling.  In the reiser4 code right now....well, it built and
 > > > linked.  That's a good sign.
 > 
 > It compiled and installed, but it doesn't load:
 > 
 > [root@trip ~]# modprobe reiser4
 > /lib/modules/2.5.45-3/kernel/fs/reiser4/reiser4.o: unresolved symbol
 > page_states__per_cpu
 > modprobe: insmod /lib/modules/2.5.45-3/kernel/fs/reiser4/reiser4.o failed
 > modprobe: insmod reiser4 failed
 > 
 > > > Curious if anybody feels that I should have chosen different values for
 > > > any of the options.
 > >Reasonable options for debugging. Will result in dead-slow reiser4 though.
 > 
 > Ok, will remove the debugging options.  In the meantime, gotta figure
 > out why it's got that unresolved symbol.

This is bug in the handling of per-cpu variables. Andrew Morton and
Rusty Russell posted patches to fix it. Here is one:
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

Please let me know whether this helps.

Alternatively, you can compile reiser4 as built-in (not module), or
disable module versioning.

Nikita.
