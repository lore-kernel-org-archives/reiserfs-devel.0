From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 (libaal-1.0.5) segfault
Date: Thu, 03 Feb 2011 20:09:22 +0100
Message-ID: <4D4AFD62.9040507@gmail.com>
References: <4D4A6540.5070401@gmail.com> <4D4A928F.6050004@gmail.com> <4D4AF4AA.9000302@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D4AF4AA.9000302@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gleb Baryshev <gleb.baryshev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Gleb Baryshev wrote:
> 03.02.2011 14:33, Edward Shishkin writes:
>> Hello.
>>
>> Could you please pack the metadata by
>> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>> and let me download the file meta.gz
>
> Here's link to bzipped metadata:
> http://tootiny.net/zq09qj

Sorry, but this file looks corrupted.
Could you please try again?

Also make sure that packed meta-data are
extracted correctly by the following way:

#touch meta_tmp
#bzcat meta.bz2 | debugfs.reiser4 -U meta_tmp

>
>> This kind of corruption might indicate bugs
>> in reiser4 kernel stuff. In what circumstances
>> did it happen (was it power loss, etc), and
>> what kernel did you use?
>
> There was a hard reset with reiser4 partition mounted, because kernel 
> was hung due to oops:

reiser4-for-2.6.35 is buggy, please consider upgrading to .36 or later..

Edward.

>
>
> Feb  3 06:04:13 main20b kernel: BUG: unable to handle kernel paging 
> request at 4b1b5d0b
> Feb  3 06:04:13 main20b kernel: IP: [<c11234e1>] 
> jbd2_journal_start+0x2a/0xaf
> Feb  3 06:04:13 main20b kernel: *pde = 00000000
> Feb  3 06:04:13 main20b kernel: Oops: 0000 [#1]
> Feb  3 06:04:13 main20b kernel: last sysfs file: 
> /sys/devices/pci0000:00/0000:00:1f.5/host0/target0:0:0/0:0:0:0/block/sda/removable 
>
> Feb  3 06:04:13 main20b kernel: Modules linked in: reiser4 
> lzo_compress zlib_deflate nls_cp866 vfat fat vboxnetadp vboxnetflt 
> vboxdrv ext2 xfs exportfs reiserfs floppy processor thermal button atl1
>
>
> Kernel is 2.6.35 - vanilla, patched with corresponding release of 
> Reiser4 (thus, reiser4 module isn't the latest).
>
> Regards,
> Gleb
> -- 
> To unsubscribe from this list: send the line "unsubscribe 
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

