From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: too many iterations - Reiser 4
Date: Tue, 9 Nov 2004 11:55:28 +0300
Message-ID: <16784.34304.615668.400334@thebsh.namesys.com>
References: <DEA5D319C867D5119DBD08000674A9F60BCCD34B@vies113a.sie.siemens.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <DEA5D319C867D5119DBD08000674A9F60BCCD34B@vies113a.sie.siemens.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linzatti Christian <Christian.Linzatti@siemens.com>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Linzatti Christian writes:
 > 
 > > Hello
 > > I have got Problems with the Kernel 2.6.9 and reiser 4. I am using the
 > > nitro Patch. http://sepi.be/nitro.php
 > > When I boot Linux, I got this error messages. What shoud I do? 
 > > 
 > >  reiser4[ls(30795)]: traverse_tree (fs/reiser4/search.c:488)[nikita-1481]:
 > > 
 > > WARNING: Too many iterations: 128 reiser4[ls(30795)]: traverse_tree
 > > (fs/reiser4/search.c:488)[nikita-1481]: 
 > > WARNING: Too many iterations: 256 reiser4[ls(30795)]: traverse_tree
 > > (fs/reiser4/search.c:488)[nikita-1481]: 
 > > WARNING: Too many iterations: 512 reiser4[ls(30795)]: traverse_tree
 > > (fs/reiser4/search.c:488)[nikita-1481]: 
 > > WARNING: Too many iterations: 1024 reiser4[ls(30795)]: traverse_tree
 > > (fs/reiser4/search.c:488)[nikita-1481]: 
 > > ...

And what happens after this? Do iteration numbers continue to increase
unboundedly? Do you have multiple pocesses accessing reiser4 file system
concurrently at this point?

 > > 
 > > Thanks!

Nikita.
