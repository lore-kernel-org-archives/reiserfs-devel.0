From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiserfs: remove stray unlock_super in reiserfs_resize
Date: Fri, 19 Jun 2009 00:28:54 +0200
Message-ID: <4A3ABFA6.4010202@gmail.com>
References: <20090423192512.GA22819@lst.de> <49F0C2AD.6070502@gmail.com> <20090618211820.GA28679@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090618211820.GA28679@lst.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@lst.de>
Cc: reiserfs-devel@vger.kernel.org

Christoph Hellwig wrote:
> On Thu, Apr 23, 2009 at 09:34:05PM +0200, Edward Shishkin wrote:
>   
>> Christoph Hellwig wrote:
>>     
>>> Reiserfs doesn't use lock_super anywhere internally, and ->remount_fs
>>> which calls reiserfs_resize does have it currently but also expects it
>>> to be held on return, so there's no business for the unlock_super here.
>>>
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>  
>>>       
>> Acked by Edward Shishkin <edward.shishkin@gmail.com>
>>     
>
> Do you plan to push this to Linus?

Nup.
Please, send..

Thanks,
Edward.
