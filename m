From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Problem with mkreiserfs
Date: Mon, 03 Jul 2006 13:25:27 +0400
Message-ID: <1151918727.6335.38.camel@tribesman.namesys.com>
References: <4EEB5A4713E61F49A759A504BECCBC0A028D2112@bgeexc01.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4EEB5A4713E61F49A759A504BECCBC0A028D2112@bgeexc01.asiapacific.cpqcorp.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-07-03 at 10:30 +0530, Masthan, Dudekula (STSD) wrote:
> 
> Hi Folks,
> 
> I have a device of size 5219263 blocks (each of size of 4096, Actually
> it has 41754107 blocks each of size 512 bytes. I just converted it into
> 4k blcok). When I try to create reiserfs file system on this device it
> reporting ERROR message that there are no enough blocks on the device.
> 
> I tried the following command 
> #mkfs -t reiserfs  -b 4096 /dev/sda1 5219263
> 

Please let us see what do you get with
echo n | mkfs -t reiserfs  -b 4096 /dev/sda1

> 
> On the same device I am able to Ext2/Ext3 file system with out any
> problem
> 
> #mkfs -t ext3 -b 4096 /dev/sda1 5219263 // this command running with out
> any problem.
> 
> Why I am getting problem with reiserfs file system
> 
> Your help is appreciated.
> 
> Thanks in advance 
> 
> Regards
> Masthan
> 

