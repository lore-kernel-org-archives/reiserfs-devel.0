From: Hans Reiser <reiser@namesys.com>
Subject: lexicographic ordering is not always best
Date: Tue, 18 Feb 2003 02:38:11 +0300
Message-ID: <3E517263.3030504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12797-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: nikita@namesys.com
Cc: ReiserFS <reiserfs-list@namesys.com>

Suppose that you have small directories, such that the time to do linear 
searching within the directory is not significant.

Suppose that you have a tendency to access files in readdir() order, and 
having files laid out in an order that is the same as the directory 
order is performance valuable.

Suppose that you create files too slowly for allocate on flush to fix 
this problem, and access them too soon for the repacker to fix this problem.

In that case, ordering both directory entries and file bodies in a first 
created first ordered order is optimal.

How much work would it be to create a reiser4 directory plugin to order 
in creation time order?  Could you do this by simply setting the hash 
field always to zero for that plugin, and letting the duplicate key code 
handle things?  If it is trivial to do, it might be useful.  Especially 
for the analysis of the performance of our algorithms on various benchmarks.

Are you ready to work on implementing file body key assignment in order 
of directory entries?

-- 
Hans


