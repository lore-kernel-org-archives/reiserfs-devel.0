From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: "Unformat" a ReiserFS partition : a testimony :-)
Date: Tue, 25 Mar 2003 20:25:38 +0300
Message-ID: <200303252025.38861.vitaly@namesys.com>
References: <3E7F5E33.4020709@info.ucl.ac.be> <3E7F9FD1.7060801@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E7F9FD1.7060801@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yury Umanets <umka@namesys.com>, Nicolas Vanderavero <nv@info.ucl.ac.be>
Cc: reiserfs-list@namesys.com


Hi,

On Tuesday 25 March 2003 03:16, Yury Umanets wrote:
> Nicolas Vanderavero wrote:
> > Hello,
>
> Hello Nicolas,
>
> > while reinstalling a Debian on a new hard drive, I made the mistake to
> > format in reiserfs my good old /home which was on /dev/sda7 instead of
> > formatting the new /dev/hda7. Gasp ! Eight gigabytes lost ...
> >
> > Or ... maybe it was not totally lost :-) I immediately made a dump of
> > the partition with 'dd' and started grepping some known text on it. It
> > seemed that no data was really lost. I didn't know what to do. So I
> > read the man pages and found the reiserfsck command quite interesting :-)
>
> You have lost the super block and probably old root node. I said
> "probably" because it might be not used in teh time you did format.

superblock, bitmaps, journal content and almost always one block which usualy 
is not old root node, but the very first leaf on the fs with a part/the whole 
root directory.

> > Ok, I am a total newbie to filesystems and to ReiserFS. So maybe it
> > will sound trivial to you, but just in case it happens to anyone else,
> > I just wanted to say that running a reiserfsck --rebuild-tree -S on my
> > partition was enough to unformat it. I ended up with some file in
> > lost+found, but a 'file *' is enough to discover what they are.

Right.

> The first thing you should do in cases like this is to make backup. I
> hope you'll find eight gigabytes for that. Now you may feel free to do
> anything with you old partition. Then you should to do --rebuild-sb and
> try to fsck the partition with --check key. Then follow to fsck sugestions.

:)) no, Yura, reiserfs is in a good state after mkreiserfs and --rebuild-sb / 
--check will say 'all is fine, enjoy'. Plus, -S is used in cases when fs is 
ok, but some data are lost, so you may want to backup not the whole partition, 
but only cp important data somewhere from the mounted fs (to avoid their 
corruption while rebuilding with -S option what may occure).

> These should be enought for getting you partition back.
>
> > So, maybe it would be usefull to add an entry in the "Example of
> > using" section of the man page of reiserfsck, saying something like :
> > "If you reformatted by mistake a reiserFS partition, you can try to
> > unformat it by running reiserfsck --rebuild-tree -S on it".

--scan-whole-partition does what is written in man page - scan the whole
partition, not only used space - and brings back all what was found. That 
means that have just created reiserfs partition with all copeid data on 
it will be recovered, all not overwritten data from the previous reiserfs 
will be recovered. There were also some data which were deleted once and 
the space they occupied has not been reused - get recoved also. All data
with the same key go to the same file/dir and old versions of files will 
be merged with new versions, or deleted file will be merged with the new 
one - this may lead to data corruption. And while building the tree for 
all these found data you can run out of disk space.

So it is not an undelete feature and not unformat feature, although can be 
used pretty efficiently for these 2 purpose _just_after_ a wrong remove / 
format. Or just after fsck --rebuild-tree, if fsck has not recovered some 
important data due to bitmap corruption.
As a result, -S is more like a hack - it is not undelete, unformat, undo, 
but you can try to recover smth from unused space, valid data can become 
corrupted while being merged with old data, so it should be used with high 
caution and it is not for wide-usage anyway.

> P.S. Please read http://www.namesys.com/support.html. Can you as for
> support?

It seems that Nicolas does not need our support as he wrote about his 
result how he had successfully unformatted the fs. 

-- 

Thanks,
Vitaly Fertman

