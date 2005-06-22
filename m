From: Hans Reiser <reiser@namesys.com>
Subject: reiser4 plugins
Date: Tue, 21 Jun 2005 18:07:58 -0700
Message-ID: <42B8B9EE.7020002@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org> <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24433-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050621202448.GB30182@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Jeff Garzik <jgarzik@pobox.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Christoph,

Reiser4 users love the plugin concept, and all audiences which have
listened to a presentation on plugins have been quite positive about
it.  Many users think it is the best thing about reiser4.  Can you
articulate why you are opposed to plugins in more detail?  Perhaps you
are simply not as familiar with it as the audiences I have presented
to.  Perhaps persons on our mailing list can comment.....

In particular, what is wrong with having a plugin id associated with
every file, storing the pluginid on disk in permanent storage in the
stat data, and having that plugin id define the set of methods that
implement the vfs operations associated with a particular file, rather
than defining VFS methods only at filesystem granularity?

What is wrong with having an encryption plugin implemented in this
manner?  What is wrong with being able to have some files implemented
using a compression plugin, and others in the same filesystem not.

What is wrong with having one file in the FS use a write only plugin, in
which the encrypion key is changed with every append in a forward but
not backward computable manner, and in order to read a file you must
either have a key that is stored on another computer or be reading what
was written after the moment of cracking root?

What is wrong with having a set of critical data files use a CRC
checking file plugin?

What we have hurts no one but us.  I have never seen an audience for one
of my talks that thought it hurt us..... most audiences think it is
great.  

Let us tinker with our FS, and you tinker with yours, and so long as
what we do does not affect your FS, let the users choose.

In the end, somebody will write a new fs that steals the good ideas from
both of us, and obsoletes us both.  They can only do this though if we
are left to be both free to implement differing filesystem designs.

I do not tell you how to design XFS, why are you making my life unpleasant?

Christoph Hellwig wrote:

>Hans, we had this discussion before.  And the consensus was pretty simple:
>the disk structure plugins are your business and fine to keep.  The
>higher-level pluging that just add another useless abstraction below
>file_operation/inode_operation/etc.  are not.  keep the former and kill
>the latter and you're one step further.
>
>
>  
>

