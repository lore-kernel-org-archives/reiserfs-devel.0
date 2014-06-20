From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4progs: possible off-by-one in librepair/twig_scan.c?
Date: Fri, 20 Jun 2014 02:12:02 +0200
Message-ID: <53A37C52.5050006@gmail.com>
References: <1559792.K1g2CRjlCX@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=/88lSgmMpQTSCn68AaAwcKIZwIkDW56srH4gAwSfEgM=;
        b=tw4N5BTPfPPt6uskMtgS8ojablKMY+JPyYXw6krsIA045fcHm9sOhMxNCl2HapjBdY
         g+dfm8gA2qLRs+sS3EFriYN94caaTEFwUWwOcVjKCLj855ZwC+szPBWvWucJUlOPhbla
         TfIaVU6zZj8fmDw6NRoy0/jBMurrYEB9q8//H06hQwJRDAyO764oFx1CRp2oEdGqJZMC
         y4pf5aWwGz/2naic0Scfg1K6BbWiNGNjTPp+60bXGKQMgbDdNaLHU0K03d+/7D8VO1Px
         LXqFuikyzmrTsUfV4ccnn1P07kx65/Hq6m0mCUhYfLU/rchc4tvqjw3IcPWl6Z/SJyP3
         fu+w==
In-Reply-To: <1559792.K1g2CRjlCX@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 06/20/2014 01:18 AM, Ivan Shapovalov wrote:
> I've got a strange fsck complaint while testing the rewritten discard.
> The fsck log is here (not line-wrapped):
>
> ====LOG====
>
> $ fsck.reiser4 /dev/disk/by-label/linux-build
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/disk/by-label/linux-build block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): y
> ***** fsck.reiser4 started at Fri Jun 20 02:49:22 2014
> Reiser4 fs was detected on /dev/disk/by-label/linux-build.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           73831051-68e1-4848-b9ea-83f9703558b6
> label:          linux-build
>   
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        0
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x143b8ccd
> flushes:        0
> blocks:         2621440
> free blocks:    542951
> root block:     69897
> tail policy:    0x2 (smart)
> next oid:       0x21c6d1
> file count:     182200
> tree height:    4
> key policy:     LARGE
>   
>   
> CHECKING THE STORAGE TREE
>          Read nodes 239320
>          Nodes left in the tree 239320
>                  Leaves of them 236133, Twigs of them 3136
>          Time interval: Fri Jun 20 02:49:22 2014 - Fri Jun 20 02:49:29 2014
> CHECKING EXTENT REGIONS.
> FSCK: extent40_repair.c: 96: extent40_check_layout: Node (2618486), item (9), unit (10), [20d7ef:4(FB):766d6c696e757a:20da66:0]: points out of the fs, region [2621239..2621439].
>          Read twigs 3136
>          Invaid extent pointers 1
>          Time interval: Fri Jun 20 02:49:29 2014 - Fri Jun 20 02:49:29 2014
> CHECKING THE SEMANTIC TREE
>          Found 189973 objects (some could be encountered more then once).
>          Time interval: Fri Jun 20 02:49:29 2014 - Fri Jun 20 02:49:33 2014
> FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and really used block bitmap differ.
> ***** fsck.reiser4 finished at Fri Jun 20 02:49:33 2014
> Closing fs...done
>
> 1 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.
>
> ====END LOG====
>
> This seems invalid to me: why a [2621239; 2621439] region would be invalid
> in a filesystem with 2621440 blocks?
> Also, the file in question is intact and does not appear to be corrupted,
> because this is my current vmlinuz. :)
>
> The following patch against reiser4progs shows precise location of this check.
>
> diff --git a/librepair/twig_scan.c b/librepair/twig_scan.c
> index 39b747c..ca8607a 100644
> --- a/librepair/twig_scan.c
> +++ b/librepair/twig_scan.c
> @@ -19,7 +19,7 @@ static errno_t cb_item_region_check(blk_t start, uint64_t count, void *data) {
>   	/* This must be fixed at the first pass. */
>   	if (start >= ts->bm_met->total ||
>   	    count > ts->bm_met->total ||
> -	    start >= ts->bm_met->total - count)
> +	    start > ts->bm_met->total - count)
>   	{
>   		ts->stat.bad_unfm_ptrs++;
>   		return RE_FATAL;

Sometimes our fsck is overly suspicious ;)
Does this fix help, BTW?
Thanks!
