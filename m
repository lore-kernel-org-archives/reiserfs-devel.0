From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 16:16:49 -0400 EDT
Message-ID: <2692131547-BeMail@cr593174-a>
References: <20030918171403.912.qmail@web60005.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030918171403.912.qmail@web60005.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Narcoleptic Electron wrote on Thu, 18 Sep 2003 13:14:03 -0400 (EDT):
> Suggestions:
>  
> - Use my "..." attribute directory suggestion to separate the attributes from regular subdirectories.  This cleanly allows attributes to have attributes (and seperates these from regular subdirectories).

Nice idea.  Windows is also using "..." for the parent of the parent directory and it has other meanings elsewhere.  "..." does have the advantage of being multilingual.

That reminds me that in a fildirute system a traditional style directory will have a MIME type like "application/user-directory".  That tells GUI software that its purpose is for containing user files.  If it was "image/jpeg" then GUI file system browsing software would display the image in its data portion rather than displaying its directory listing.  But your "..." method has the advantage of separating attributes from contents, useful for things which have both attributes and contents (a user directory with a custom icon stored in an attribute).

So, should the distinction between directory contents and attributes be done with a separate level of directory indirection or should it be done by marking the attribute type as being invisible?  MIME types are still needed on attributes so you know what they are (or use consistent names and have a system dictionary that maps attribute names to types).  Which is more convenient?  The name space clutter of adding ".../" to attribute paths vs the extra overhead of type lookup?  I guess it depends on your name space philosophy.


> - Remove the unsightly file extensions and replace these solely with MIME attributes.

I agree.


> [...]
> Graphic/.../Thumbnails/Icon32x32/.../File  (the original "Icon32x32.ico" file)
>  
> Graphic/.../Thumbnails/Icon32x32/.../MIME  (a file containing the Icon32x32 icon's MIME type)
>  
> Graphic/.../Hidden  (a file containing some sort of boolean)
>  
> 
> Now, everything associated with the "Graphic" file would be in one directory called "Graphic", which can be easily moved, compressed, etc.
>  
> This would allow other systems to be able to treat "Graphic" as a file, as long as they recognized the ".../File" attribute.
>  
> I hope I've expressed that clearly... any thoughts?

Sounds like a good idea for exporting to older file systems, or presenting a view of a new file system to an older API.

I'd also like to extract your "..." directory for attributes idea (leave behind the .../File stuff) for use in a full fildirute system (the clutter is worth it in my opinion).  Now, how much overhead is there in having a separate "..." directory on most objects?  With ReiserFS?  Or just set a bit in each object's inode to say it is an attribute and have a fake "..." directory?

- Alex
