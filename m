From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: Strange directories after reisferfsck
Date: Wed, 05 Nov 2003 03:07:04 +0100
Message-ID: <3FA85B48.1050202@gmx.net>
References: <20031104065949.GA11108@p15104972.pureserver.info> <200311041653.03841.vitaly@namesys.com> <20031105010827.GB13208@p15104972.pureserver.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031105010827.GB13208@p15104972.pureserver.info>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kristian Koehntopp <kris@koehntopp.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Kristian Koehntopp wrote:
> Vitaly Fertman wrote:
> 
>>>- The /home partition holds lots of vmdk (VMware virtual disk
>>>  files). reiserfsck looked through all blocks during the
>>>  rebuild and interpreted contents of the vmdk files as valid
>>>  leaf nodes, installing them into the /home proper instead.
>>
>>yes, if you have reiserfs images in files on reiserfs partition it 
>>can happen. you should compress such files or you may want 
>>to use  a crypto loopback device to avoid the problem, xor
>>encryption for example. 
> 
> 
> I assume this is, because a rebuild has to scan the entire disk
> for reiserfs data structures, due to the dynamic nature of the
> filesystem? That is, in a traditional filesystem you know where
> the inode areas are supposed to be from the information in the
> superblock and can determine what is metadata and what is not
> from the block address. In reiserfs you cannot, because any
> block address can hold either metadata or data.

Yes.


> How do you recognize metadata in a rebuild scan? I assume you
> are using magic bytes that markup potential metadata, and if a
> rebuild scan does see these magic bytes, you check the data
> structure and see if it matches several consistency checks?

AFAIK there was a dicussion on this list a few weeks ago and this was the
procedure specified at that time.


> If so, wouldn't it be useful not only to have a magic byte
> marker in each data structure, but also a filesystem generation
> number, that is unique for each filesystem generated, for
> example the time_t the filesystem was created. Thus metadata
> structures from vmdk or loop files would have the same magic
> bytes as metadata from the main filesystem, but would be
> recognizeable as belonging to a different tree due to the
> different generation number.

Yes, but:
- nobody wants to sponsor that feature
- reiserfs 3.6 is in feature freeze
- the on-disk format would be not backwards compatible


>>reiser4 will be able to keep reiser4 images in files without such 
>>problems.
> 
> 
> How does it do that?

By using the ideas you specified. Sorry to disappoint you: your ideas are
not new, but they are good. Good enough to be incorporated in reiser4.


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

