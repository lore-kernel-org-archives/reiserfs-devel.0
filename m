From: Nate Diller <ndiller@namesys.com>
Subject: Re: Novice question
Date: Wed, 06 Apr 2005 14:40:57 -0700
Message-ID: <42545769.8000804@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=------------000302000208060103000103
Return-path: <reiserfs-list-return-23789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jagannadha Bhattu <jagannadha.bhattu@gmail.com>
Cc: reiserfs-list@namesys.com, Vladimir Saveliev <vs@namesys.com>

--------------000302000208060103000103
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jagannadha

I understand that the terminology in Reiser4 is rather difficult to 
understand, even when you are reading the source code and comments.  A 
while ago I put together a glossary of terms which is still very much a 
work in progress.  I have included the latest version of it, in case you 
find it helpful.  If you or someone else on this list has additions or 
corrections, feel free to let me know.  I guess eventually we should 
post this to the web site too...

heh, I just read through it again and it's more rough and incomplete 
than I thought.  Maybe some of the guys who know this code better could 
answer some of the outstanding questions in it?

NATE

--------------000302000208060103000103
Content-Type: text/plain;
 name="reiser4glossary"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4glossary"

Reiser4 Glossary

Node:  Implemented as a file system block, the basic unit for the tree.  On x86, a node is 4KiB in size, however, there is no restriction
on it's size (is that true?), and there is no design restriction enforcing fixed-size nodes.  Each node has
a search plugin, so that node layouts are not written into the reiser4 spec.  *Compression can occur for unformatted nodes?  How?  I had
assumed it was done item-by-item as part of the item plugin.  Encryption too?  @#$%  Ok, they also appear to have their own search
methods too, even though all they have to do is find the item and invoke it's plugin.  What does an unformatted node's search plugin do?*

Object:  A logical entity at the semantic layer, such as a file or a directory.  This can be split into multiple pieces in the tree, as
determined by the storage layer, however, at the semantic layer, an object acts as though it is a single unified entity.  Each object has
a semantic plugin, such as a file or directory plugin (or both???), controlling how it is manipulated.  Objects are connected to each
other by directories, to form a graph.  *Is this entirely accurate?  Directories are mappings, and a mapping is more specific than the
vertex of a graph.  Even for a directed graph, there is no name to any vertex.  Also, what about lists?  Could a directory plugin be
written that has list semantics, including insert/delete, and ranges?*

Item:  The container object for the storage layer, it cannot span nodes.  In practice, they only hold data from one object, but the spec
does not limit items in this way.  Items can grow or shrink as necessary, and may be split or joined, but all of this behavior is
governed by the item plugin, not the tree's balancing code.  {Does the item plugin do anything other than balancing?}

Unit:  An indivisible piece of information.  A unit is a construct of a particular item plugin, so the balancing code never deals with
units directly, only that item's plugin does.  Nor is an item required to implement this, it could simply declare itself indivisible,
however, since items cannot span nodes, this would limit the size of it's contents.

Key:  Every item has exactly one key, which is it's non-unique identifier within the tree.  When the semantic layer wants to store data,
it asks the key assignment plugin for a key, and then invokes the storage layer to associate the data with that key.  Likewise to
retrieve data, the semantic layer gets the key it needs from supplying the key assignment plugin with the identifying information that
was supplied at creation time, and the appropriate key is generated.  The only function that might ever change the key for any data is a
repacker function, not yet written, that optimizes file placement in the tree (not just on disk, but tree locality).  The default
plugin's key is composed of two parts.  The first part references an object by it's objectID, and the second part an offset within that
object. *How are these parts distinguished?  If the second half of the key is an offset, then files must be stored contiguously (in tree
order, and in disk order if the repacker has finished).  How can the second part refer to an offset if an object can have data added
or removed from the middle?*

ObjectID:  The unique identifier for each object.

File:  The file object is a sequence of bytes, manipulated by it's plugin methods.  The file plugin is specified by the stat data object
which also holds other file metadata.

Directory:  Directory objects map a set of strings (names) to their corresponding objectID(?).  The hash plugin is specified per
directory plugin.  *Any connection with files (duality)?  How does the item plugin associated with entries know how to balance them?*

--------------000302000208060103000103--
