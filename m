From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: Yet another reiserfs<dm<md corruption
Date: Mon, 11 Apr 2005 22:04:12 +0400
Message-ID: <425ABC1C.2030001@namesys.com>
References: <1113156285.4681.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1113156285.4681.7.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jzobel@heute-morgen.de
Cc: reiserfs-list@namesys.com

Joachim Zobel wrote:

>Hi.
>
>After upgrading to the latest sarge (on x86 withe ide) I found a lvm2
>logical partition with reiserf 3.6 on a software raid1 corrupted. Trying
>to reiserfsck --rebuild-tree it I got: 
>
>-------
>The problem has occurred looks like a hardware problem (perhaps
>memory). Send us the bug report only if the second run dies at
>the same place with the same block number.
>
>build_the_tree: Nothing but leaves are expected. Block 9746 - unknown
>-------
>
>Actually the block number changes when I rerun the fsck, however there
>are no syslog   entries abot drive problems. So probably the "hardware
>problem" is in fact a device mapper problem, right?
>  
>

Would you please send the following commands outputs?:
# dmsetup deps
# dmsetup status
# dmsetup info
# pvdisplay --map
# lvdisplay --map -vv


# ls -l /dev/vg (and /dev/mapper)

Thanks,
Lena

>Sincerely,
>Joachim
>
>
>
>  
>

