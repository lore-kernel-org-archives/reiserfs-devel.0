From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: Interview with Hans on KernelTrap
Date: Thu, 15 Sep 2005 09:02:48 +0100
Message-ID: <43292AA8.1050304@st-andrews.ac.uk>
References: <878xy0sy0d.fsf@evinrude.uhoreg.ca> <432820E8.9080201@st-andrews.ac.uk> <43288119.9000605@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43288119.9000605@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote:

>>The user (or tools) don't even have to know which is the "real" file,
>>which are "parts of real files" and which are "concatenations of real
>>files". This is really good for namespace unification across
>>part-whole hierarchies. If you are required to use /..../ in the
>>middle, it breaks this I think. Could we get rid of requiring "...."
>>in the middle? (Would that break too much?)    Peter
>>    
>>
>In this specific instance, yes, but other pseudofiles would still need it.
>  
>
Sure, you can have only one "default" behaviour. (For instance, you 
would also need some metafiles to specify the details of how exactly the 
concatenation should be done, (e.g. what ordering (or structure) to use, 
whether to put something in between the files, etc.) in addition to all 
the other ones.)    Peter
