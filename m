From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs on removable media
Date: Wed, 02 Jul 2003 22:53:39 +0400
Message-ID: <3F032A33.3050303@namesys.com>
References: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org> <20030702124544.Z7414@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14807-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030702124544.Z7414@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Andreas Dilger wrote:

>On Jul 02, 2003  14:23 -0400, Zygo Blaxell wrote:
>  
>
>>Two reiserfs improvements come to mind:
>>
>>- There is a tendency for files that were being grown at crash time to
>>contain invalid data.  It seems that the inodes are being updated before
>>the data blocks they refer to are written.  It would be nice if the inode
>>writes were deferred (or at least made invisible) until after the data
>>blocks were written.  I'd rather lose my data than possibly have random
>>garbage masquerading as my data.
>>    
>>
>
>This is called ordered data mode, and exists on ext3 and also reiserfs with
>Chris Mason's patches.  Under normal usage it shouldn't change performance
>compared to writeback data mode (which is what reiserfs does by default).
>
It had some impact, I forget exactly how much, maybe Chris can 
resuscitate his benchmark of it?

Remind me about removable media around January, and we'll write some 
code for reiser4 to make it more graceful for it (somehow prompt the 
user to insert disk, etc.)

-- 
Hans


