From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 data journalling?
Date: Fri, 29 Aug 2003 21:48:11 +0400
Message-ID: <3F4F91DB.2080900@namesys.com>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com> <3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero> <3F4E9C6D.2080009@namesys.com> <20030829012322.GJ21352@matchmail.com> <20030829050857.GA5755@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030829050857.GA5755@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Mike Fedyk <mfedyk@matchmail.com>, Tom Vier <tmv@comcast.net>, Reiserfs List <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Thu, Aug 28, 2003 at 06:23:22PM -0700, Mike Fedyk wrote:
>
>  
>
>>So you can have one 5k memory area that spans two pages, and it will act on
>>them atomically?  Or does that mean that the utils are already page aligned
>>by other kernel mechanisims?  Or that they'll have to use the reiser API to
>>do some of the above (other than the op grouping)?
>>    
>>
>
>Data does not need to be page aligned for atomic operations.
>
>Bye,
>    Oleg
>
>
>  
>
in reiser4

-- 
Hans


