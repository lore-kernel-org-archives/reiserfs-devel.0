From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Problems with reiserfs when start OpenAFS 1.2.11-fc1 Segmentation
 fault with kernel 2.4.22-1.2174.nptl
Date: Wed, 03 Mar 2004 19:46:48 -0800
Message-ID: <4046A6A8.2000609@matchmail.com>
References: <20040304005117.M99283@soltis.cc> <20040304005913.M1858@soltis.cc> <20040304002804.GA5722@dbz.icequake.net> <20040304014303.M64769@soltis.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040304014303.M64769@soltis.cc>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jds <jds@soltis.cc>
Cc: Ryan Underwood <nemesis-lists@icequake.net>, reiserfs-list@namesys.com, openafs-info@openafs.org

jds wrote:
> Hi Ryan:
> 
>    Thanks for your help, the client openafs working again.
> 
> loop: loaded (max 8 devices)
> Journalled Block Device driver loaded
> kjournald starting.  Commit interval 5 seconds
> EXT3 FS 2.4-0.9.19, 19 August 2002 on loop(7,0), internal journal
> EXT3-fs: mounted filesystem with ordered data mode.

No, if you're going to be stacking filesystems, use ext2, not ext3.  You 
will get better performance, and there's no use in having two levels of 
journaling in this case.

Mike
