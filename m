From: Hans Reiser <reiser@namesys.com>
Subject: Re: Carrying Attributes too Far
Date: Fri, 05 Dec 2003 15:38:37 +0300
Message-ID: <3FD07C4D.6090401@namesys.com>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16241-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lrc1@st-andrews.ac.uk
Cc: reiserfs-list@namesys.com

lrc1@st-andrews.ac.uk wrote:

>Quoting Hans Reiser <reiser@namesys.com>:
>
>...
>
>  
>
>>lrc1@st-andrews.ac.uk wrote:
>>
>>    
>>
>>>Sorry for the delay in replying.
>>>
>>>Quoting Hubert Chan <hubert@uhoreg.ca>:
>>>      
>>>
>
>...
>
>  
>
>>>Yes, it is impossible to hard-link between two files on different volumes
>>>(except at mount points) in the Unix filesystem, but it shouldn't be. (More
>>>generally, with the necessary permissions it should be possible to make any
>>>      
>>>
>>file
>>    
>>
>>>the child of any directory via a hard link, except where doing so would
>>>      
>>>
>>create a
>>    
>>
>>>cycle.) 
>>>
>>>      
>>>
>>This implies that two filesystems can share an identification number
>>between them.
>>    
>>
>
>I would suggest that for every link to a file on a different filesystem, the
>linking directory should store both an identifier for the child file's
>filesystem and the child file's on-disk inumber on that filesystem.* The reverse
>links would be stored in the same way. 
>
I can accept a patch that does this.

>That way, filesystems don't have to
>understand other filesystems' identifier schemes, or coordinate their own
>schemes with them. (The obvious alternative approach - maintaining a list of
>unique identifiers for all files on all mounted filesystems - is undesirable for
>a number of reasons. For one thing, it is limiting and unsafe to assume that all
>mounted filesystems are willing and able to provide an accurate list of all
>their files in a reasonable time.)
>
>This leaves one significant problem: what happens when a file is moved from one
>filesystem to another? What will prevent the cross-filesystem hard links to the
>file from breaking? Cleaning up cross-filesystem links after explicit file
>deletion is a related but simpler problem. I think a good but not ideal solution
>to this problem is possible. I'll go into detail if anyone is interested.
>  
>
More interested in patches....

>* Actually filesystems should hand out file identifiers for external linking
>which may or may not be the same as their on-disk inumbers.
>
>...
>
>Leo.
>
>-----------------------------------------------------------------
>University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
>
>
>  
>


-- 
Hans


