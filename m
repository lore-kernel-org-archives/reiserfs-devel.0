From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Tue, 30 Nov 2004 09:03:05 -0800
Message-ID: <41ACA7C9.1070001@namesys.com>
References: <200411301631.iAUGVT8h007823@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411301631.iAUGVT8h007823@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, linux-kernel@vger.kernel.org

Horst von Brand wrote:

>Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk> said:
>  
>
>>On Tue, 2004-11-30 at 14:51, Horst von Brand wrote:
>>    
>>
>>>>I was suggesting this idea mainly form XML files, where the tags define 
>>>>the parts clearly.
>>>>        
>>>>
>
>  
>
>>>Use a XML parsing library then.
>>>      
>>>
>
>  
>
>>But namespace unification is important,
>>    
>>
>
>Why? Directories are directories, files are files, file contents is file
>contents. Mixing them up is a bad idea. Sure, you could build a filesystem
>of sorts (perhaps more in the vein of persistent programming, or even data
>base systems) where there simply is no distinction (because there are no
>differences to show), but that is something different.
>  
>
This is kind of like explaining to people around the office that they 
could ever possibly need a disk drive of more than 10mb back in 1982 or 
so.  I could not convince them then, Peter, you cannot convince this guy 
now, just spend the time coding it instead.  Peter, you expect people to 
understand the value of features they have never used.  Works for some 
of them.  Only some of them.

>  
>
>>                                        and to unify the namespace, you
>>have to use the same syntax. I guess you disagree with me on that. (If
>>not, how would you do it?)
>>    
>>
>
>I'd go one level up: Eliminate the distinctions that bother you, not try to
>patch over them.
>  
>
Are you saying you'd rewrite xml to put separate objects in separate 
files? 
