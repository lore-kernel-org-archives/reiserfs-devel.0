From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Two usage examples for attribute directories.
Date: Sun, 04 Dec 2005 10:04:53 -0500 EST
Message-ID: <38878152157-BeMail@AlexDualP3>
References: <43917967.4080008@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43917967.4080008@st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Peter Foldiak wrote on Sat, 03 Dec 2005 10:54:31 +0000:
> But why do we need a new type of file? What can you do with it that you 
> absolutely couldn't without?

That's how I would do it, keep the namespace simpler.  The new file/directory
for attributes would only perhaps be useful for backwards compatibility with
operating systems that can't handle an item that's simultaneously both a
file and a directory.

As for mixing in the XML view, how about having it in a totally separate
directory tree?  Maybe a separate mount point.  Or since it's virtual,
have file/XML as the root of the XML tree that represents file and all its
contents and its nested children's contents.  Child files would also have a
child/XML tree just showing their contents and sub-children's representation,
which does duplicate part of the parent file/XML tree, but since it's virtual,
that's free.

>> From an implementation point of view, this would allow us to provide guidance 
>> to, or eventually even full FS-level support for indexed attributes.

For indexing, I'd add a file type byte or two to every file and use that to
help decide (along with file name) what things should be indexed or not.
BeOS decided based on the attribute name, and required that attributes with
that name all have the same datatype (otherwise adding to the index wouldn't
work too well - keys all have to be the same type for sorting reasons).

- Alex
