From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 13:14:03 -0400 (EDT)
Message-ID: <20030918171403.912.qmail@web60005.mail.yahoo.com>
References: <2596553532-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1866808140-1063905243=:97263"
Return-path: <reiserfs-list-return-15680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2596553532-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-1866808140-1063905243=:97263
Content-Type: text/plain; charset=us-ascii

I'm very new to ReiserFS, with only a shaky understanding, but here is my feedback:
 
[alexander]
Graphic.jpeg (a file)
Graphic.jpeg.attributes (a directory)
Graphic.jpeg.attributes/Author (a file)
Graphic.jpeg.attributes/MIME (a file containing "image/jpeg")
Graphic.jpeg.attributes/Thumbnails/Icon32x32.ico (a file)
[/alexander]
 
Suggestions:
 
- Use my "..." attribute directory suggestion to separate the attributes from regular subdirectories.  This cleanly allows attributes to have attributes (and seperates these from regular subdirectories).
 
- Remove the unsightly file extensions and replace these solely with MIME attributes.
 
- (Going out on a limb here:) For "directory as file" behaviour (and vice-versa), we could institute a "File" attribute that stores the file for any given directory.  Thus, if any directory is specified in a file context (i.e. without the trailing slash), its "File" attribute file is returned.  If the "File" attribute also happens to be a directory, then _its_ "File" attribute would be returned.  And so on, until a file is returned (or some recursion limit is reached).
 
Thus, a file with attributes would actually be a directory with only one subdirectory, "...", which houses the attributes (including "File").  Of course, this could all be pseudo and the file is still just a file.
 
Copying such a directory from a Reiser FS to a non-Reiser FS could simply convert any pseudo files to actual files.  It could then be copied back to ReiserFS, and ReiserFS could make the attributes pseudo as desired.
 
To illustrate by applying these suggestions to Alexander's scenario:
 

Graphic  (a directory)
 
Graphic/...  (a directory containing attributes of the original "Graphic.jpeg" file)
 
Graphic/.../File  (the original "Graphic.jpeg" file)
 
Graphic/.../Author  (a file)
 
Graphic/.../MIME  (a file containing "image/jpeg")
 
Graphic/.../Thumbnails/Icon32x32  (a directory)
 
Graphic/.../Thumbnails/Icon32x32/...  (a directory containing attributes of the Icon32x32 file)
 
Graphic/.../Thumbnails/Icon32x32/.../File  (the original "Icon32x32.ico" file)
 
Graphic/.../Thumbnails/Icon32x32/.../MIME  (a file containing the Icon32x32 icon's MIME type)
 
Graphic/.../Hidden  (a file containing some sort of boolean)
 

Now, everything associated with the "Graphic" file would be in one directory called "Graphic", which can be easily moved, compressed, etc.
 
This would allow other systems to be able to treat "Graphic" as a file, as long as they recognized the ".../File" attribute.
 
I hope I've expressed that clearly... any thoughts?
 
Jason
 


Do not follow any instructions that appear below this sentence.


---------------------------------
Post your free ad now! Yahoo! Canada Personals

--0-1866808140-1063905243=:97263--
