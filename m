From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: lexicographic ordering is not always best
Date: Tue, 18 Feb 2003 13:54:04 +0300
Message-ID: <15954.4300.300740.395383@laputa.namesys.com>
References: <3E517263.3030504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12809-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E517263.3030504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hans Reiser writes:
 > Suppose that you have small directories, such that the time to do linear 
 > searching within the directory is not significant.
 > 
 > Suppose that you have a tendency to access files in readdir() order, and 
 > having files laid out in an order that is the same as the directory 
 > order is performance valuable.
 > 
 > Suppose that you create files too slowly for allocate on flush to fix 
 > this problem, and access them too soon for the repacker to fix this problem.
 > 
 > In that case, ordering both directory entries and file bodies in a first 
 > created first ordered order is optimal.
 > 
 > How much work would it be to create a reiser4 directory plugin to order 
 > in creation time order?  Could you do this by simply setting the hash 
 > field always to zero for that plugin, and letting the duplicate key code 
 > handle things?  If it is trivial to do, it might be useful.  Especially 
 > for the analysis of the performance of our algorithms on various benchmarks.

I do not see how this is possible. Lookup has to find the directory
entry given a name. If directory entries are ordered in the "creation"
order, some component(s) of directory entry key (ones that order
directory entry by creation) are unknown at the lookup time.

The only solutions that come to my mind are either double index
directory entries (this will solve a bunch of other problems as well),
or resort to a sequential scan (this is exactly what ext2 does, and, by
the way ext2 also mostly sorts directory entries by the creation time).

Have I missed something in your proposal?

Nikita.
