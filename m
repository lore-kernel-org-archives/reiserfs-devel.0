From: Yury Umanets <umka@namesys.com>
Subject: Re: Some questions about Reiser4
Date: Sat, 26 Apr 2003 16:48:08 +0400
Message-ID: <3EAA8008.4020401@namesys.com>
References: <000c01c30b6a$d7f12590$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000c01c30b6a$d7f12590$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Fred -- Speed Up -- wrote:

>Hi there ;)
>
Hello,

>
>I've read the full official documentation about Reiser4 on the Namesys website, but some question still remain unanswerd. I'd like you to help me solving them :
>

>
>- Firstly the trees. I read that the it (the storage one, not the semantic side) grew on top, which makes the key grow in lenght. 
>
What do you mean speaking about key growth in length? Key consists of 
three 64bit components and namely the following:

(1) locality -- object id of the parent object (directory). It also 
contains for 4 bits used for key type.
(2) objectid -- object id (inode number) of the object itself.
(3) offset -- offset inside corresponding object.

Key is constant in length.

>But what about fanout ? When a file has been deleted, can its former key be freed and reused so that the tree keeps balanced ? 
>
First of all key cannot be reused in reiser4, because its two first 
components are obtained from one 64bit counter (oid allocator), which is 
incrementing each time when new object id (inode number) is needed.

Then, why do you think, that tree will be balanced, if file's key is 
reused after file is removed? You probably mean, that all places in tree 
removed file lies in may be reserved and later, when new file of the 
same size is ready, we can occupy these reserved places?

This is too difficuly, because between these two moments we need to do a 
lot of job in tree. Also the maintaining that structs for keeping 
reserved places is a job, which should be done and there are a lot of 
another tasks need to performed.

Yet another issue is that, the tree is not balanced well in the 
modifying time. This job (balancing) is deferred for flush time.

>Does Reiser4 otpimize the tree by storing small files together in a part of the tree, or directories,
>
Yes, reiser4 is storing small files in tree itself. Directories lie in 
tree too.

> or whatever organisation : when a file is being written, does Reiser4 give it the first key it finds, or does a segragation exist in order to improve performance ?
>
Before file can be written, it should be created, that is, its stat data 
should be created. In the creation time inode number is attached to file 
and key based on this inode number is assigned to created stat data.

This is example of stat data key. As you can see, its offset (third 
component) is zero and type is 1, that is stat data one.
[65536:1, 65537, 0]

And this one the key of the filebody start.
[65536:4, 65537, 0]

It has the same components, except of type (4) and namely file body.

Yet another example, key of the piece of file starting from 100 bytes 
offset.
[65536:4, 65537, 100]

As you can see, offset is 100 now.

> For instance, small temp files are created and deleted numbers of times, does a special part of the tree keep those temp files so that only a little part of the tree is constantly changing ?
>
Actually changing small number of small files does not lead to big 
chnages in tree immediately. I mean that tree will not be packed or 
something like this in this time. All big changes are deffred to flush 
time.

Flush which is running quite rarely is supposed to do the following actions:

(1) Finds dirty slums and pack them. That is, to take care about nodes 
packing (here may be used few invariants like node half filled, but the 
general rule for now is to pack nodes as much as possible).
(2) Allocate all unallocated yet things. That is to assign the real 
block numbers to internal pointers (index part of tree), formatted nodes 
and extents.
(3) Flushing to disk. This is part is quite complex, because of 
journaling in wandered locations. If you are interested in more detailed 
explanetion, ask Hans, or Zam.

>- What do you call a 'graph' when speaking about the structure the semantic layer uses to resolve paths ? How does this part really work (it is not formally spcified in the doc) ?
>
Ask Hans please :)

>- How about folders : what status do they have ? They may be stored as other files, as they have to keep their own properties, but their information (the folder's files and subfolder list) is being kept in the semantic layer's graph : how do you handle with this ?
>
The directories are almost the same objects like files are. That is they 
of course have stat data with properties strored in it and they have a 
body with list of subdirectories stored in it. The difference is that, 
entries body contains the may be accesed by means of using hash of name 
stored in entry, not the liner offset like generic files do.

Each entry roughly speaking contains the following parts:
(1) hash -- two 64bit values calculated by entry name and supposed to be 
used for searching entry by name.
(2) the key of the stat data of object, entry points to.
(3) optional entry name. As it may be obtained from hash, name is not 
stored in entry sometimes.

Thus, in the time you are performing cd /usr/ reiser4 perform the 
following actions:
(1) Seach for stat data key of the root directory. Opens root directory, 
that is makes serach of directory body, entries lie in it.
(2) Generates hash by name (usr) and makes entry lookup by this hash.
(3) After entry is found, its stat data key is extracted and jump to 
point (1), until whole path is parsed and stat data of the last 
directory/file is found.

Of course, this explanation is not full. It does not include symlinks 
handling and cases like not unique keys.

>- Why do you need to store the locality_id in the key ?
>
That is because we want group together all data belong to particular 
object. For instance, all items file contains them, will be stored 
together and reading the file will not lead to perform a lot of seeks. 
The same for directory.

>- How do you handle with big files wich do not fit in contiguous bloc space, so they need more than one extended pointer ? How are those other pointers stored ?
>
We handle this issue by means of using extents. Big file data consists 
of extents. Each extent consists of array  of extent units (pointers). 
The format of the extent unit is the following:

__u64 start;
__u64 width;

Extents file consists of are allocated on flush.

>- B+Trees are simply BTrees that do not use BLOBs, am I right ?
>
Ask Hans about.

>- Dancing trees are simply Balanced Trees wich are only modified in an event of memory pressure, don't they ?
>
That is because the trees are not balanced until flush carres about it. 
Flush is running on memory pressure or once in particular time interval.

>- How is the developement ? I mean, should we await the Reiser 4.0 release this summer, or do you need some more time ? What features will be included in 4.0 and which will be left for 4.1 ? Will the packer be ready for release as Reiser 4.0 comes out ?
>
I think Hans will answer this.

>
>My goal is to provide a french, complete and exact FDL licensed documentation about Reiser4, hopefully before the next month. I'd just like you to help me, I'm sure you'll be able to.
>
This is good. Are you going to consult with us the contents of that 
documentation?  It would be nice of you.

>
>
>Thank you in advance,
>
>Fred
>  
>


-- 
Yury Umanets




