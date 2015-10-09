From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Fri, 09 Oct 2015 22:23:51 +0200
Message-ID: <56182257.7060304@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>	 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>	 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080703030801090506040204"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type;
        bh=R6ki1iyDYh6livvsMwiUxypse3An8J+AbaKu7ft9fJU=;
        b=mqJiMvdAT87v7m1uLL5Hi6hLn5W3sNU7MTF45uP32T+pUrqQIwU8dmLVU3iHfjfRNC
         OmI4mzSDEH64fn2TFGgcUiH7XsRbVYexvWrR/lbzlNN/nZ4yo2AmORWiXDfcVgepkIT6
         WrzseIygjy8ZIkfLATSbscl1u3J56B+anFRa446U0yLw5v7+eFQ5jPT3BZWo4ZgSernC
         wRVHeN4U2bEjdlHbNBcXPXHPDgaOirU/ZBxxd/y1/Hbz8O00jqIHjN+yU6E+LEOJEuXq
         tj/zV7z+I9lMBEeiV3OL1V6FSAcIgit/Ei2oRSBv7mH6+zuTafRu4AAqIMxyWaNkXh8X
         uSMg==
In-Reply-To: <1444410842.2213.5.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: Oleg Drokin <green@linuxhacker.ru>

This is a multi-part message in MIME format.
--------------080703030801090506040204
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2015 07:14 PM, Ivan Shapovalov wrote:
> On 2015-10-09 at 16:55 +0200, Edward Shishkin wrote:
>> On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:
>>> On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
>>>> Hi Ivan,
>>>>
>>>> On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
>>>>> Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sou
>>>>> rcef
>>>>> orge.net/msg02745.html
>>>> Do you have a stack trace for reiser4?
>>>> How to reproduce it?
>>> I'll rebuild the kernel without the fix and provide you with the
>>> oops'
>>> stacktrace asap.
>>>
>>> I guess that it's tied to the config. In my case, it is
>>> reproducible on
>>> each boot, just as the DE starts up and something issues the first
>>> fsync().
>>
>> Yes, let's try to find the culprit who doesn't set i_wb...
> So, here are the traces I've got after adding an
> assert(PageDirty(node->pg)) to queue_jnode():
> /* captured by hand as these are panics, not oopses */
>
> 1.
>
> queue_jnode()
> unformatted_make_reloc()
> assign_real_blocknrs()
> forward_relocate_unformatted()
> forward_alloc_unformatted_journal()
> ? coord_num_units()
> handle_pos_on_twig()
> flush_current_atom()
> flush_some_atom()
> reiser4_writeout()
> reiser4_writeback_inodes()
> <...>
>
> 2.
>
> znode_make_reloc()
> forward_alloc_formatted_wa()
> ? zload_ra()
> allocate_znode()
> alloc_pos_and_ancestors()
> flush_current_atom()
> reiser4_txn_end()
> ? reiser4_txn_end()
> reiser4_txn_restart_current()
> force_commit_atom()
> ? reiser4_txn_restart_current()
> txnmgr_force_commit_all()
> writepages_cryptcompress()
> reiser4_writepages_dispatch()
> <...>
> sys_fsync()
>


Thanks Ivan.
Not a good news, TBH...

For formatted nodes we can continue to narrow down the problem
(see the attached patch). For unformatted nodes only code review
can help. Normally, all modifications of unformatted nodes should
look like the following:

struct page *page = jnode_page(node);
lock_page(page);
char *data = kmap(page);
/* modifications are going here */
kunmap(page);
set_page_dirty_nobuffers(page); /* somebody forgets to do this */
unlock_page(page);

Modifications of formatted nodes should look like the following:

longterm_lock_znode(node);
zload(node);
/* modifications are going here */
zrelse(node);
znode_make_dirty(node); /* somebody forgets to do this */
longterm_unlock_znode();

Anyway, we can use your patch 3 as a temporal fixup.

Thanks,
Edward.

--------------080703030801090506040204
Content-Type: text/x-patch;
 name="reiser4-debug-formatted-make-dirty.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-debug-formatted-make-dirty.patch"

---
 fs/reiser4/lock.c |    5 +++++
 1 file changed, 5 insertions(+)

--- a/fs/reiser4/lock.c
+++ b/fs/reiser4/lock.c
@@ -641,6 +641,11 @@ void longterm_unlock_znode(lock_handle *
 			zput(node);
 			return;
 		}
+		if (znode_page(node) != NULL)
+			if (!PageDirty(znode_page(node))) {
+				warning("", "releasing last write-lock, but page is fishily clean");
+				dump_stack();
+			}
 	}
 
 	if (handle->signaled)

--------------080703030801090506040204--
