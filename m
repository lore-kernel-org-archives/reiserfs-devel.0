From: myciel <myciel@dotcom.pl>
Subject: Re: 2.4.18 & journal_mark_dirty?
Date: Thu, 13 Mar 2003 10:55:06 +0100
Message-ID: <3E70557A.6030400@dotcom.pl>
References: <3E704476.9090601@dotcom.pl> <20030313114538.A8610@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13241-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030313114538.A8610@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Thu, Mar 13, 2003 at 09:42:30AM +0100, myciel wrote:
>
>  
>
>>I run nfs server using reiserfs on 2.4.18 + NFSALL patches, and
>>I've just got "nice" oops.  System did not crash, but anyway I had to 
>>reboot to restart nfs.
>>Could You please tell me if  "journal_mark_dirty:...." in following log 
>>is harmless or not?
>>    
>>
>
>No, it is not.
>Here's the patch. You need the patch, otherwise you would see this message
>quite often when trying to delete/truncate certain file.
>
>Bye,
>    Oleg
>  
>
thanks for the patch,
it happened after months of running with 2 filesystems of ~0.7T

rafal



