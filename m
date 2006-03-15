From: Hans Reiser <reiser@namesys.com>
Subject: Re: State of the Reiser4 FS
Date: Wed, 15 Mar 2006 10:33:40 -0800
Message-ID: <44185E04.5030307@namesys.com>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com>	 <4417D43A.2070603@namesys.com> <3aa654a40603150459q25507248v54f4ffef5e41042d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28271-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40603150459q25507248v54f4ffef5e41042d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Avuton Olrich <avuton@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Avuton Olrich wrote:

>On 3/15/06, Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>Avuton Olrich wrote:
>>    
>>
>>>I just saw a thread on the LKML a minute ago asking about the state of
>>>getting the patch into vanilla linux. I read Andrew Morton's post
>>>about a month ago stating that it could happen soon, but was unlikely
>>>due to there not actually being a need for it to go into mainline (no
>>>major distro default, etc...).
>>>
>>>      
>>>
>>Can you supply a reference to this post?  The only distro which is not
>>influenced by performance numbers when selecting a filesystem is RedHat,
>>and most of the rest are just waiting to be sure that politics will not
>>kill reiser4 inclusion.  I am sure I can come up with a "we will support
>>it if you let it in" petition of distros if such a silliness is needed.
>>    
>>
>
>I was refering to this post:
>http://marc.theaimsgroup.com/?l=linux-kernel&m=113775878722100&w=2
>
>Thanks for all the answers
>--
>avuton
>--
> Anyone who quotes me in their sig is an idiot. -- Rusty Russell.
>  
>
Oh, well, the overall tone of that email is not all that negative.

We will work on the 4k at a time issue, overcome that issue technically,
and then after that is resolved deal with generating desire for a
filesystem that is 2x (reiser4.0) to 4x (4.1alpha with compression) faster.
