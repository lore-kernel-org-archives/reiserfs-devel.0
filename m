From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 15:07:15 +0300
Message-ID: <3E5F50F3.2040907@namesys.com>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <20030228105145.C1234@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228105145.C1234@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Voicu Liviu <liviu.voicu@huji.ac.il>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Fri, Feb 28, 2003 at 12:11:14AM +0200, Voicu Liviu wrote:
>
>  
>
>>Any clue what is going on?
>>Maybe ReiserFS uses the cpu harder?
>>    
>>
>
>reiserfs is using more CPU than ext2/ext3. It's maintaining its metadata in
>balanced tree. Each tree update often requires shifting of some of the data
>between or inside of tree nodes. That's where CPU time is going.
>
>
>  
>
>>I have to fix the CPU usage icon_sad.gif I makes me crazy...simple emerge 
>>loads the CPU to 90 ~ 95%
>>    
>>
>
>Make sure you do not have "CONFIG_REISERFS_CHECK" enabled in you kernel config,
>as this enables lots of extra checks in reiserfs code that consume even more CPU.
>
>Bye,
>    Oleg
>
>
>  
>
using notail option will reduce CPU usage, improve read performance, and 
waste some disk space (still better than ext*).

-- 
Hans


