From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document
 the idea of what reiser4 wants to do with metafiles and why
Date: Wed, 01 Sep 2004 01:07:34 -0700
Message-ID: <41358346.20507@namesys.com>
References: <185110393004-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <185110393004-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

>Hans Reiser wrote on Mon, 30 Aug 2004 23:43:13 -0700:
>  
>
>>Alexander G. M. Smith wrote:
>>    
>>
>>>Are you sneaking in file types there?  Just how does a file know which
>>>plugins it supports?
>>>      
>>>
>>we have plugins with pluginids, is that what you mean by file type? I 
>>think they are a bit different from file types.
>>    
>>
>
>>From your white-paper: "Every file possesses a plugin id, and every
>directory possesses a plugin id.  This plugin id will identify a set
>of methods."
>
>Functionally this is very close to a file type.
>
A file type is based on semantics of the contents, and a plugin id is 
based on methods of the object.

>  It classifies the
>files into related groups, maybe not as finely as a MIME file type
>which can distinguish between multiple varieties of text files.
>
>A file type would tell us that a file is a text file and can be opened
>by certain applications (text/e-mail can be opened by e-mail reader,
>text editor, etc) and have other properties (lists of standard
>attributes, default icon).  A plugin ID says that the file can use text
>related plugins (like a word count, or XML structure as a subdirectory).
>
>In both cases there is a global repository (I assume) that associates
>the file type or plugin ID with a list of things about it.
>
>You could combine the two concepts, just have a file type ID that in the
>global repository specifies what plugins it can use as well as the
>userland properties (MIME string, etc) of that kind of file.  Or at least
>make the type ID available to userland so it can be used there.
>
>Or is this binding irrelevant?  How often does the file type the user
>sees not match the plugins desired for the file?  Or can a new subtype
>be defined for just that file?  Which may mean that we need something
>better than MIME strings for types (something which has inheritance).
>
>- Alex
>
>
>  
>
I think that there may be some good use for a filename/metas/type metafile.
