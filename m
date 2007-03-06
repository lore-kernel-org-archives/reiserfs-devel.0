From: Edward Shishkin <edward@namesys.com>
Subject: Re: Trying to understand keys in terms of objects, items, and units.
Date: Tue, 06 Mar 2007 18:54:22 +0300
Message-ID: <45ED8EAE.4070300@namesys.com>
References: <c82045430703051504t1c3dc813mffdc1aea3b8754c0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <c82045430703051504t1c3dc813mffdc1aea3b8754c0@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: reiserfs-list@namesys.com

John D. Heintz wrote:

> Hello all,
>
> Can someone help explain to me the relationship between keys and 
> objects/items/units? Specifically, I'm confused by the reality that a 
> single file (object?) is identified by one key,


This reality is incorrect. Key is assigned for a storage unit.
File is not a storage unit. Item is.
On-disk file includes different items, even items of different type
(for example, stat-data and extent pointers) which have different
key. However appropriate components of those keys are coincide.

> but the individual parts (stat_data, extends) each have their own keys 
> as well.


Right.
stat-data and extent pointer are items, and each item has a unique key.

> How does one key lead to the others?
>
> Are there any detailed examples of keys available?


Mount an empty reiser4 partition to /mnt, write a file
echo "Hello World" > /mnt/foo && sync
then investigate this partition by debugfs.reiser4 -t
You will see various examples of items and keys.
Note, that terminology can be different: NPTR
(node pointer) means internal item. SD is stat-data
item, DIRITEM is compound directory item, etc.
Ask if something is unclear.

> If the diagram from the whitepaper here: 
> http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif 
> <http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif> could 
> be annotated to contain samples for:
>  * a single directory,
>  * two small files,
>  * a large file (2-3 extents)
>  * the stat_data (and item keys)
>  * twig nodes showing delimiting keys and extent pointers
>  * formatted nodes showing directory entries, stat_data
>  * also, plugin id at the unit, item, and object levels would help!
>
> I think that would be very helpful for people to understand how the 
> tree and plugins work.


ok, I'll try to illustrate..

>
> I'm slogging through the code in my spare time, but I really hope 
> someone already knows the answers and will post an explanation!
>
> The following statements in the V4 whitepaper led me to realizing the 
> storage layer was doing something with keys I didn't understand:
>
>   "Everything in the tree has exactly one key."


Yeah, a bit clumsy phrase.. It would be better: "every object is
represented as a set of items, and every item has a unique key".

>
>   "These directory entries contain a name, and a key." (The Unix 
> Directory Plugin)


Right.
Like other objects, directory is represented as a set of items of
special "compound directory item" type. Its format  is defined in
reiser4/plugin/item/cde.h, see also comments at the beginning
of reiser4/plugin/item/cde.c
So every directory entry is represented on disk as a unit within
compound directory item.
 

>   "...more precisely, since a key selects not just the file but a 
> particular byte within a file,


Right.
For each file you can construct a unique key that will address a
particular byte within this file.

Actually, things in Reiser4 are more fine grained, and items are
considered as a (fully ordered) set of smaller objects, so-called
item's units, so every unit has its own key and item's key is coincide
with the key of its first unit. This approach is convenient.
For example, units can be used to address a particular bytes within
a file built of tail items. It is more graceful way, then just having
an item to access its content (which in common case can be quite
complex) by some ugly macro (approach of reiserfs, v3)

> it returns that part of the key which is sufficient to select the 
> file, and which is sufficient to allow the code to determine what the 
> full keys for those various parts when the byte offset and some other 
> fields (like item type) are added to the partial key to form a whole 
> key..."
>
>   "The key can then be used by the tree storage layer to find all the 
> pieces of that which was named."


Reiser4 is a storage layer of global Reiser's project which
aims to add support for semi-structured data querying to the
file system namespace (more details about global project are
in whitepaper.html)

>
>   "we can store just one key for the extent, and then we can calculate 
> the key of any byte within that extent."


It means we don't keep a key for each unit. Key of each unit
is calculated by its item key and unit's position in the item
(special method ->unit_key() of item plugin stands for this).
What should be kept in mind:
1) item is a "real" storage unit: its key is stored on disk.
2) item's unit is a "virtual" storage unit: its key is calculated.

>
> Thanks,
> John
>
> -- 
> John D. Heintz
> Principal Consultant
> New Aspects of Software
> Austin, TX
> (512) 633-1198 


