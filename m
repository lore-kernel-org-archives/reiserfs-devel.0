From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Wed, 15 Dec 2004 08:57:27 -0800
Message-ID: <41C06CF7.2020102@namesys.com>
References: <200412151328.iBFDSQoH011241@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412151328.iBFDSQoH011241@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Horst von Brand wrote:

>Hans Reiser <reiser@namesys.com> said:
>  
>
>>Horst von Brand wrote:
>>    
>>
>>>Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk> said:
>>>      
>>>
>
>  
>
>>>[...]
>>>      
>>>
>
>  
>
>>>>Perhaps a better way to think about this is that instead of talking
>>>>about directories and files, we just talk about objects.
>>>>        
>>>>
>
>  
>
>>>Then you have a collection of interrelated objects, i.e., a database.
>>>Operating systems that work on databases (no filesystem) have been done,
>>>and are a nice idea... but are far, far away from Unix.
>>>      
>>>
>
>  
>
>>A journey of a thousand leagues begins with a single step.
>>    
>>
>
>Right.  But you need to know where you are going, and why.
>
>  
>
>>Actually, databases are the wrong solution because they are relational, 
>>    
>>
>
>Says who?
>  
>
Read the

www.namesys.com/future_vision.html

paper for why relational is the wrong model.

>  
>
>>and what is needed is a semi-structured query language that is upwardly 
>>compatible with Unix hierarchical semantics, ala 
>>www.namesys.com/future_vision.html
>>    
>>

