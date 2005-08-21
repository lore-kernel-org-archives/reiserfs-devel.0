From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 sending process to D state
Date: Sun, 21 Aug 2005 13:04:40 +0400
Message-ID: <430843A8.9070301@namesys.com>
References: <43012902.1010600@webalive.biz> <4301C209.7000302@namesys.com> <4303D5CC.8000704@webalive.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4303D5CC.8000704@webalive.biz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mohammad.rahman@webalive.biz
Cc: Nate Diller <nate.diller@gmail.com>, reiserfs-list@namesys.com

Hello

Mohammad A. Rahman wrote:
> Hello,
> 
> Please see more details below.
> 
> 
> [root@mybox root]# cat /proc/scsi/scsi
> Attached devices:
> Host: scsi0 Channel: 00 Id: 00 Lun: 00
>  Vendor: MAXTOR   Model: ATLAS10K5_73SCA  Rev: JNZM
>  Type:   Direct-Access                    ANSI SCSI revision: 03
> Host: scsi0 Channel: 00 Id: 06 Lun: 00
>  Vendor: PE/PV    Model: 1x8 SCSI BP      Rev: 1.0
>  Type:   Processor                        ANSI SCSI revision: 02
> 
> [root@mybox root]# cat /proc/scsi/mptspi/0
> ioc0: LSI53C1030, FwRev=01032300h, Ports=1, MaxQ=255
> [root@mybox root]# cat /proc/scsi/mptspi/1
> ioc1: LSI53C1030, FwRev=01032300h, Ports=1, MaxQ=255
> 
> 
> CONFIG_FUSION=y
> CONFIG_FUSION_SPI=y
> CONFIG_FUSION_FC=y
> CONFIG_FUSION_MAX_SGE=128
> CONFIG_FUSION_CTL=y
> CONFIG_FUSION_LAN=y
> 

well, it looks like there is some problem in interaction between Fusion scsi driver and reiser4.
Nate <nate.diller@gmail.com> has the same problem on this hardware.

Would you please try reiser4 on ide harddrive to confrm this guess?
