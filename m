From: Hans Reiser <reiser@namesys.com>
Subject: Re: Can compression at filesystem level improve overall
Date: Mon, 22 Mar 2004 12:14:02 +0300
Message-ID: <405EAE5A.8020600@namesys.com>
References: <200403212317.i2LNHrJo010166@sirius.cs.pdx.edu>
Reply-To: reiser@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17370-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403212317.i2LNHrJo010166@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: sean@gutenpress.org, Edward Shishkin <edward@namesys.com>

The Amazing Dragon (Elliott Mitchell) wrote:

>>From: Sean Johnson <sean@gutenpress.org>
>>On Fri, 2004-03-19 at 11:53, Nikita Danilov wrote:
>>    
>>
>>>That's common misconception. :)
>>>
>>>The goal of compression is to conserve disk bandwidth rather than space.
>>>
>>>By compressing it is possible to transfer data (== uncompressed data
>>>user works with), at a rate higher than raw device bandwidth.
>>>      
>>>
>>I am far from any kind of authority on filesystems, but doesn't compression
>>make data corruption a significantly nastier bugaboo?
>>    
>>
>
>Potentially. Depending upon the encoding losing one block of encoded data
>maps to losing many blocks of decoded data. Also losing the first block
>of data might make it impossible to recover later blocks.
>  
>
I think it will just make you lose the compression atom, but Edward can 
say more when he gets back from vacation.

>But these aren't issues since you do error correction near the physical
>layer, and backups just you make sure. You do, don't you?
>
>
>  
>


-- 
Hans

