From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] updated reiser4 - reduced cpu usage for writes by writing
 more than 4k at a time (has implications for generic write code and eventually
 for the IO layer)
Date: Wed, 24 May 2006 10:55:48 -0700
Message-ID: <44749E24.40203@namesys.com>
References: <44736D3E.8090808@namesys.com> <20060524175312.GA3579@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932760AbWEXRzs@vger.kernel.org>
In-Reply-To: <20060524175312.GA3579@zero>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: Linux-Kernel@Vger.Kernel.ORG, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Tom Vier wrote:

>On Tue, May 23, 2006 at 01:14:54PM -0700, Hans Reiser wrote:
>  
>
>>underlying FS can be improved.  Performance results show that the new
>>code consumes  40% less CPU when doing "dd bs=1MB ....." (your hardware,
>>and whether the data is in cache, may vary this result).  Note that this
>>has only a small effect on elapsed time for most hardware.
>>    
>>
>
>Write requests in linux are restricted to one page?
>
>  
>
It may go to the kernel as a 64MB write, but VFS sends it to the FS as
64MB/4k separate 4k writes.
