From: Edward Shishkin <edward@namesys.com>
Subject: Re: Technical plugin details
Date: Sun, 13 Nov 2005 19:42:19 +0300
Message-ID: <43776CEB.1050706@namesys.com>
References: <200511111830.44199.pvh@uvic.ca> <4376517A.4040402@namesys.com> <200511121834.24706.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511121834.24706.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter van Hardenberg <pvh@uvic.ca>, Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Peter van Hardenberg wrote:

>On November 12, 2005 12:32 pm, you wrote:
>  
>
>>Peter van Hardenberg wrote:
>>    
>>
>>>Hans,
>>>
>>>I am having trouble modifying a file to use our new plugin. I've tried
>>>writing various values into "foo/.^4/plugin/file" but it won't stick.
>>>      
>>>
>>This is a business of plugin->h.pops->change() method.
>>And for regular file plugin this method (change_file) does nothing.
>>
>>    
>>
>
>Thanks. That was exactly what we were trying to find. We did find it 
>eventually, after experimenting with some other plugin types to determine 
>what the problem was.
>
>Of course, we are still trying to figure out how to actually create a file 
>with a different file plugin.
>

You can write to "..../plugin/regular" of parent directory: this is a
place where reiser4_create (*) looks for a file plugin of target child,
just add a new plugin id of REISER4_REGULAR_PLUGIN_TYPE for your files.
However, this interface is not finally approved and can be changed.
Hans, is it okay, or..?

(*) in the latest versions of reiser4 this is a plugin->inode_ops->create()
(create_common)

Edward.

> I guess I will have to read the reiser4("...") 
>function as I can see no way to specify these things from a standard bash 
>shell.
>
>-pvh
>
>  
>

