From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Tue, 14 Dec 2004 21:10:05 -0800
Message-ID: <41BFC72D.2070800@namesys.com>
References: <200412141930.iBEJUGdB019336@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412141930.iBEJUGdB019336@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Horst von Brand wrote:

>Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk> said:
>
>[...]
>
>  
>
>>Perhaps a better way to think about this is that instead of talking
>>about directories and files, we just talk about objects.
>>    
>>
>
>Then you have a collection of interrelated objects, i.e., a database.
>Operating systems that work on databases (no filesystem) have been done,
>and are a nice idea... but are far, far away from Unix.
>  
>
A journey of a thousand leagues begins with a single step.

Actually, databases are the wrong solution because they are relational, 
and what is needed is a semi-structured query language that is upwardly 
compatible with Unix hierarchical semantics, ala 
www.namesys.com/future_vision.html
