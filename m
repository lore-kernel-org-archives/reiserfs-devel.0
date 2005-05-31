From: Hans Reiser <reiser@namesys.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 11:27:18 -0700
Message-ID: <429CAC86.3080308@namesys.com>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>	 <75229416615-BeMail@cr593174-a>	 <17052.12223.708707.757538@gargle.gargle.HOWL>	 <429C7D0A.6040200@namesys.com>	 <200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>	 <1117558515.13252.21.camel@localhost>  <429C97F9.8000009@namesys.com> <1117559594.13252.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1117559594.13252.26.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Valdis.Kletnieks@vt.edu, Nikita Danilov <nikita@clusterfs.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com, Nate Diller <ndiller@namesys.com>

Well,. if you allow multiple true names, then you start to resemble
something I suggested a few years ago, in which I outlined a taxonomy of
links, and suggested that some links would count towards the reference
count and some would not.

Of course, that does nothing for the cycle problem......

How are cycles handled for symlinks currently?

Hans

Jonathan Briggs wrote:

>Either that isn't allowed, or it immediately vanishes from all
>directories.
>
>If deleting by OID isn't allowed, then every name property must be
>removed in order to delete the file.
>
>Personally, I would allow deleting the OID.  It would be a convenient
>way to be sure every instance of a file was deleted.
>
>On Tue, 2005-05-31 at 09:59 -0700, Hans Reiser wrote:
>  
>
>>What happens when you unlink the True Name?
>>
>>Hans
>>
>>Jonathan Briggs wrote:
>>
>>    
>>
>>>You can avoid cycles by redefining the problem.
>>>
>>>Every file or "data object" has one single True Name which is their
>>>inode or OID.  Each data object then has one or more "names" as
>>>properties.  Names are either single strings with slash separators for
>>>directories, or each directory element is a unique object in an object
>>>list.  Directories then become queries that return the set of objects
>>>holding that directory name.  The query results are of course cached and
>>>updated whenever a name property changes.
>>>
>>>Now there are no cycles, although a naive Unix "find" program could get
>>>stuck in a loop.
>>> 
>>>
>>>      
>>>

