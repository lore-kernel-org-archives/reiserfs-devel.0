From: Hans Reiser <reiser@namesys.com>
Subject: Re: Disk placement options
Date: Thu, 07 Oct 2004 22:28:57 -0700
Message-ID: <41662599.6040908@namesys.com>
References: <e96ff1200410062230890dccc@mail.gmail.com> <1097144372.1367.13.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1097144372.1367.13.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Ash <ashrat@gmail.com>, reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>Hello
>
>On Thu, 2004-10-07 at 09:30, Ash wrote:
>  
>
>>Hi
>>
>>Does ReiserFS V3 provide any control for the placement of files on
>>disk; something like policy modules for disk placement ?  clustering
>>of files for example ?
>>
>>    
>>
>
>No. The only thing to control file placement is hash selection. But it
>is rather about ordering names in a directory.
>
>  
>
>>Thanks,
>>Ash
>>
>>    
>>
>
>
>
>  
>
I have always intended to implement it someday, and to make major 
packing locality selectable from userspace, but I have not done so yet.
