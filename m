From: Hans Reiser <reiser@namesys.com>
Subject: Re: plugin for cached network file system
Date: Thu, 13 May 2004 08:58:54 -0700
Message-ID: <40A39B3E.3080701@namesys.com>
References: <200405131059.22693.Michael.James@csiro.au> <40A30C53.3020607@namesys.com> <200405131653.52862.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405131653.52862.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael.James@csiro.au
Cc: reiserfs-list@namesys.com

Michael James wrote:

>>>Michael James asked:
>>>
>>>How hard would it be to write a Reiser4 plug-in
>>>to implement a network file system with a cache on the local disk?
>>>      
>>>
>
>Then, On Thursday 13 May 2004 15:49, Hans Reiser wrote:
>
>  
>
>>It is easy to do a hack, and hard to do it right so that the world would 
>>want to drop nfs and move to it.  We are trying to find a sponsor to do 
>>it right, and have a proposal called Reiser5 that costs $1.8 million, 
>>and provides global scalability (which nfs/afs/clusterfs/intermezzo do 
>>not, in my view).
>>    
>>
>
>At this stage, I'm looking for the, "Don't worry, be scrappy" solution.
>
>1) Just kludge the basic functionality.
>	(read-only, file-fetching/flushing in sh or perl,
>	 NFS mounted master, manual deletion of outdated copies)
>
>2) Let time, necessity and the GPL refine it and add features.
>	(read-write-locking, automatic updating,
>	  built-in file fetching/flushing and network code)
>
>3) Always keeping an eye on 2) during 1).
>
>There doesn't seem to be anything like this in Linux, and having it
> would be a boon (and give reiser4 a leg-up) in the cluster community.
>
>michaelj
>
>
>  
>
I am very skeptical of the value of it (that is how NFS came about, just 
doing things quickly....), but to answer the question asked, it would be 
easy.
