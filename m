From: Hans Reiser <reiser@namesys.com>
Subject: Re: Carrying Attributes too Far
Date: Wed, 03 Dec 2003 22:18:46 +0300
Message-ID: <3FCE3716.8000509@namesys.com>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lrc1@st-andrews.ac.uk
Cc: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

Oops, found this in my drafts box after a long time had passed.....

Hans

lrc1@st-andrews.ac.uk wrote:

>Sorry for the delay in replying.
>
>Quoting Hubert Chan <hubert@uhoreg.ca>:
>
>  
>
>>>>>>>"Leo" == lrc1  <lrc1@st-andrews.ac.uk> writes:
>>>>>>>              
>>>>>>>
>>[...]
>>
>>    
>>
>>>>Why?  Not at all, I would say.
>>>>        
>>>>
>>Leo> Short answer: because otherwise you have ""attributes" that cannot
>>Leo> interact with files in all the same ways that files can interact
>>Leo> with files" ( http://www.namesys.com/v4/v4.html ).
>>
>>Hard linking isn't a universal attribute, though.  For example, you
>>cannot hard link over different filesystems.  If an attribute (such as
>>uid, premissions, etc.) are implemented by just taking the file's
>>standard stat data and exposing it as a file interface, that it is
>>similar to that data being from a different filesystem, and so you
>>can't hardlink.  This would be similar, I suppose, to if a plugin
>>exposes an MP3's id3 data as files -- it would make no sense to be able
>>to hardlink that, since the data is stored in the MP3 file, and not as
>>part of the filesystem.
>>
>>    
>>
>
>Yes, it is impossible to hard-link between two files on different volumes
>(except at mount points) in the Unix filesystem, but it shouldn't be. (More
>generally, with the necessary permissions it should be possible to make any file
>the child of any directory via a hard link, except where doing so would create a
>cycle.) 
>
This implies that two filesystems can share an identification number
between them.

>There's no semantic reason why it shouldn't be possible; in other words,
>if it's meaningful for a file to be named both /pub/pictures/sunrise and
>/home/alice/pictures/daylight , why would it in fact not be meaningful just
>because a volume is mounted at /home ? Hard-linking across mount subtrees is not
>possible in existing Unix filesystems for non-semantic reasons, the most
>interesting of which is that it doesn't fit with the Unix concept of mount
>subtrees and mount points. The correct solution to this is to throw out that
>concept, something I'll post about later.
>
>Note that hard-linking between files on different volumes is a necessity if you
>want to do the kind of things discussed in Future Vision cleanly. If I did a
>simple search for all mp3s at least 3 minutes long, I would expect to get back a
>directory which had as its children all the 3-min.+ mp3s visible to me on the
>computer. I wouldn't necessarily care if some of the mp3s were on a different
>mount subtree to the search directory, and I wouldn't expect to find things like
>symlinks being used to duct-tape the mp3s onto the directory.
>
>(As to your id3 example: Yes, the id3 file data is stored in the mp3 file, but
>then the /etc/motd file data is stored in the file /dev/hda1 or whatever.
>There's no reason why it makes any less sense be able to hard-link to the id3
>file than to /etc/motd. Why shouldn't I be able to use a search to get a
>directory linked to all the id3 files on the system?)
>
>But for the sake of argument, let's assume that indeed it should remain
>impossible to hard-link across mount subtrees, or at least that it will. Will
>this actually prevent the problems of ordinary directories hard-linking to
>attribute files not their own? Consider a case in which /pub/somedir and
>/home/alice/hello.mp3 are both on the same volume, say /dev/hda1 . If even one
>of hello.mp3's attribute files (or to be more precise, one of the files which
>inherit metadata from hello.mp3) is on the same mount subtree as somedir , then
>the restriction on hard-linking between files on different volumes is not
>sufficient to prevent the problems. So can we find an attribute file of
>hello.mp3 which might actually be on /dev/hda1 ? An id3 file derived
>automatically from hello.mp3 should be quite safe; its device file is hello.mp3
>, just as hello.mp3 's device file is /dev/hda1 , so it should be in a different
>mount subtree to hello.mp3 . (But incidentally, this raises another question: if
>one of hello.mp3 's descendants is a mount point, what happens when alice types
>
>    mv hello.mp3 hi.mp3
>
>?) By contrast, imagine that alice writes a short text file of information about
>hello.mp3. Clearly this is hello.mp3 metadata, so she saves the file in
>hello.mp3/+/info . info isn't automatically derived from mp3, so why wouldn't it
>just be another file on /dev/hda1 like hello.mp3 and somedir ? As to
>permissions, wasn't it the intention to use permissions files as a *replacement*
>for stat and friends, not just as a means of exposing stat through a file
>interface? If hello.mp3/+/permissions replaces stat and friends, then it's in
>the same position as hello.mp3/+/info . If it simply exposes then, then subfile
>metadata is a lot less interesting - for one thing, it doesn't make implementing
>different permissions systems any easier (the opposite, in fact).
>
>But even if ordinary directories can't hard-link to other files' attribute
>files, the problem of multiple inheritance of metadata still isn't fully solved.
>What if two children of hello.mp3/+/ have different permissions, and a third
>file is the child of both of them? And what about the proposal that ordinary,
>non-attribute files should inherit metadata from their parent directories? 
> 
><snip />
>
>  
>
>>Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
>>    
>>
><snip />
>
>Leo.
>
>
>-----------------------------------------------------------------
>University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
>
>
>  
>


-- 
Hans



