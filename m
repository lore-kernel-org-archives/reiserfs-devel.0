From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Mon, 20 Dec 2004 09:21:35 -0800
Message-ID: <41C70A1F.8000609@namesys.com>
References: <200412180152.iBI1q98X007507@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22855-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412180152.iBI1q98X007507@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: David Masover <ninja@slaphack.com>, Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Nate Diller <ndiller@namesys.com>

Horst von Brand wrote:

>
>>>Can you point me to any such literature?  I'm just curious.
>>>      
>>>
>
>  
>
>>Look in every field of cs except filesystems and kernels.;-)
>>    
>>
>
>Right. Smart people are found elsewhere only.
>  
>
There is a huge pile of innovations by the database field that 
filesystems people do not yet make use of.  The merits of 
interdisciplinary study are understood by many.

>  
>
>>                                                             Databases, 
>>garbage collectors, etc.
>>    
>>
>
>Everthing stuff that works on the assumption that what they are working on
>fits in RAM (or can overflow into swap space in a pinch), and that RAM is
>fast (and even so they are infuriatingly slow). And disks are usually a few
>thousand times larger than RAM (more stuff to shuffle around) and a million
>times slower...
>
>  
>
>>                         Specific reference, no, I didn't collect them, 
>>sorry, but alexander the befs driver guy knows more than I about this.
>>    
>>
>
>Furious handwaving doesn't make it true.
>  
>
Ok, go talk to the befs driver guy, and you'll find out he has already 
done work on it.

If his work does not satisfy you, sorry, I do detailed research just 
before coding, not to satisfy some guy on lkml.
