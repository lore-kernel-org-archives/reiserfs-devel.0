From: Hans Reiser <reiser@namesys.com>
Subject: Re: Fwd: Re: Segmentation Fault when mounting ataraid
Date: Thu, 30 Jan 2003 11:48:54 +0300
Message-ID: <3E38E6F6.6030100@namesys.com>
References: <3E36E3EB.4040305@mb.tu-ilmenau.de> <3E381188.8080701@namesys.com> <20030130094225.A17582@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12555-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030130094225.A17582@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Wed, Jan 29, 2003 at 08:38:16PM +0300, Hans Reiser wrote:
>
>  
>
>>Well, that certainly looks like a bug in mount options parsing code.  
>>Edward and Oleg, please review and fix.
>>    
>>
>
>There is another decoded output that makes much more sence to me.
>And it suggest something gone wrong within block layer.
>(And in the one you are referring to parse_options's address is only
>stored in registers, not in bactrace. Also starting from 2.4.20,
>there is no function named parse_optinos in reiserfs code).
>
>Bye,
>    Oleg
>
>
>  
>
Oops, I guess I didn't read it slowly enough.

-- 
Hans


