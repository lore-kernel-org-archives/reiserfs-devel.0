From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 query
Date: Sun, 03 Jul 2011 23:02:02 +0200
Message-ID: <4E10D8CA.4090005@gmail.com>
References: <99758203da18f9de8e42eadebeadc4a8@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=E0gfmva4d4qzGtG5nsMsMBFalvA66GZzmBf+afxPwsA=;
        b=U6gIJzZ03iznL8tQq9YwxI4hW7mGhq/cLfuvi8RjFlOqiaQDs5oOI/0dpURmO8JKg/
         goRQLM/AwRQKfAixMpJtBfS+oO54b0ohxMwNcdgEr8c8qtD5ENdeeVdaNLAzkn5kjdlc
         5bPRHlv9WUhJ7r4Wu4BXFWjnLOcJNOiv5YvGA=
In-Reply-To: <99758203da18f9de8e42eadebeadc4a8@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 06/28/2011 04:31 AM, doiggl@velocitynet.com.au wrote:
> Hello,
> I have some questions.
>
> 1. Is there any possibility of speeding up the command proocess #
> fsck.reiser4 --build-fs /dev/xxx


Yes, such possibility does exist.

Fsck can work faster if you have many subvolumes
per superblock (currently reiser4 supports only one
subvolume per superblock).


> Could the metadata be loaded into ram and processed their or is the
> process entirly disk bound by I/O ?


This is both, CPU and I/O bound.

The first one can be improved if we make fsck process
all subvolumes in parallel. The second one can be improved
if we map subvolumes to different physical (scsi) drives.


> 2. Also will there a reiser4-for-2.6.39.patch in the future ?

I hope so..

Thanks,
Edward.
