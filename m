From: Edward Shishkin <edward@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 06 Jan 2005 21:55:20 +0300
Message-ID: <41DD8998.3070604@namesys.com>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23052-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050106142706.GE519@schmorp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pcg@goof.com
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, stefan@hello-penguin.com

pcg( Marc)@goof(A.).(Lehmann )com wrote:

>On Thu, Jan 06, 2005 at 03:45:06PM +0300, Alex Zarochentsev <zam@namesys.com> wrote:
>  
>
>>>generic bug in handling hash collisions?
>>>      
>>>
>>Tea hash is designed to be more resistant.  
>>    
>>

Actually this can not be more resistant as it use the same 32-bit output 
size. So to find
a collision you just need to find hashes of  2^16 = 65536 random documents.

>
>As the example posted shows, tea doesn't look better, it generates
>nicely-looking collisions, too.
>
>  
>

>I'd suggest getting rid of reiserfs on anything important. I can't have it
>when my filesystem randomly returns errors when it should be working.
>
>I wonder wether this hasn't any security relevance, as it allows attackers
>easily to create filename holes in the filesystem that even root cannot
>override.
>  
>

It should be a weighty reason to use strong hash function for creating 
entries because
stable hash means bad performance and more occupied place in stat-data: 
I am not
sure that even 160 bit will guarantee absence of collision for a long time..

Edward.

>Thanks for the suggestion, though! However, the workaround I currently use
>(delete the dir, reinstall) works better, as it doesn't destroy debian's
>idea of the filesystem layout.
>
>  
>

