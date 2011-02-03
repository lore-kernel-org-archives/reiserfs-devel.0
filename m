From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 (libaal-1.0.5) segfault
Date: Thu, 03 Feb 2011 12:33:35 +0100
Message-ID: <4D4A928F.6050004@gmail.com>
References: <4D4A6540.5070401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Gu0MjzU4B1/D8Abllo7T24uyOLfvBmRPGbvqUZLm1W0=;
        b=xutQnPT1bYeWw8n5bIpRYlMo64wi0sr86G4+7pcTCcLPsY92mtLZ8C2eqObYNyFusE
         qVcVrYXaHJ1qN/47EXTk4nEyojCCgW4/3ubVAhUeQMvidFtI/ndm6RkcGekLT9HF3f+d
         iHP88nrjD3nYKKmus8b1Rcd4GMEvJlzPLC25Q=
In-Reply-To: <4D4A6540.5070401@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gleb Baryshev <gleb.baryshev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 02/03/2011 09:20 AM, Gleb Baryshev wrote:
> Hello
>
> I encountered segmentation fault when checking reiser4 partition. Here
> is fsck output:
>
>
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/sda10 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): Yes
> ***** fsck.reiser4 started at Thu Feb 3 07:39:51 2011
> Reiser4 fs was detected on /dev/sda10.
> Master super block (16):
> magic: ReIsEr4
> blksize: 4096
> format: 0x0 (format40)
> uuid: eb887ad5-6151-4076-bbac-f413f7d7f0b2
> label: SRC
>
> Format super block (17):
> plugin: format40
> description: Disk-format plugin.
> version: 0
> magic: ReIsEr40FoRmAt
> mkfs id: 0x549b325f
> flushes: 0
> blocks: 2622592
> free blocks: 1900771
> root block: 937012
> tail policy: 0x2 (smart)
> next oid: 0x45169
> file count: 107030
> tree height: 4
> key policy: LARGE
>
>
> CHECKING THE STORAGE TREE
> FSCK: extent40_repair.c: 167: extent40_check_struct: Node (932329), item
> (0), unit (0),
> [441b0:4(FB):737443434c5130:45168:0]: unallocated unit is found.
> FSCK: extent40_repair.c: 167: extent40_check_struct: Node (932329), item
> (1), unit (0),
> [441b0:4(FB):73746e38357566:45167:0]: unallocated unit is found.

Hello.

Could you please pack the metadata by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz

This kind of corruption might indicate bugs
in reiser4 kernel stuff. In what circumstances
did it happen (was it power loss, etc), and
what kernel did you use?

Thanks,
Edward.

> Read nodes 89014
> Nodes left in the tree 89014
> Leaves of them 87446, Twigs of them 1540
> Time interval: Thu Feb 3 07:39:52 2011 - Thu Feb 3 07:40:34 2011
> CHECKING EXTENT REGIONS.
> Read twigs 1540
> Time interval: Thu Feb 3 07:40:34 2011 - Thu Feb 3 07:40:36 2011
> CHECKING THE SEMANTIC TREE
> [============\ ] 25%Segmentation fault
>
>
> Backtrace from gdb:
>
>
> #0 0xb7f59a9c in aal_block_move () from /usr/local/lib/libaal-1.0.so.5
> #1 0xb7f88406 in reiser4_tree_alloc_extent () from
> /usr/local/lib/libreiser4-1.0.so.7
> #2 0xb7f83af2 in reiser4_tree_walk_node () from
> /usr/local/lib/libreiser4-1.0.so.7
> #3 0xb7f83b7a in reiser4_tree_walk_node () from
> /usr/local/lib/libreiser4-1.0.so.7
> #4 0xb7f83b7a in reiser4_tree_walk_node () from
> /usr/local/lib/libreiser4-1.0.so.7
> #5 0xb7f83d62 in reiser4_tree_adjust () from
> /usr/local/lib/libreiser4-1.0.so.7
> #6 0xb7f83db9 in reiser4_tree_mpressure () from
> /usr/local/lib/libreiser4-1.0.so.7
> #7 0xb7f84d99 in reiser4_tree_connect_node () from
> /usr/local/lib/libreiser4-1.0.so.7
> #8 0xb7f84eb6 in reiser4_tree_load_node () from
> /usr/local/lib/libreiser4-1.0.so.7
> #9 0xb7f853be in reiser4_tree_lookup () from
> /usr/local/lib/libreiser4-1.0.so.7
> #10 0xb7f80248 in tree_lookup () from /usr/local/lib/libreiser4-1.0.so.7
> #11 0xb7fa70ea in obj40_find_item () from
> /usr/local/lib/libreiser4-1.0.so.7
> #12 0xb7fa7f5e in obj40_update_body () from
> /usr/local/lib/libreiser4-1.0.so.7
> #13 0xb7fa587d in obj40_check_item () from
> /usr/local/lib/libreiser4-1.0.so.7
> #14 0xb7fab249 in reg40_check_struct () from
> /usr/local/lib/libreiser4-1.0.so.7
> #15 0xb7f67df0 in repair_object_check_struct () from
> /usr/local/lib/librepair-1.0.so.7
> #16 0xb7f6b175 in repair_semantic_check_struct () from
> /usr/local/lib/librepair-1.0.so.7
> #17 0xb7f6c966 in cb_object_traverse () from
> /usr/local/lib/librepair-1.0.so.7
> #18 0xb7f89148 in reiser4_object_traverse () from
> /usr/local/lib/libreiser4-1.0.so.7
> #19 0xb7f89165 in reiser4_object_traverse () from
> /usr/local/lib/libreiser4-1.0.so.7
> #20 0xb7f89165 in reiser4_object_traverse () from
> /usr/local/lib/libreiser4-1.0.so.7
> #21 0xb7f89165 in reiser4_object_traverse () from
> /usr/local/lib/libreiser4-1.0.so.7
> #22 0xb7f89165 in reiser4_object_traverse () from
> /usr/local/lib/libreiser4-1.0.so.7
> #23 0xb7f89165 in reiser4_object_traverse () from
> /usr/local/lib/libreiser4-1.0.so.7
> #24 0xb7f6be3f in repair_semantic () from /usr/local/lib/librepair-1.0.so.7
> #25 0xb7f6db4d in repair_check () from /usr/local/lib/librepair-1.0.so.7
> #26 0x0804af6e in main ()
>
>
> Let me know if additional details are needed or if I should apply any
> patches.
>
> Regards,
> Gleb
> --
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

