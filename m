From: Hans Reiser <reiser@namesys.com>
Subject: Re: rsync and memory leak on linux 2.2?
Date: Thu, 20 Feb 2003 01:18:24 +0300
Message-ID: <3E5402B0.5030606@namesys.com>
References: <1045156304.11405.149.camel@barnes>	<87r8abtlhq.fsf@freeze.oslo.dnmi.no>  <20030214130111.A27034@namesys.com> <1045689849.1168.24.camel@barnes>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12839-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1045689849.1168.24.camel@barnes>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick O'Rourke <porourke@egenera.com>
Cc: Oleg Drokin <green@namesys.com>, Adrian Phillips <a.phillips@met.no>, reiserfs-list@namesys.com

Patrick O'Rourke wrote:

>On Fri, 2003-02-14 at 05:01, Oleg Drokin wrote:
>
>  
>
>>On Fri, Feb 14, 2003 at 07:38:41AM +0100, Adrian Phillips wrote:
>>    
>>
>>>    Patrick> We have two machines running Linux 2.2 with ReiserFS
>>>    Patrick> v3.5.32 and we're seeing a memory leak which we feel is
>>>    Patrick> related to reiser and some interaction with rsync.
>>>Well, there is a 3.5.34 which has, obviously, a number of bug
>>>      
>>>
>
>I just thought I would follow up with a note that the bug turned
>out NOT to be in the reiser code.  The rsync operation I described
>turned out to be a red herring.
>
>Thanks for the suggestions,
>
>Pat
>
>  
>
Thanks Patrick.  This leaves us with one unsolved reiserfs V3 bug that I 
know of (unlink related one, vs is working on it, and he is not 
completely sure it is reiserfs not vfs....).  Oleg, am I right in 
thinking that the samba+reiserfs bug looks like a samba bug?

-- 
Hans


