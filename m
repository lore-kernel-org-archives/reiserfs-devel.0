From: Vince <fuzzy77@free.fr>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Mon, 23 Feb 2004 20:35:08 +0100
Message-ID: <403A55EC.1050005@free.fr>
References: <1077165373.22253.45.camel@watt.suse.com>	 <200402231042.08173.Dieter.Nuetzel@hamburg.de> <1077563494.23061.163.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1077563494.23061.163.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>

Chris Mason wrote:

> Also fixed.  Patches 00* will get submitted to Andrew as soon as namesys
> reviews them.
> 
> There are going into the suse kernel now too, it's time for some broader
> testing.
> 
> -chris
> 
> 

  Those patches make use of the ->journal_info field ... which is on the 
other hand removed in the reiser4 kernel patch, so both patches conflict :-/
  Is there any way to get both reiser4 and reiser3+data-logging in the 
same kernel ? Would adding back the journal_info field be enough ?

Compilation with a reiser4-patched kernel fails with:

/usr/src/linux$ make
   CHK     include/linux/version.h
   CC      scripts/empty.o
   MKELF   scripts/elfconfig.h
   HOSTCC  scripts/file2alias.o
   HOSTCC  scripts/modpost.o
   HOSTCC  scripts/sumversion.o
   HOSTLD  scripts/modpost
   CC      arch/i386/kernel/asm-offsets.s
   CHK     include/asm-i386/asm_offsets.h
   CHK     include/linux/compile.h
   CC      fs/buffer.o
   CC      fs/reiserfs/bitmap.o
In file included from fs/reiserfs/bitmap.c:8:
include/linux/reiserfs_fs.h: In function `reiserfs_transaction_running':
include/linux/reiserfs_fs.h:1753: error: structure has no member named 
`journal_info'
make[2]: *** [fs/reiserfs/bitmap.o] Error 1
make[1]: *** [fs/reiserfs] Error 2
make: *** [fs] Error 2


/usr/src/linux$ zgrep journal_info ../2004.02.06.all.diff.gz
-       current->journal_info = handle;
-               current->journal_info = NULL;
-       current->journal_info = NULL;
-       .journal_info   = NULL,
-       return current->journal_info;
-       void *journal_info;
+       result = init_journal_info(s);
+               done_journal_info(s);
+       done_journal_info(s);

