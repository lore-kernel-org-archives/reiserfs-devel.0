From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4[StorageManager(2383)]: lzo1_alloc
Date: Mon, 28 Aug 2017 15:15:34 +0200
Message-ID: <6ae2ae7d-a83e-33de-d0b7-1b3cfe3cc726@gmail.com>
References: <20170826071542.2E2333BC3E6@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------2FD39690B10E6E30B49AF4E9"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=vpEEJ5yF+XzvckS8nsRclhBqmbw5G2vATt/4K1WAxRs=;
        b=dbIbMjw699TXxelYNSjKnRJ9GuH//7ISJ5GXKm9s2cYpz4yCaDVAjRpcSue+dfwpfn
         +g3j2lfKQz4USaiy0GBayiepWjDxhj/g3wfa7dCBQjRJlFUAM8F7MuWrDEpqqUIFXv8q
         Gz/QicLf4BZApS+I7hiVEvylS+tOCWjOhQ6uBguLzVMwaKEVkaE5im+JhdQq3gxjCupo
         kAVixdfmG7CpIHCb+6xlfxJkaeZvwejFNmoo9/vg1UNTQGhjxAScjcdB6YDzO45c0dCW
         Lox+ebb5z3i3gXMv2AWywtfyA5n6XyE41u8v+9PtLL9s/K3jnJJf8rPZ9kmAtvUFnN2Q
         4KjQ==
In-Reply-To: <20170826071542.2E2333BC3E6@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Metztli Information Technology <jose@huitzilopochtli.metztli-it.com>, b747xx@gmail.com, reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------2FD39690B10E6E30B49AF4E9
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Please, try the attached patch,
it allows to proceed flushing even workspace allocation was failed.

Thanks,
Edward.

On 08/26/2017 09:15 AM, Metztli Information Technology wrote:
> On Fri, Aug 25, 2017 at 9:22 AM, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> As a possible fixup we can leave data uncompressed.
>> I think it is rather rare event (the flood of warnings is because
>> of inability to allocate workspace for the same chunk of data.
> If left unfixed in subsequent reiser4 kernel patches, (unseen) stream of 'flood of warnings' has the potential to crash the kernel.
>
>> Edward.
>>
>> On 08/25/2017 06:49 AM, Mathieu BÃ©langer wrote:
>>> I did have that bug specifically with Chromium too, I did initial try to
>>> test by disabling ALSR (I was suspecting the Ryzen silicon bug that finally
>>> can be RMA).
>>> But disabling ALSR caused more problem so ...
>>>
>>> I did "fix" the issue by recompiling Chromium with -O2 instead of -O3.
>>>
>>> And I do have similar problem with Firefox 57 compiled with -O3 (Again -O2
>>> fix it and Firefox 55 with -O3 is not affected)
> Thing is pre-built Firefox from Debian repositories did not produce warnings -- as far as random captured 2,000 chunks of dmesg output log showed -- only Chromium did.
>>> On Thu, Aug 24, 2017 at 11:42 PM, Metztli Information Technology
>>> <jose@huitzilopochtli.metztli-it.com
>>> <mailto:jose@huitzilopochtli.metztli-it.com>> wrote:
>>>
>>>
>>>
>>>      On Thu, Aug 24, 2017 at 6:01 AM, Edward Shishkin
>>>      <edward.shishkin@gmail.com <mailto:edward.shishkin@gmail.com>> wrote:
>>>      > So, memory allocation policy got changed in the upstream,
>>>      > and we need to perform pre-allocation to not fail at flush time.
>>>      > I am sorry, but right now I don't have a time for this..
>>>      No worries, sir. I simply fulfilled your request for feedback.
>>>
>>>      Background for this test was to evaluate 2TB maximum slice allowed
>>>      by Google Compute Engine in cloud instances, specifically Debian
>>>      with transparent compression reiser4.
>>>
>>>      Currently, (default) transparent compression reiser4 formatting is
>>>      not available[1] in my custom Debian-Installer (d-i) but planned
>>>      to make available in a future implementation.
>>>
>>>      >
>>>      >
>>>      > On 08/24/2017 06:59 AM, Metztli Information Technology wrote:
>>>      >>
>>>      >> Much appreciated, Ed-
>>>      >>
>>>      >> Noticed improvement, notwithstanding...
>>>      >>
>>>      >> Context:
>>>      >>
>>>      >> uname -a
>>>      >> Linux huitzilopochtli 4.12.0-1+reiser4.0.1-amd64 #1 SMP Debian
>>>      >> 4.12.6-3+reiser4.0.1 (2017-08-14) x86_64 GNU/Linux
>>>      >>
>>>      >> (I have reinstalled same kernel two times after patching so the
>>>      above
>>>      >> string retained the older original kernel installation date.
>>>      >> but
>>>      >> uname -v
>>>      >> #1 SMP Debian 4.12.6-3...[means upgrade '-3' reflects fact that
>>>      I rebuilt
>>>      >> fs with your latest two(2) patches to address the issue.])
>>>      >>
>>>      >>
>>>      >>   ls -ltc /lib/modules/4.12.0-1*64/kernel
>>>      >> total 18
>>>      >> drwxr-xr-x 14 root root 16 Aug 23 02:14 sound/
>>>      >> drwxr-xr-x  5 root root 24 Aug 23 02:13 lib/
>>>      >> drwxr-xr-x  2 root root  4 Aug 23 02:13 mm/
>>>      >> drwxr-xr-x 60 root root 62 Aug 23 02:13 fs/
>>>      >> drwxr-xr-x  3 root root 73 Aug 23 02:13 crypto/
>>>      >> drwxr-xr-x  2 root root  4 Aug 23 02:13 block/alloc workspace
>>>
>>>      >> drwxr-xr-x 51 root root 51 Aug 18 17:02 net/
>>>      >> drwxr-xr-x  3 root root  3 Aug 18 17:02 virt/
>>>      >> drwxr-xr-x 70 root root 70 Aug 18 17:02 drivers/
>>>      >> drwxr-xr-x  3 root root  3 Aug 18 17:02 arch/
>>>      >>
>>>      >> After applying (fs/) patches and rebooting, I began to apply
>>>      load to the
>>>      >> machine where with previous kernel I had already built
>>>      GCC-5-branch and
>>>      >> Apache OpenOffice. Memory is limited to 16Gb RAM; copy
>>>      operations were
>>>      >> started from 1TB USB disk to local reiser4 transparent
>>>      compression, a  16Gb
>>>      >> data copy to same local filesystem, began a 2Gb svn download,
>>>      etc.; I had
>>>      >> Firefox open with several tabs open and launched chromium
>>>      browser -- which
>>>      >> began producing relevant feedback. I have set a two(2) thousand
>>>      lines limit
>>>      >> output in my shell so that is the reason *all* of the below
>>>      WARNINGS repeat
>>>      >> that number of times.
>>>      >>
>>>      >> Chromium browser launched but app did not open in the GUI and
>>>      got stuck
>>>      >> with un-killable processes (memory starvation?):
>>>      >>
>>>      >> % kill -9 $(pgrep chromium)
>>>      >> % pgrep chromium
>>>      >> 6320
>>>      >> 6743
>>>      >> 6814
>>>      >> 7050
>>>      >>
>>>      >> Subsequently dmesg showed (<process number>) none necessarily
>>>      in the order
>>>      >> below as dmesg alternated in producing sequence:
>>>      >>
>>>      >> [ 6175.145234] reiser4[chromium(7050)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 6175.145248] reiser4[chromium(7050)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 6175.145261] reiser4[chromium(7050)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 6175.145275] reiser4[chromium(7050)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> (snip)
>>>      >>
>>>      >> [ 7116.052780] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7116.053021] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7116.053044] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7116.055925] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> (snip)
> It is not only Chromium, as 'TaskSchedulerBa...' aggregated to the warning stream. Accordingly, application(s) generating the warning may vary.  It just happened that I decided to launch Chromium in this particular instance for elaboration.
>
>>>      >>
>>>      >> [ 7309.117294] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7309.117305] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7309.117316] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7309.117327] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7309.117338] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> (snip)
>>>      >>
>>>      >> [ 7550.849425] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7550.849436] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7550.849446] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >>
>>>      >> [ 7550.849457] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>>>      >>
>>>     
>>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>                 WARNING: alloc workspace for lzo1 (tfm action =
>>>      1) failed
>>>      >> (snip)
>>>      >>
>>>      >>
>>>      >> On Tue, Aug 22, 2017 at 11:49 AM, Edward Shishkin
>>>      >> <edward.shishkin@gmail.com <mailto:edward.shishkin@gmail.com>>
>>>
>>>      wrote:
>>>      >>>
>>>      >>> Hello,
>>>      >>>
>>>      >>> Please, try the attached patches.
>>>      >>> The first patch improves responsiveness to vm subsystem
>>>      >>> (modified version of ->migratepage() from Ivan Shapovalov).
>>>      >>> The second patch performs memory allocation in the critical
>>>      >>> place with __GFP_NOFAIL flag.
>>>      >>> Let us know about results.
>>>      >>>
>>>      >>> Thanks,
>>>      >>> Edward.
>>>      >>
>>>      >> []
>>>      >>>>
>>>      >>>> Your input would be greatly appreciated:
>>>      >>>>
>>>      >>>> [ 3449.944653] reiser4[StorageManager(2383)]: lzo1_alloc
>>>      >>>>
>>>      >>>>
>>>     
>>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>>>                  WARNING: alloc workspace for lzo1 (tfm
>>>      action = 1)
>>>      >>>> failed
>>>      >>>>
>>>      >>>> [ 3449.944674] reiser4[StorageManager(2383)]: lzo1_alloc
>>>      >>>>
>>>      >>>>
>>>     
>>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>>>                  WARNING: alloc workspace for lzo1 (tfm
>>>      action = 1)
>>>      >>>> failed
>>>      >>>>
>>>      >>>> [ 3449.944694] reiser4[StorageManager(2383)]: lzo1_alloc
>>>      >>>>
>>>      >>>>
>>>     
>>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>>>                  WARNING: alloc workspace for lzo1 (tfm
>>>      action = 1)
>>>      >>>> failed
>>>      >>>>
>>>      >>>> [ 3449.944715] reiser4[StorageManager(2383)]: lzo1_alloc
>>>      >>>>
>>>      >>>>
>>>     
>>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>      >>>>                  WARNING: alloc workspace for lzo1 (tfm
>>>      action = 1)
>>>      >>>> failed
>>>      >>>>
>>>      >>>> [snip]
>>>      >>
>>>      >> This time dmesg did not output any references to
>>>      [StorageManager(<pid>)]
>>>      >>
>>>      >>
>>>      [1] but default reiser4 formatting can be performed from the
>>>      command line in another virtual terminal.
>>>
> In other developments, I am engaged in a GRUB2 hack quest which, if successful, has the potential to add native reiser4 boot detection to GRUB2; that way, a separate ext2 /boot partition will not be required.
>
>
> Best Professional Regards.
>


--------------2FD39690B10E6E30B49AF4E9
Content-Type: text/x-patch;
 name="reiser4-dont-prealloc-workspace-for-compression.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-dont-prealloc-workspace-for-compression.patch"

diff --git a/plugin/compress/compress.c b/plugin/compress/compress.c
index a574933..2a263ea 100644
--- a/plugin/compress/compress.c
+++ b/plugin/compress/compress.c
@@ -80,15 +80,10 @@ static coa_t gzip1_alloc(tfm_action act)
 		}
 		break;
 	default:
-		impossible("edward-767",
-			   "trying to alloc workspace for unknown tfm action");
+		impossible("edward-767", "unknown tfm action");
 	}
-	if (ret) {
-		warning("edward-768",
-			"alloc workspace for gzip1 (tfm action = %d) failed\n",
-			act);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 	return coa;
 }
 
@@ -232,15 +227,10 @@ static coa_t lzo1_alloc(tfm_action act)
 	case TFMA_READ:		/* decompress */
 		break;
 	default:
-		impossible("edward-877",
-			   "trying to alloc workspace for unknown tfm action");
+		impossible("edward-877", "unknown tfm action");
 	}
-	if (ret) {
-		warning("edward-878",
-			"alloc workspace for lzo1 (tfm action = %d) failed\n",
-			act);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 	return coa;
 }
 
diff --git a/plugin/file/cryptcompress.c b/plugin/file/cryptcompress.c
index e1a3449..694680b 100644
--- a/plugin/file/cryptcompress.c
+++ b/plugin/file/cryptcompress.c
@@ -1103,12 +1103,12 @@ int reiser4_deflate_cluster(struct cluster_handle * clust, struct inode * inode)
 		assert("edward-1423", coplug->compress != NULL);
 
 		result = grab_coa(tc, coplug);
-		if (result) {
-		    warning("edward-1424",
-			    "alloc_coa failed with ret=%d, skipped compression",
-			    result);
-		    goto cipher;
-		}
+		if (result)
+			/*
+			 * can not allocate memory to perform
+			 * compression, leave data uncompressed
+			 */
+			goto cipher;
 		result = grab_tfm_stream(inode, tc, OUTPUT_STREAM);
 		if (result) {
 		    warning("edward-1425",
diff --git a/plugin/item/ctail.c b/plugin/item/ctail.c
index 3f46c38..dc1aa9d 100644
--- a/plugin/item/ctail.c
+++ b/plugin/item/ctail.c
@@ -1252,7 +1252,6 @@ static int attach_convert_idata(flush_pos_t * pos, struct inode *inode)
 	struct convert_item_info *info;
 	struct cluster_handle *clust;
 	file_plugin *fplug = inode_file_plugin(inode);
-	compression_plugin *cplug = inode_compression_plugin(inode);
 
 	assert("edward-248", pos != NULL);
 	assert("edward-249", pos->child != NULL);
@@ -1273,9 +1272,7 @@ static int attach_convert_idata(flush_pos_t * pos, struct inode *inode)
 		reset_convert_data(pos->sq);
 
 	clust = &pos->sq->clust;
-	ret = grab_coa(&clust->tc, cplug);
-	if (ret)
-		goto err;
+
 	ret = set_cluster_by_page(clust,
 				  jnode_page(pos->child),
 				  MAX_CLUSTER_NRPAGES);

--------------2FD39690B10E6E30B49AF4E9--
