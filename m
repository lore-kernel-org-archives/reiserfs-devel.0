From: Edward Shishkin <edward@namesys.com>
Subject: Re: Nikita 19891
Date: Wed, 11 Jul 2007 23:48:43 +0400
Message-ID: <4695341B.3000303@namesys.com>
References: <20070711044617.GA12129@efil.de> <1184128537.10438.16.camel@gentoo>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030000010608020906010103"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1184128537.10438.16.camel@gentoo>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Ingo Bormuth <ibormuth@efil.de>, reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------030000010608020906010103
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jake Maciejewski wrote:

>I've hit the same panic looping kernel builds (while true ; do make
>mrproper ; make allmodconfig ; make -j4 ; done) on 2.6.21.1 with the
>Namesys patch and reiser4 debug enabled. I've seen it on my amd64
>desktop and x86 laptop.
>
>Another one I've seen is:
>        reiser4 panicked cowardly: reiser4[fixdep(16043)]: sibling_list_remove (fs/reiser4/tree_walk.c:814)[zam-32245]
>
>In both cases the fsck didn't find anything, as you observed.
>
>On Wed, 2007-07-11 at 06:46 +0200, Ingo Bormuth wrote:
>  
>
>>Hmm, whenever I try to build busybox (1.4.2) I get nikita-191 panics:
>>
>>[...]
>>cc	console_tools/clear.o
>>reiser4 panicked cowardly: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
>>kernel panic - not syncing: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
>>    
>>

Somebody missed set_file_hint(), which synchronizes the coords.
Unfortunately I can not reproduce it. Would you please (if possible)
catch the stack with the attached patch?

>>Running fsck.reiser4 before and after the panic doesn't show any complaints.
>>The partition is heavily used. I'm not aware of any other problem.
>>
>>Vanilla-2.6.21.6 (kernel.org) with reiser4-2.6.21-path (namesys.com).
>>
>>Not that I understood the code, but why is it an assertion at all?
>>Couldn't one just use an empty hint if the current one is invalid?
>>    
>>

Sure, it is possible to not use it at all. But if the current one is valid,
it would be nice to use it to avoid tree traversal with waiting for 
possible locks, etc..

Thanks,
Edward.

--------------030000010608020906010103
Content-Type: text/x-patch;
 name="reiser4-tmp-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-tmp-fix.patch"

--- linux-2.6.22-rc6-mm1/fs/reiser4/plugin/file/file.c.orig
+++ linux-2.6.22-rc6-mm1/fs/reiser4/plugin/file/file.c
@@ -707,8 +707,12 @@
 		return;
 	fsdata = reiser4_get_file_fsdata(file);
 	assert("vs-965", !IS_ERR(fsdata));
-	assert("nikita-19891",
-	       coords_equal(&hint->seal.coord1, &hint->ext_coord.coord));
+#if REISER4_DEBUG
+	if (!coords_equal(&hint->seal.coord1, &hint->ext_coord.coord)) {
+		dump_stack();
+		for (; 1 ;) {;}
+	}
+#endif
 	assert("vs-30", hint->lh.owner == NULL);
 	spin_lock_inode(file->f_dentry->d_inode);
 	fsdata->reg.hint = *hint;

--------------030000010608020906010103--
