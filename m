From: Hans Reiser <reiser@namesys.com>
Subject: Re: file as a directory
Date: Tue, 14 Dec 2004 09:24:12 -0800
Message-ID: <41BF21BC.1020809@namesys.com>
References: <200411301631.iAUGVT8h007823@laptop11.inf.utfsm.cl>	 <41ACA7C9.1070001@namesys.com> <1103043518.21728.159.camel@pear.st-and.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22764-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1103043518.21728.159.camel@pear.st-and.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Peter, I think you are right, though it might be useful to have the 
default be dirname/..../glued and to allow users to link 
dirname/..../filebody to 
dirname/..../something_else_if_they_want_it_to_not_be_glued, and to have 
dirname/..../filebody or whatever it is linked to be what they get if 
they read the directory as a file.

Hans

Peter Foldiak wrote:

>Hans,
>Following the recent discussions on the lists on "file as directory", I
>re-read part of your http://www.namesys.com/v4/v4.html paper (in
>sections near "Aggregating Files Can Improve The User Interface To
>Them") and realised that you have discussed this issue in quite a lot of
>detail already there (see copied below). (Strange though that nobody
>referred to it in the discussion! People don't seem to be very good at
>reading (and that seems to include me)).
>
>It looks to me that the "file as directory" and "directory as file"
>issues are almost identical. What you are saying is that you could
>automatically aggregate files in a directory to look like a single file
>(you give the example of the /etc/passwd file). I was saying that you
>could make a file look like a directory.
>Perhaps a better way to think about this is that instead of talking
>about directories and files, we just talk about objects. Each object
>would have file-type access methods and directory-type access methods.
>This has some implications for the syntax. You (in v4.html) suggest
>using the /.glued syntax:
>
>/new_syntax_access_path/big_directory_of_small_files/.glued
>
>I think the "object" philosophy would rather imply that the object (or
>directory) should have a default glueing method, so when you access the
>directory as a file (using read(), for instance)
>
>/new_syntax_access_path/big_directory_of_small_files
>
>would automatically give you the glued file (without having to add the
>.glued !) and when you access it as a directory (using readdir(), for
>instance), you would get the components listed as a directory.
>(I am not sure whether the access method, e.g. read() vs. readdir() is
>sufficient to distinguish the meaning. Another way may be putting a "/"
>after the objectname to indicate that you want it as a directory.)
>
>If we do this, the applications don't need to know whether they are
>dealing with an object consisting of small files, aggregated, or whether
>they are looking at a big file with some way of accessing their parts.
>If an old application (or user) looks for the /etc/passwd file, it will
>still get what it expects without having to know that the file is an
>aggregate.
>
>In fact, from the point of view of the file system, it doesn't make much
>of a difference, in both cases they map names to keys. The only
>difference (as far as I can see) is whether metadata is stored
>separately for each component or only once for the objcts. 
>
>If you store metadata only once, then a component could inherit metadata
>(such as modification date) from the parent. There should be some way of
>telling the file system which bits need their own metadata. But the way
>of telling the file system this probably should not be mixed up with the
>file naming.
>
>There may be some complications with some parts of files being linked to
>a different number of times, so if you remove a hard link from the whole
>file, should a component linked from elsewhere be kept or deleted.
>
>Do you think we could leave off the ./glued bit? Would it break too many
>things?
>
> Peter
>
>In http://www.namesys.com/v4/v4.html Hans Reiser wrote:
>  
>
>>...
>>Aggregating Files Can Improve The User Interface To Them
>>Consider the use of emacs on a collection of a thousand small 8-32
>>    
>>
>byte
>  
>
>>files like you might have if you deconstructed /etc/passwd into small
>>files with separable acls for every field. It is more convenient in
>>screen real estate, buffer management, and other user interface
>>considerations, to operate on them as an aggregation all placed into a
>>single buffer rather than as a thousand 8-32 byte buffers.
>>
>>
>>How Do We Write Modifications To An Aggregation
>>Suppose we create a plugin that aggregates all of the files in a
>>directory into a single stream. How does one handle writes to that
>>aggregation that change the length of the components of that
>>aggregation?
>>
>>Richard Stallman pointed out to me that if we separate the aggregated
>>files with delimiters, then emacs need not be changed at all to
>>    
>>
>acquire
>  
>
>>an effective interface for large numbers of small files accessed via
>>    
>>
>an
>  
>
>>aggregation plugin. If
>>/new_syntax_access_path/big_directory_of_small_files/.glued is a
>>    
>>
>plugin
>  
>
>>that aggregates every file in big_directory_of_small_files with a
>>delimiter separating every file within the aggregation, then one can
>>simply type emacs
>>/new_syntax_access_path/big_directory_of_small_files/.glued, and the
>>filesystem has done all the work emacs needs to be effective at this.
>>Not a line of emacs needs to be changed.
>>
>>One needs to be able to choose different delimiting syntax for
>>    
>>
>different
>  
>
>>aggregation plugins so that one can, for say the passwd file,
>>    
>>
>aggregate
>  
>
>>subdirectories into lines, and files within those subdirectories into
>>colon separate fields within the line. XML would benefit from yet
>>    
>>
>other
>  
>
>>delimiter construction rules. (We have been told by Philipp Guehring 
>>    
>>
>of
>  
>
>>LivingXML.NET  that ReiserFS is higher performance than any database
>>    
>>
>for
>  
>
>>storing XML, so this issue is not purely theoretical.)
>>
>>
>>Aggregation Is Best Implemented As Inheritance
>>In summary, to be able to achieve precision in security we need to
>>    
>>
>have
>  
>
>>inheritance with specifiable delimiters and we need whole file
>>inheritance to support ACLs.
>>
>>
>>One Plugin Using Delimiters That Resemble sys_reiser4() Syntax
>>We provide the infrastructure for your constructing plugins that
>>implement arbitrary processing of writes to inheriting files, but we
>>also supply one generic inheriting file plugin that intentionally uses
>>delimiters very close to the sys_reiser4() syntax. We will document
>>    
>>
>the
>  
>
>>syntax more fully when that code is working, for now syntax details
>>    
>>
>are
>  
>
>>in the comments in the file invert.c in the source code. ...
>>    
>>
>
>
>
>  
>

