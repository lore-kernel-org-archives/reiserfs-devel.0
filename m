From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 20:39:43 +0200
Message-ID: <732570552.20040830203943@tnonline.net>
References: <20040829191044.GA10090@thundrix.ch> <3247172997-BeMail@cr593174-a>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3247172997-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Tonnerre <tonnerre@thundrix.ch>, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com, vonbrand@inf.utfsm.cl


  

> Tonnerre wrote on Sun, 29 Aug 2004 21:10:44 +0200:
>> On Fri, Aug 27, 2004 at 07:58:40PM -0400, Horst von Brand wrote:
>> > So the _kernel_ has to know about thousands of formats, just in case it
>> > some blue day it comes across a strange file? Better leave that to the
>> > applications.
>> 
>> I'd  do  that  quite  differently:  Collect metadata  about  files  in
>> extended attributes (which are  rather universally useable), and do it
>> from  an userspace daemon/application/file  manager plugin  which uses
>> dynamically   loadable   plugins   for   the  different   file  types
>> differentiated by libmagic.
>> 
>> This has nothing to do in the kernel.

> I mostly agree, like I was saying earlier, file types are needed!
> The kernel doesn't have to know about all of them, just some of
> them.  It should be possible to attach a file type to everything so
> you know what kind of thing it is, not just block or character
> device or file, but something like a MIME type.  If space is a
> concern, add to the inode a unique 8 byte character code for each
> popular type and a global translation table to get back the MIME
> string.

  The  kernel  doesn't  have anything to know about normal files.It is
  up to applications to determine and know the contents. Isn't it?

  Exception  would  be  of  course  special  meta  files  that  define
  attributes and permissions for the filesystem.


> The kernel (includes file systems and plug-ins) would have to
> know some standard file types and how to compare them for indexing
> purposes.  For example, an integer attribute like the year a music
> album was released would be stored as a 4 byte attribute "file" with
> a type like "primitive/int32", which tells the kernel to use 32 bit
> integer number comparison for indexing order.  Another type the
> kernel could be aware of are the file types used for security
> attributes.  A third kind it might need to know about are the
> computed attributes, which get set whenever related attributes they
> are computed from change.  For any unknown types, the kernel just
> stores the data and doesn't do any extra processing.

> Optionally the kernel could also maintain the global list of all
> file types and their properties (such as which ones are indexed,
> which are computed), though that could also be done in userland if
> you aren't doing indexing or computed attributes or other fancy
> operations.

> The determination of the types would be in userland (smart
> programs would write the type when they created the file).  Like you
> said, a daemon could classify unknown files in the background (BeOS
> does this).  Most of the uses of the file type would also be in
> userland, such as deciding which program can handle a given file, or
> what icon to display, or to hint that a file/directory/attribute
> thing should be interpreted as an old style directory to the user,
> or to mark a file thing as being worth backing up (don't need to
> back up the computed ones).

> - Alex

