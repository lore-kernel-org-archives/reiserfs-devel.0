From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 13:30:55 +0000
Message-ID: <5239AB0F.6070600@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com> <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com> <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so> <5238D17D.1080806@gmail.com> <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so> <523944D2.40409@gmail.com> <20130918062035.Horde.3REQSHqc8XUbgvTNKMOnnw1@mail.thieu.so> <52394C69.8060702@gmail.com> <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so> <52394F6B.5000902@gmail.com> <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=+ywREWNbVwm4LsU9rbYahJTmhU+sKICNT3gL+PUsxH4=;
        b=awYmf0vgCzZdBiGd/YPAkNcVCw4SXWWf4GliqJX7e5jjFliizbcl9VlPTAiyoByK9Z
         iSNAplr+KXDztZ8xwg8iNkSZpRHHMepFjj2Gsc9wTiQaYdEb+d2BoKXyRPrq9PJUaUEe
         9JU67ni/CLiAuT7S9YULROc9mdMeeO2jKyRo8hx85dfkzkn/tfuMT+TUYhHrlmWyXZBO
         uzJxq+QhwICPdUmgmlWhE/MZuHx6XUYTPI9KQ5aEtnwKXA4dGN0HnlZXPVPgoP/1kl6t
         vGRwBz775x+v0NNl5E/hPBtUNDRf1ud+H9BrPLvilLDeq2l+JsuH4cOvzpeW+GcSbcCC
         Pvog==
In-Reply-To: <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Evgeniy <iron.udjin@gmail.com>
Cc: Mathieu Belanger <m@thieu.so>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

By the way I'm sure you've all heard of Google PerfTools.

There is a component in it called TcMalloc -- libtcmalloc.so.

If you put LD_PRELOAD="/usr/lib64/libtcmalloc.so /usr/lib64/libdl.so" in
your .bashrc or whatever startup files it seems to make all operations,
including file input/output faster.  SImilar to the Hoard memory
allocator, but I think I trust Google development more. 

Point being, works with Reiser 4 and adds no complexity or problems to
the mix.

Chris



On 09/18/13 13:20, Evgeniy wrote:
> Hello guys,
>
> FIrst of all, I'm not a programmer. Today I was playing a little bit
> with current version reiser4 for 3.11 kernel and it seems I fixed the
> the problem with compilation. I did't have posibility to test it yet.
> But at least it compilles fine. Here is patch for branch
> reiser4-for-3.11 (https://github.com/DestroyFX/reiser4).
>
> diff -Naur reiser4-3.11/fs/reiser4/fsdata.c linux-3.11.1/fs/reiser4/fsdata.c
> --- reiser4-3.11/fs/reiser4/fsdata.c 2013-09-18 14:31:22.065970590 +0300
> +++ linux-3.11.1/fs/reiser4/fsdata.c 2013-09-18 15:58:30.836601962 +0300
> @@ -16,7 +16,7 @@
>  static unsigned long d_cursor_unused = 0;
>
>  /* spinlock protecting manipulations with dir_cursor's hash table and lists */
> -DEFINE_SPINLOCK(d_lock);
> +DEFINE_SPINLOCK(d_lockref);
>
>  static reiser4_file_fsdata *create_fsdata(struct file *file);
>  static int file_is_stateless(struct file *file);
> @@ -36,7 +36,7 @@
>   if (sc->nr_to_scan != 0) {
>   dir_cursor *scan;
>
> - spin_lock(&d_lock);
> + spin_lock(&d_lockref);
>   while (!list_empty(&cursor_cache)) {
>   scan = list_entry(cursor_cache.next, dir_cursor, alist);
>   assert("nikita-3567", scan->ref == 0);
> @@ -45,7 +45,7 @@
>   if (sc->nr_to_scan == 0)
>   break;
>   }
> - spin_unlock(&d_lock);
> + spin_unlock(&d_lockref);
>   }
>   return d_cursor_unused;
>  }
> @@ -277,13 +277,13 @@
>   if (fsdata != NULL) {
>   cursor = fsdata->cursor;
>   if (cursor != NULL) {
> - spin_lock(&d_lock);
> + spin_lock(&d_lockref);
>   --cursor->ref;
>   if (cursor->ref == 0) {
>   list_add_tail(&cursor->alist, &cursor_cache);
>   ++d_cursor_unused;
>   }
> - spin_unlock(&d_lock);
> + spin_unlock(&d_lockref);
>   file->private_data = NULL;
>   }
>   }
> @@ -350,12 +350,12 @@
>   file->private_data = fsdata;
>   fsdata->cursor = cursor;
>   spin_unlock_inode(inode);
> - spin_lock(&d_lock);
> + spin_lock(&d_lockref);
>   /* insert cursor into hash table */
>   d_cursor_hash_insert(&info->table, cursor);
>   /* and chain it into radix-tree */
>   bind_cursor(cursor, (unsigned long)oid);
> - spin_unlock(&d_lock);
> + spin_unlock(&d_lockref);
>   radix_tree_preload_end();
>   file->f_pos = ((__u64) cursor->key.cid) << CID_SHIFT;
>   }
> @@ -398,7 +398,7 @@
>   oid = get_inode_oid(inode);
>   spin_lock_inode(inode);
>   head = get_readdir_list(inode);
> - spin_lock(&d_lock);
> + spin_lock(&d_lockref);
>   /* find any cursor for this oid: reference to it is hanging of radix
>   * tree */
>   start = lookup(info, (unsigned long)oid);
> @@ -433,7 +433,7 @@
>   scan = next;
>   } while (scan != start);
>   }
> - spin_unlock(&d_lock);
> + spin_unlock(&d_lockref);
>   /* check that we killed 'em all */
>   assert("nikita-3568",
>         ergo(act == CURSOR_KILL,
> @@ -548,7 +548,7 @@
>
>   key.cid = pos >> CID_SHIFT;
>   key.oid = get_inode_oid(inode);
> - spin_lock(&d_lock);
> + spin_lock(&d_lockref);
>   cursor = d_cursor_hash_find(&d_info(inode)->table, &key);
>   if (cursor != NULL) {
>   /* cursor was found */
> @@ -559,7 +559,7 @@
>   }
>   ++cursor->ref;
>   }
> - spin_unlock(&d_lock);
> + spin_unlock(&d_lockref);
>   if (cursor != NULL) {
>   spin_lock_inode(inode);
>   assert("nikita-3556", cursor->fsdata->back == NULL);
> diff -Naur reiser4-3.11/fs/reiser4/fsdata.h linux-3.11.1/fs/reiser4/fsdata.h
> --- reiser4-3.11/fs/reiser4/fsdata.h 2013-09-18 14:31:22.065970590 +0300
> +++ linux-3.11.1/fs/reiser4/fsdata.h 2013-09-18 15:56:44.438932116 +0300
> @@ -189,7 +189,7 @@
>  };
>
>  /* spinlock protecting readdir cursors */
> -extern spinlock_t d_lock;
> +extern spinlock_t d_lockref;
>
>  /* __REISER4_FSDATA_H__ */
>  #endif
> diff -Naur reiser4-3.11/fs/reiser4/plugin/file/file.c
> linux-3.11.1/fs/reiser4/plugin/file/file.c
> --- reiser4-3.11/fs/reiser4/plugin/file/file.c 2013-09-18
> 14:31:22.071970515 +0300
> +++ linux-3.11.1/fs/reiser4/plugin/file/file.c 2013-09-18
> 16:00:04.635429315 +0300
> @@ -2318,7 +2318,7 @@
>   uf_info = unix_file_inode_data(inode);
>
>   get_exclusive_access_careful(uf_info, inode);
> - if (file->f_dentry->d_count == 1 &&
> + if (file->f_dentry->d_lockref.count == 1 &&
>      uf_info->container == UF_CONTAINER_EXTENTS &&
>      !should_have_notail(uf_info, inode->i_size) &&
>      !rofs_inode(inode)) {
>
> On 18 September 2013 09:59, Chris Gentile <cnjgentile@gmail.com> wrote:
>> Don't know how to code  :(
>>
>> I am in include/linux/dcache.h right now at the first line where the
>> error occurs...  I wonder where  I put one of the characters it suggests??
>> The line reads: (gives same error as you mentioned)
>>
>> #define d_lock  d_lockref.lock
>>
>> I guess it needs some type of character before the period?? What do you
>> think?
>>
>>
>>
>>
>> On 09/18/13 06:54, Mathieu Belanger wrote:
>>> you can edit the code directly.
>>>
>>> Tell me if it compile after that.
>>> If it compile you can make a patch with git (git diff >
>>> /tmp/patch.patch) or you can clone, work on your clone, commit and do
>>> a pull request so I can add it.
>>>
>>> I can also add you as maintainer if you want to work directly on it.
>>>
>>>
>>>
>>> Also, I get that error with 3.11 and 3.12-rc1 but not with 3.11-rc4 :
>>>
>>> In file included from fs/reiser4/super.h:14:0,
>>>                  from fs/reiser4/debug.c:28:
>>> fs/reiser4/fsdata.h:192:19: error: expected '=', ',', ';', 'asm' or
>>> '__attribute__' before '.' token
>>>
>>>
>>>
>>> 3.11-rc4 compile fine.

