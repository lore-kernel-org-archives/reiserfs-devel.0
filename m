From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: WARNING: Too many iterations: 256
Date: Tue, 12 Nov 2002 15:36:17 +0300
Message-ID: <15824.62913.812486.109619@laputa.namesys.com>
References: <20021106145416.X2099@humilis>
	<15817.9308.653007.765672@laputa.namesys.com>
	<3DCED489.1080806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11970-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DCED489.1080806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: sander@humilis.net, reiserfs-list@namesys.com

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > >Sander writes:
 > > > Hi Both,
 > > > 
 > > > A fyi again. I hope this is helpful.
 > > > 
 > > > kernel 2.5.46, reiserfs snapshot 2002.11.05
 > > > 
 > > > When I try to untar 16 kernel sources at the same time, I get this in
 > > > the system log:
 > > > 
 > > > reiser4[ktxnmgrd:run(1340)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 128
 > > > reiser4[ktxnmgrd:run(1340)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 256
 > > > reiser4[tar(1519)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 128
 > > > reiser4[tar(1528)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 128
 > > > reiser4[ktxnmgrd:run(1340)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 512
 > > > reiser4[tar(1525)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 128
 > > > reiser4[ktxnmgrd:run(1340)]: jnode_flush (fs/reiser4/flush.c:1039)[jmacd-16739]:
 > >
 > >They all can be safely ignored. Warnings indicate that there is high
 > >contention for reiser4 balanced tree.
 > >
 > > > WARNING: flush failed: -11
 > > > jnode_flush failed with err = -11
 > > > jnode_flush failed with err = -11
 > > > reiser4[tar(1525)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 256
 > > > reiser4[tar(1525)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 512
 > > > reiser4[tar(1525)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 1024
 > > > reiser4[tar(1525)]: traverse_tree (fs/reiser4/search.c:465)[nikita-1481]:
 > > > WARNING: Too many iterations: 2048
 > > > reiser4[ktxnmgrd:run(1340)]: jnode_lock_parent_coord (fs/reiser4/flush.c:2681)[nikita-2757]:
 > > > WARNING: get_parent failed: -11
 > >
 > >Nikita.
 > >
 > >
 > >  
 > >
 > It is interesting that he is hitting this warning though.  It might be 
 > worthwhile to try to understand if it is a symptom of something 
 > deserving a fix.  Please put that in your todo list (I know it is full, 
 > but...) if you don't already understand it.

I see these routinely. It looks that flush keeps locks (on the twig
node?) for way too long causing other processes to bounce.

 > 
 > Hans
 > 

Nikita.
