From: Hans Reiser <reiser@namesys.com>
Subject: Re: rebuild fs
Date: Tue, 05 Aug 2003 16:28:15 +0400
Message-ID: <3F2FA2DF.3050505@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D62@imkedv_pdc> <20030805104546.GA22557@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030805104546.GA22557@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Thorsten Mauch <mauch@imkenberg.de>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Tue, Aug 05, 2003 at 12:02:02PM +0200, Thorsten Mauch wrote:
>
>  
>
>>But while rebuilding the tree, I got a segmentation fault. Because I didn't
>>want to continue work on the original raid system, I copied the entire raid
>>disk to the IDE disk.
>>dd  if=/dev/rd/c0d0  of=/dev/hda conv=noerror,sync
>>I tried to rebuild the fs structure again, and  I was able to access many
>>files, but not that are important to me :(
>>Does there is anyting I can do in this state ? does other tools then
>>resierfsck exist ?
>>    
>>
>
>If you are not using latest fsck version (3.6.11 as of now), try to use reiserfsprogs 3.6.11,
>as there is slight chance it would do better.
>
>Bye,
>    Oleg
>
>
>  
>
rephrase that as, use 3.6.11, if it still fails, tell us, the segfault 
will at least be fixed regardless of whether fsck has enough data to do 
its job.

-- 
Hans


