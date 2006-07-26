From: Toby Thain <toby@smartgames.ca>
Subject: Re: Viewing files as directories
Date: Tue, 25 Jul 2006 22:39:50 -0400
Message-ID: <BAYC1-PASMTP12B100C145103939458DB6BF5B0@CEZ.ICE>
References: <20060725133522.68964.qmail@web51314.mail.yahoo.com> <44C6B283.9010703@slaphack.com>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C6B283.9010703@slaphack.com>
Message-Id: <BDFC842D-87C3-444D-B38C-0E958C33FE02@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>


On 25-Jul-06, at 8:08 PM, David Masover wrote:

> Timothy Webster wrote:
> ...
>> Yes it would be really wonderful, if we could just see
>> directories as file and files as directories. Which of
>> course means a file and a directory are one in the
>> same.
>
> Ever use OS X?  It does this, to some extent, in Finder, which  
> supports
> the lkml point that doing this in the filesystem, or anywhere in the
> kernel, is unnecessary and a bad idea.
>
>> As things stand now the way forward seams to be per
>> application program mime types. Simple right, but it
>> is not because, applications tools like svn, brz,
>
> There are two OS X file types that I know of, and probably quite a few
> more, which are actually stored on disk as folders,

Apple calls them "packages": http://developer.apple.com/documentation/ 
DeveloperTools/Conceptual/SoftwareDistribution/Managed_Installs/ 
chapter_5_section_2.html

(I actually thought they were called "bundles", but as the following  
page explains, "The term bundle indicates a directory with a specific  
hierarchical structure, whereas the term package indicates a  
directory that is treated as an opaque entity by the Finder.")
http://developer.apple.com/documentation/CoreFoundation/Conceptual/ 
CFBundles/Concepts/about.html


> which is why most
> Mac software is distributed as disk images or zipfiles.  One is the
> Application type (.app, though Finder hides the extension) and the  
> other
> is the MPKG type (whatever it stands for, extension is .mpkg).

Apart from .pkg and .mpkg, bundle extensions are also treated  
specially including .bundle, .component, .qtx, etc.

>
> Basically, they appear as ordinary files to Finder, which means that
> most of the time, you cannot see that there are files inside them.   
> You
> double click on a .app, and it runs a script in a predefined relative
> location inside the folder.  Double click on a .mpkg, and it launches
> their installer program.  ...
>
> By the way, Hans, Apple has beaten you by quite a bit for at least  
> some
> of the functionality we've discussed.  You can do operations on Search
> Folders easily, which work by using Spotlight (an indexed fulltext  
> local
> system search engine).

Apparently running SQLite underneath.

> You can have files-as-directories, to a point.
> There are generic ways of getting at metadata, and they are done as
> plugins -- Spotlight plugins, anyway.
>
> I'd much rather use the Reiser4 described in the whitepaper, of  
> course,
> and I am getting sick of the lack of decent package management for my
> Mac, so I'll be adding a Linux boot.  I'm curious to see if Reiser4 is
> stable on PowerPC -- this is a year-old G4, I missed the Intel  
> cores by
> just a few short months...
>

