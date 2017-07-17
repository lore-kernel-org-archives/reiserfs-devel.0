From: <doiggl@velocitynet.com.au>
Subject: Re: Anyone know to fix "Exiting after unrecoverable error." using mkfs -t reiserfs /dev/sdbX
Date: Tue, 18 Jul 2017 00:04:12 +1000
Message-ID: <2afcf0014d79a210826476f443054893@mail.velocitynet.com.au>
References: <7e71024c79157640844bd4a628256909@mail.velocitynet.com.au> <20170715141202.459fa1ee@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20170715141202.459fa1ee@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

On Sat, 15 Jul 2017 14:12:02 +0300, dimas <dimas000@ya.ru> wrote:
> did you try to zero-wipe the partition?
> --
> To unsubscribe from this list: send the line "unsubscribe
reiserfs-devel"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hello,
Question :did you try to zero-wipe the partition?

Answr: no - unknown 

What is command switch to do that ? [zero-wipe the partition]?
Tried to use but no luck:
# mkfs -t reiserfs /dev/sdb3

Thanks
--Glenn


# mkfs --help
Usage:
 mkfs [options] [-t <type>] [fs-options] <device> [<size>]

Options:
 -t, --type=<type>  filesystem type; when unspecified, ext2 is used
     fs-options     parameters for the real filesystem builder
     <device>       path to the device to be used
     <size>         number of blocks to be used on the device
 -V, --verbose      explain what is being done;
                      specifying -V more than once will cause a dry-run
 -V, --version      display version information and exit;
                      -V as --version must be the only option
 -h, --help         display this help text and exit

For more information see mkfs(8).
#
