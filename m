From: Phillip Susi <psusi@cfl.rr.com>
Subject: Re: fs corruption by doing nothing
Date: Thu, 23 Aug 2007 12:34:59 -0400
Message-ID: <46CDB733.2000506@cfl.rr.com>
References: <46CD92B6.5090900@itwm.fraunhofer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1764983AbXHWQfN@vger.kernel.org>
In-Reply-To: <46CD92B6.5090900@itwm.fraunhofer.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Martin Vogt <vogt@itwm.fraunhofer.de>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Martin Vogt wrote:
> 
> Hello,
> 
> this bug report describes the following scenario:
> 
> - Insert a Knoppix 5.1.1 CD
>   into a fileserver with a clean reiserfs system and
>   Knoppix completely destroys the reiser filesystem on the fileserver,
>   just by booting Knoppix.
> 
> 
> Its unclear if this is a knoppix bug, but reiserfs
> simply tries to "correct something" which is wrong.
> 
>> ReiserFS: sda2: found reiserfs format "3.6" with standard journal
>> ReiserFS: sda2: using ordered data mode
>> ReiserFS: sda2: warning: sh-461: journal_init: wrong transaction max size
>> (144767). Changed to 1024
> 
> ^^^^^^^^^^here
> 
>> ReiserFS: sdb2: found reiserfs format "3.6" with standard journal
>> ReiserFS: sdb2: using ordered data mode
>> ReiserFS: sdb2: warning: sh-461: journal_init: wrong transaction max size
>> (144767). Changed to 1024
> 
> ^^^^^^^^^^here
> 
> After that the filesystem is completely broken.

Looks to me that there are two bugs here.  The first is with knoppix as 
it is mounting each individual mirrored disk instead of the raid device. 
  The second appears to be in the kernel as it is detecting and 
correcting what it thinks is an error but isn't.

