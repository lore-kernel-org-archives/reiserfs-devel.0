From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 01:05:45 -0700
Message-ID: <412EEB59.7010101@namesys.com>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com>	 <20040825152805.45a1ce64.akpm@osdl.org>	<412D9FE6.9050307@namesys.com>	 <20040826014542.4bfe7cc3.akpm@osdl.org>  <412DAC59.4010508@namesys.com>	 <1093548414.5678.74.camel@krustophenia.net> <1093548815.13881.10.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20880-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093548815.13881.10.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christophe Saout <christophe@saout.de>
Cc: Lee Revell <rlrevell@joe-job.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Christophe Saout wrote:

>Am Donnerstag, den 26.08.2004, 15:26 -0400 schrieb Lee Revell:
>
>  
>
>>>Well, in V4, you can easily compose a plugin from plugin methods of 
>>>other plugins, write a little piece of code with the one thing you want 
>>>different, and add it in.  Disk format changes, no big deal, add a new 
>>>disk format plugin, or a new item plugin, or a new node plugin, etc., 
>>>and you got your new format.
>>>      
>>>
>>OK, real world example.  My roommate has an AKAI MPC-2000, a very
>>popular hardware sampler from the 90's.  The disk format is known,there
>>are a few utilities to edit the disks on a PC and extract the PCM
>>samples, but there are no tools to mount it on a modern PC.  Are you
>>saying that, since I know the MPC disk format, I could write a reiser4
>>plugin to mount an MPC drive?
>>    
>>
>
>No, the underlying storage must be a reiser4-like tree. 
>
Not necessarily.  We just encourage it....  Reiser4 is a body of code 
that can be sliced and diced as you choose, and it is designed for easy 
slicing.

>If you want to
>mount an MPC drive, write an MPC filesystem.
>
>  
>
However, this last sentence is probably sensible advice.  A mount point 
is probably the right interface from reiser4 for what you want.
