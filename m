From: Yury Umanets <umka@namesys.com>
Subject: Re: Virtual volumes...
Date: Thu, 21 Aug 2003 13:43:35 +0400
Message-ID: <1061459015.30048.17.camel@haron.namesys.com>
References: <7A9LQ9.1211187279E4T3F2@cisra.canon.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15381-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <7A9LQ9.1211187279E4T3F2@cisra.canon.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthew Allen <fret@memecode.com>
Cc: reiserfs-list@namesys.com

On Thu, 2003-08-21 at 10:25, Matthew Allen wrote:
> FYI I've quickly read the FAQ and done a search of the mailing list... and not found any mention of using ReiserFS in a virtual volume (or volume in a file). So excuse me if the information is somewhere...
> 
> For many months I've been looking for a way to store information for a MUA, and it seems to me that the obvious solution is to either use a database or use a filesystem.
> 
> Personally I like the features of reiserfs (esp the uncomming v4) and would much like to be able to use it to read/write a volume in a file. I know it's probably going to be hard to resize the volume, as most file systems are written to fill fixed size partitions on real hardware.
> 
> Finally another benifit of have a volume in a file is that Reiser can be using by an OS like Windows that doesn't have plugin file systems. For instance my mail client runs on Linux and Windows, using a monolithic mail store file (my own [lame] format) so that you could read/write mail from either OS in a dual boot environment. It works but it's slow and prone to corruption, hence I'm investigating a proper transactional file system ;)
> 
> Raw speed is not so much and issue as portability, crash recovery and flexibility.
> 
> So I have a few questions:
Hello,


> 1) Is it possible to redirect ReiserFS to use a file instead of a 

> physical disk? (As far as I'm aware LVM doesn't do that...)

Probably you mean loop back device?


> 2) How quickly can ReiserFS resize a partition?
First of all it depends on what side you resize a partition with
reiserfs on it. 

If you will grow filesystem, this will be done very quickly as only new
bitmap blocks will be created.

If you want to make it shorter, then it will take some time, as whole
balanced tree will be traversed in order to figure out if particular
node lies behind the future border. Then it will be and moved inside new
boundaries. Also, shrink quickness depends on how many blocks you want
to make filesystem shorter.
> 
> Ideally a file system would scale transparently to any size. 

> But I don't know enough about the disk format to know if thats possible. 

> Maybe with some redesign it could quickly resize a volume to better support being

>  used in a file. Obviously you don't want the virtual volume file to take up 

> stacks of unused space. Even if the granularity of resizing was pretty course I

>  wouldn't mind.
> 
> regards
> --
> Matthew Allen
> (fret@memecode.com) (http://www.memecode.com)

Regards.


