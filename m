From: Hans Reiser <reiser@namesys.com>
Subject: Re: where are reiser4 sources
Date: Tue, 22 Feb 2005 09:49:11 -0800
Message-ID: <421B7097.7060005@namesys.com>
References: <421A096F.5040603@gmx.de> <421A941B.5030708@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <421A941B.5030708@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mark Junker <mjscod@gmx.de>
Cc: reiserfs-list@namesys.com

How are you using reiser4 without the kernel?

Hans

David Masover wrote:

> Mark Junker wrote:
>
>> Hi,
>>
>> where are the Reiser4 sources? I just want to use Reiser4 in a 
>> separate application and don't like the idea of extracting the 
>> sources from the linux 2.6 patch.
>
>
> Out of curiosity, why?
>
> $ cd linux-2.6
> $ patch [...]
> $ cp -a fs/reiser4 ..
> $ cd ..
> $ rm -rf linux-2.6
>
> Or, I think there may be instructions somewhere for how to get that tree
> from BitKeeper.
>
> AFAIK, you will still have to adapt it a good deal.  There has been some
> (minimal) discussion of porting, but it doesn't seem easy.
>
>
>

