From: Hans Reiser <reiser@namesys.com>
Subject: Re: short term task list for Reiser4
Date: Fri, 14 Jul 2006 00:05:48 -0700
Message-ID: <44B7424C.3000108@namesys.com>
References: <44B42064.4070802@namesys.com> <Pine.LNX.4.64.0607131215310.28976@schroedinger.engr.sgi.com> <44B6A4A2.2070401@namesys.com> <Pine.LNX.4.64.0607131310570.29555@schroedinger.engr.sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28999-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.64.0607131310570.29555@schroedinger.engr.sgi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Lameter <clameter@sgi.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>, LKML <linux-kernel@vger.kernel.org>

Christoph Lameter wrote:

>On Thu, 13 Jul 2006, Hans Reiser wrote:
>
>  
>
>>Christoph Lameter wrote:
>>
>>    
>>
>>>Will there be any NUMA /SMP fixes? Reiserfs performance is severely 
>>>impacted at higher processor counts by the mandatory centralized locking 
>>>in both read and write paths in the filesystem.
>>>      
>>>
>>Reiserfs or Reiser4?
>>    
>>
>
>Either.
> 
>
>
>  
>
What big locks are you running into in V4?  Please tell me more.

Hans
