From: Asheesh Laroia <asheesh@asheesh.org>
Subject: Re: Regarding the resize_reiserfs
Date: Sat, 26 Oct 2002 02:47:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0210260246270.13680-100000@res194-241-345.resnet.jhu.edu>
References: <A56BCCA3A5C2D411B18A00508BDE9C9B04D6F2E9@bla.satyam.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11794-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <A56BCCA3A5C2D411B18A00508BDE9C9B04D6F2E9@bla.satyam.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Narasimha_Subban <Narasimha_Subban@Satyam.com>
Cc: reiserfs-list@namesys.com

Under Linux, you may need to restart your computer to have the new
partition size show up for /dev/hd*.  (At least, I know we had to do that
back in the 2.2.x days.)

So, try restarting (and I mean re-initializing the kernel, not just going
to single-user mode) and trying this; that may fix it.

-- Asheesh.

On Sat, 26 Oct 2002, Narasimha_Subban wrote:

> Hi,
>    I am using the reiserfs-3.6.3 version on Linux-2.4.7-10 kernel version. I
> need some information on resize_reiserfs command.
> I have a partition (assume /dev/hda8 with 1000 blocks) having reiserfs
> filesystem.
> I increased the partition size (Now /dev/hda8 with 2000 blocks) in the
> partition table using the fdisk command. Now i tried to resize the
> filesystem using (resize_reiserfs -s+xxM  /dev/hda8) so that increased
> partition size in partition table is reflected in filesystem. The error is
> as below
> /dev/hda8 is of XXXXXX blocks size only with reiserfs of XXXXXX blocks size
> on it. You are trying to expant reiserfs up to YYYYYY size. You probably
> forgot to expand your partition size.
> But i shouldnot delete the partition bcoz the contents shouldn't be lost.
>    It will be great if anyone gives some ideas to make resize_reiserfs work.
>
>
> Thanks and Rgds
> Narasimha Subban K.V

