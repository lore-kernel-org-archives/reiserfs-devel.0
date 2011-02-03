From: Gleb Baryshev <gleb.baryshev@gmail.com>
Subject: Re: fsck.reiser4 (libaal-1.0.5) segfault
Date: Thu, 03 Feb 2011 21:32:10 +0300
Message-ID: <4D4AF4AA.9000302@gmail.com>
References: <4D4A6540.5070401@gmail.com> <4D4A928F.6050004@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=6cl11Fou5wz8WZpklMMmLAMhpicsM9wbwb/unXUmI3Y=;
        b=tjI5oAfj9+WuMMHSwZ5eOO3zzpVCwx2RhbmbxMqnIRbRBHBe20NLLezVSjqaZ8oTzJ
         peVn1agDPPdtb89BmUzZ6QY4wOX4JA+HpA2tiXjO76XW54YEoPHOAYSaMAjRcb0f4jHN
         Ye0N+8jbxwVcljLCHAXIrL3WAGGmmVS1Fq4i4=
In-Reply-To: <4D4A928F.6050004@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

03.02.2011 14:33, Edward Shishkin writes:
> Hello.
>
> Could you please pack the metadata by
> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
> and let me download the file meta.gz

Here's link to bzipped metadata:
http://tootiny.net/zq09qj

> This kind of corruption might indicate bugs
> in reiser4 kernel stuff. In what circumstances
> did it happen (was it power loss, etc), and
> what kernel did you use?

There was a hard reset with reiser4 partition mounted, because kernel 
was hung due to oops:


Feb  3 06:04:13 main20b kernel: BUG: unable to handle kernel paging 
request at 4b1b5d0b
Feb  3 06:04:13 main20b kernel: IP: [<c11234e1>] 
jbd2_journal_start+0x2a/0xaf
Feb  3 06:04:13 main20b kernel: *pde = 00000000
Feb  3 06:04:13 main20b kernel: Oops: 0000 [#1]
Feb  3 06:04:13 main20b kernel: last sysfs file: 
/sys/devices/pci0000:00/0000:00:1f.5/host0/target0:0:0/0:0:0:0/block/sda/removable
Feb  3 06:04:13 main20b kernel: Modules linked in: reiser4 lzo_compress 
zlib_deflate nls_cp866 vfat fat vboxnetadp vboxnetflt vboxdrv ext2 xfs 
exportfs reiserfs floppy processor thermal button atl1


Kernel is 2.6.35 - vanilla, patched with corresponding release of 
Reiser4 (thus, reiser4 module isn't the latest).

Regards,
Gleb
