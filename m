From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs_fs.h listed in SCO court docs
Date: Wed, 12 Nov 2003 08:44:31 -0800
Message-ID: <3FB2636F.8030905@namesys.com>
References: <Pine.LNX.4.44.0311122306430.18264-100000@potato.zayda.com> <3FB22652.3020700@namesys.com> <20031113004312.GA17130@hello-penguin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031113004312.GA17130@hello-penguin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stefan Traby <stefan@hello-penguin.com>
Cc: Jason Holt <jason@lunkwill.org>, reiserfs-list@namesys.com

Stefan Traby wrote:

>On Wed, Nov 12, 2003 at 04:23:46AM -0800, Hans Reiser wrote:
>
>  
>
>>>http://www.groklaw.net/article.php?story=2003111203544653
>>>
>>>And they list:
>>>
>>>fs/reiserfs/do_balan.c
>>>fs/reiserfs/fix_node.c
>>>include/linux/reiserfs_fs.h
>>>
>>>Hans, did you sneaky look through SCO's IP and use it when writing your 
>>>code?
>>>      
>>>
>
>  
>
>>Hunh?
>>
>>Do they claim that we call some function that infringes (I have no idea 
>>what, kmalloc or something....) or that our code in that file itself 
>>infringes?  When someone doesn't tell you what is allegedly infringing 
>>it is reallly hard to do anything.
>>    
>>
>
>asp:~/linux/fs/reiserfs# grep \ SMP *.c
>do_balan.c:   using buffers already obtained.  For SMP support it will someday be
>fix_node.c: * When ported to SMP kernels, only at the last moment after all needed nodes
>asp:~/linux/fs/reiserfs# 
>
>
>SCO really sucks.
>There was simply no real investigation.
>
>  
>
You are absolutely right.  You forgot the includes....

reiser@bitspit:/usr/src/linux/include/linux> grep SMP reiserfs_fs*

reiserfs_fs.h:gods only know how we are going to SMP the code that uses 
them.

Oh would I like to make a court appearance regarding this one....

-- 
Hans


