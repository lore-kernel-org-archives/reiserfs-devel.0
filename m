From: Hans Reiser <reiser@namesys.com>
Subject: Re: Carrying Attributes too Far
Date: Wed, 24 Sep 2003 13:35:23 +0400
Message-ID: <3F71655B.4060704@namesys.com>
References: <1971720372-BeMail@cr593174-a> <1064280061.3f6f9ffd2c514@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1064280061.3f6f9ffd2c514@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lrc1@st-andrews.ac.uk
Cc: reiserfs-list@namesys.com

lrc1@st-andrews.ac.uk wrote:

>Quoting "Alexander G. M. Smith" <agmsmith@rogers.com>:
>
><snip />
>
>  
>
>>lrc1@st-andrews.ac.uk wrote on Mon, 22 Sep 2003 14:28:30 +0100:
>>    
>>
>>>* Will
>>>
>>>	chmod u-rwx somefile; chmod u+rwx somefile
>>>
>>>still work? What special-case behaviour will be needed to make it work?
>>>      
>>>
>>Likely via the Janus (two faced) view of the file system as ordinary files
>>and directories for old software.  Ideally new versions of ls, chmod (or a
>>completely new permission system), etc, would be needed for native use.
>>
>>    
>>
>
>The question wasn't "Will there still be a chmod?". Of course there can still 
>be a chmod call in the legacy interface, or a chmodlike "convenience method" 
>call in the new one. The question is whether the subfile metadata system will 
>be compatible with permissions systems in which a user is able to revoke his 
>own permissions to a file and then return them again - such as the current Unix 
>permissions system - and what bodges you would accept to make it compatible. Be 
>more specific - in all these questions, the devil shows itself in the detail.
>
We will continue to support the VFS interface.

>
>  
>
>>>* Will it be possible to make a attribute file the child of
>>>/pub/some_ordinary_directory via a hard link? Will it be possible to make
>>>      
>>>
>>an
>>    
>>
>>>attribute file into an attribute file for some other file? That has
>>>      
>>>
>>completely
>>    
>>
>>>different permissions? And is owned by a different user? What will have to
>>>happen, in either case, at the time the file is hard-linked to its new
>>>      
>>>
>>parent?
>>
>>Attributes are files (actually what I call fildirute Things - file directory
>>and attribute all at once) like any other Thing.  So presumably the same hard
>>linking and permission rights apply to them as you already have for
>>conventional files 
>>    
>>
>
>I agree that attribute files should be files like any other. So attribute files 
>should certainly have the same linking and permissions rights as any other 
>file.
>
Why?  Not at all, I would say. 

> How would you implement that?
>
>  
>
>>(the permission is part of the fildirute Thing, perhaps
>>via a plug-in).
>>    
>>
>
><snip />
>
>If attribute files have a different permissions system to all other files, how 
>are they files like any other?
>
>If a file is both an attribute file and a child 
>of /pub/some_ordinary_directory , should it have the permissions system of an 
>ordinary file or an attribute file? What are the consequences of either choice?
>
>If an attribute file's permissions metadata is part of it, is the attribute 
>file really a simple sequence of bytes like any other file? If it is, then what 
>will prevent any user with write permissions to the attribute file from 
>changing the part of the file that records its permissions metadata to whatever 
>she wishes?
>
>As to my third question, how would a user go about changing the owner of a 
>file? How might she be prevented from doing so?
>
>  
>
>>- Alex
>>    
>>
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


