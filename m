From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 12:14:44 -0700
Message-ID: <413E08A4.9020005@namesys.com>
References: <200409071815.i87IFseF004907@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409071815.i87IFseF004907@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Spam <spam@tnonline.net>, Christer Weinigel <christer@weinigel.se>, David Masover <ninja@slaphack.com>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand wrote:

>Hans Reiser <reiser@namesys.com> said:
>  
>
>>Horst von Brand wrote:
>>    
>>
>>>Spam <spam@tnonline.net> said:
>>>      
>>>
>>>>Christer Weinigel <christer@weinigel.se> said:
>>>>        
>>>>
>
>[...]
>
>  
>
>>>>>2. How do we want to expose named streams?
>>>>>          
>>>>>
>
>  
>
>>>>>  One suggestion is file-as-directory in some form.
>>>>>          
>>>>>
>
>  
>
>>>Which is broken, as it forbids hard links to files.
>>>      
>>>
>
>  
>
>>No, it forbids hard links to the directory aspect of the file-directory 
>>duality.
>>    
>>
>
>How do you distinguish a "hard link to the directory personality" from
>"hard link to the file personality"?
>
Put in (undoubtedly overly) simple terms, if you can do it to a file you 
can do it to the file personality, but if you currently can only do it 
to a directory and get an error from attempting it to a file then in the 
new scheme doing it to the hard link only gives the same error.

Or, we can ask Alexander to help us use his deadlock detection algorithm 
and try to do things right....

