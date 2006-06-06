From: Hans Reiser <reiser@namesys.com>
Subject: Re: v4 questions, crc's
Date: Tue, 06 Jun 2006 12:24:30 -0700
Message-ID: <4485D66E.3090903@namesys.com>
References: <20040722215409.GA12240@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28748-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040722215409.GA12240@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Tom Vier wrote:

>(resending)
>
>are wandering logs like rcu? unless i'm reading it wrong, it sounds like you 
>create a copy of the node, but with the updated pointer. you go up the tree, 
>creating updated parents, and the whole new path is finally committed when 
>the highest node's pointer is updated, right? how big are nodes in v4? 512 
>bytes? when updating a tree path, it causes a lot of single sector writes to 
>different areas (far apart?) but the only dependence is that all the new 
>updated versions of the nodes must be written before the top node is, right? 
>does v4 use extents? if not, how are the data blocks finally pointed to?
>
>sun has (or is writing) a new fs i read about recently that has data crc's 
>with error correction (i guess that's what the new "self healing" buzzword 
>means - i've heard ibm using it in commercials). i've thought about writing a 
>v4 plugin. i'm not sure how fine grained to make it. one crc for the whole 
>file isn't feasable. are blocks variably sized in reiserfs? perhaps each 
>extent or whatever could be crc'ed, with the crc's stored as metadata (using 
>whatever method v4 provides for saving variable length metadata).
>  
>
Putting a crc in every node would be easy to code and useful to users.

>also, what should i do if a crc is bad? just write to syslog? refuse to 
>return the data since it might be bad (return an error from read())?
>
>  
>

