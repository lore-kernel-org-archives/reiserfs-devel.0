From: Kristian Koehntopp <kris@koehntopp.de>
Subject: Re: Strange directories after reisferfsck
Date: Wed, 5 Nov 2003 02:08:27 +0100
Message-ID: <20031105010827.GB13208@p15104972.pureserver.info>
References: <20031104065949.GA11108@p15104972.pureserver.info> <200311041653.03841.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200311041653.03841.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Kristian Koehntopp <kris@koehntopp.de>, reiserfs-list@namesys.com


Vitaly Fertman wrote:
> > - The /home partition holds lots of vmdk (VMware virtual disk
> >   files). reiserfsck looked through all blocks during the
> >   rebuild and interpreted contents of the vmdk files as valid
> >   leaf nodes, installing them into the /home proper instead.
> 
> yes, if you have reiserfs images in files on reiserfs partition it 
> can happen. you should compress such files or you may want 
> to use  a crypto loopback device to avoid the problem, xor
> encryption for example. 

I assume this is, because a rebuild has to scan the entire disk
for reiserfs data structures, due to the dynamic nature of the
filesystem? That is, in a traditional filesystem you know where
the inode areas are supposed to be from the information in the
superblock and can determine what is metadata and what is not
from the block address. In reiserfs you cannot, because any
block address can hold either metadata or data.

How do you recognize metadata in a rebuild scan? I assume you
are using magic bytes that markup potential metadata, and if a
rebuild scan does see these magic bytes, you check the data
structure and see if it matches several consistency checks?

If so, wouldn't it be useful not only to have a magic byte
marker in each data structure, but also a filesystem generation
number, that is unique for each filesystem generated, for
example the time_t the filesystem was created. Thus metadata
structures from vmdk or loop files would have the same magic
bytes as metadata from the main filesystem, but would be
recognizeable as belonging to a different tree due to the
different generation number.

> reiser4 will be able to keep reiser4 images in files without such 
> problems.

How does it do that?

Kristian
