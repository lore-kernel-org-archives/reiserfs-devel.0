From: Hans Reiser <reiser@namesys.com>
Subject: Re: Carrying Attributes too Far
Date: Sun, 07 Dec 2003 20:08:19 +0300
Message-ID: <3FD35E83.6030002@namesys.com>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk> <3FCE3716.8000509@namesys.com> <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk> <3FD07C4D.6090401@namesys.com> <1070753637.3fd267652753f@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070753637.3fd267652753f@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lrc1@st-andrews.ac.uk
Cc: reiserfs-list@namesys.com

lrc1@st-andrews.ac.uk wrote:

>>the
>>    
>>
>>>linking directory should store both an identifier for the child file's
>>>filesystem and the child file's on-disk inumber on that filesystem.* The
>>>      
>>>
>>reverse
>>    
>>
>>>links would be stored in the same way. 
>>>
>>>      
>>>
>>I can accept a patch that does this.
>>    
>>
>I would suggest that for every link to a file on a different filesystem,
>  
>
>
>(ulp) ... yessir. Two things though: first, it's going to be a while before I
>have any patches for you. When I said I wasn't even a passable Unix geek I
>wasn't being modest. But rest assured I am now working frantically on this. :)
>
>Second, before implementing hard linking across directories you're really going
>to need two-way links between directories and their children. * You'll also need
>explicit file deletion and if possible weak non-symbolic links (..loose links).
>
>* More precisely, you'll need the call to discover the parents of a given file.
>The actual reference from child to parent is only absolutely necessary for links
>across filesystems; on internal links it's basically a performance optimisation.
>
>[...]
>  
>
More precisely, I am willing to personally spend time worrying about the 
details of all this only if someone is coding it....;-)  Though you are 
welcome to discuss it in our mailing list as much as you want and I will 
watch the thread....



-- 
Hans


