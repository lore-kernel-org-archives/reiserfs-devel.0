From: Hans Reiser <reiser@namesys.com>
Subject: Re: [Fwd: Re: [OT] block allocation algorithm [Was] Re: heavily fragmented
 file system.. How to defrag it on-line??]
Date: Fri, 26 Mar 2004 08:46:08 -0800
Message-ID: <40645E50.2090105@namesys.com>
References: <40636893.3050605@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40636893.3050605@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: reiserfs-list@namesys.com, zam@thebsh.namesys.com

Zam, please analyze why we have so many fragments in Reiser4.  It should 
not be.  At most we should have 1 fragment per invocation of slum flushing.

Hans

Mike Fedyk wrote:

> Hi guys,
>
> Reiser3 has worse fragmentation than ext3 in this test case.  Reiser4 
> was better, but it had a bad worst case and still wasn't as good as xfs.
>
> I'm especially interested in getting reiser3 to produce fewer 
> fragments in this test.
>
> Comments?
>
> -------- Original Message --------
> Subject: Re: [OT] block allocation algorithm [Was] Re: heavily 
> fragmented    file system.. How to defrag it on-line??
> Date: Mon, 15 Mar 2004 11:13:32 +0800
> From: Isaac Claymore <clay@exavio.com.cn>
> To: Andreas Dilger <adilger@clusterfs.com>
> CC: ext3-users@redhat.com
> References: <41089CB27BD8D24E8385C8003EDAF7AB06D296@karl.alexa.com> 
> <20040304021707.GA13386@thunk.org> 
> <20040309074643.GA1557@exavio.com.cn> 
> <20040309080248.GB1144@schnapps.adilger.int>
>
> On Tue, Mar 09, 2004 at 01:02:48AM -0700, Andreas Dilger wrote:
>
>> On Mar 09, 2004  15:46 +0800, Isaac Claymore wrote:
>> > I've got a workload that several clients tend to write to separate 
>> files
>> > under a same dir simultaneously, resulting in heavily fragmented 
>> files.
>> > And, even worse, those files are rarely read simultaneously, thus read
>> > performance degrades quite alot.
>> > > I'm wondering whether there's any feature that helps alleviating
>> > fragmentation in such workloads. Does writing to different dirs(of 
>> a same
>> > filesystem) help?
>>
>> Very much yes.  Files allocated from different directories will get 
>> blocks
>> from different parts of the filesystem (if available), so they should be
>> less fragmented.  In 2.6 there is a heuristic that files opened by 
>> different
>> processes allocate from different parts of a group, even within the same
>> directory, but that only really helps if the files themselves aren't too
>> large (i.e. under 8MB or so).
>>
>
> Thanks, I did some test on this last weekend, and here're the results in
> case someone is interested:
>
>
> Test environment:
>
> kernel: 2.6.3 with latest reiser4 patches applied.
> OS: Debian testing/unstable
> HW: Intel(R) Pentium(R) 4 CPU 1.80GHz, 256M RAM
>
> For each FS configuration, my test went on as: dumping 3 files of 1G
> each simultaneously, and measure the fragmentation with 'filefrag'.
>
> Each test iteration was done on a freshly formatted filesystem.
>
> Here goes the figures & my evaluations:
>
> 1. reiser3, 3 files under a same dir:
>
> sandbox:/mnt/foo [1016]# dd if=/dev/zero of=f0 bs=16M count=64&;dd
> if=/dev/zero of=f1 bs=16M count=64&;dd if=/dev/zero of=f2 bs=16M 
> count=64&;wait
>
> sandbox:/mnt/foo [1018]# filefrag f0 f1 f2
> f0: 470 extents found
> f1: 461 extents found
> f2: 470 extents found
>
>
> My Evaluation: badly fragmented!
>
>
> 2. reiser3, 3 files under 3 different dirs:
>
> sandbox:/mnt [1028]# dd if=/dev/zero of=dir0/foo bs=16M count=64&;dd
> if=/dev/zero of=dir1/foo bs=16M count=64&;dd if=/dev/zero of=dir2/foo
> bs=16M count=64&;wait
>
> sandbox:/mnt [1029]# filefrag dir0/foo dir1/foo dir2/foo
> dir0/foo: 448 extents found
> dir1/foo: 462 extents found
> dir2/foo: 443 extents found
>
>
> My Evaluation: still bad, spreading the files under different dirs did no
> visible good.
>
>
>
> 3. ext3, 3 files under a same dir:
>
> sandbox:/mnt/foo [1041]# dd if=/dev/zero of=f0 bs=16M count=64&;dd
> if=/dev/zero of=f1 bs=16M count=64&;dd if=/dev/zero of=f2 bs=16M
> count=64&;wait
>
> sandbox:/mnt/foo [1044]# filefrag f0 f1 f2
> f0: 202 extents found, perfection would be 9 extents
> f1: 207 extents found, perfection would be 9 extents
> f2: 208 extents found, perfection would be 9 extents
>
>
> My Evaluation: much better than reiser3, yet far from perfection.
>
>
>
> 4. ext3, 3 files under 3 different dirs:
>
> sandbox:/mnt [1054]# dd if=/dev/zero of=dir0/foo bs=16M count=64&;dd
> if=/dev/zero of=dir1/foo bs=16M count=64&;dd if=/dev/zero of=dir2/foo
> bs=16M count=64&;wait
>
> sandbox:/mnt [1056]# sandbox:/mnt [1056]# filefrag dir0/foo dir1/foo 
> dir2/foo
> dir0/foo: 91 extents found, perfection would be 9 extents
> dir1/foo: 9 extents found
> dir2/foo: 95 extents found, perfection would be 9 extents
>
>
> My Evaluation: spreading the files under different dirs DID help quite
> alot! but can we get even better result by spread the files more 
> sparsely?
> (see next test)
>
>
> 5. still ext3, mkdir 10 dirs first, then dumping the files under the
> 1st, 5th, and 9th dirs:
>
> sandbox:/mnt [1085]# dd if=/dev/zero of=dir0/foo bs=16M count=64&;dd
> if=/dev/zero of=dir4/foo bs=16M count=64&;dd if=/dev/zero of=dir9/foo
> bs=16M count=64&;wait
>
> sandbox:/mnt [1086]# filefrag dir{0,4,9}/foo
> dir0/foo: 11 extents found, perfection would be 9 extents
> dir4/foo: 11 extents found, perfection would be 9 extents
> dir9/foo: 10 extents found, perfection would be 9 extents
>
>
> My Evaluation: almost perfect!
>
>
>
> 6. XFS, 3 files under a same dir:
>
> sandbox:/mnt/foo [1112]# dd if=/dev/zero of=f0 bs=16M count=64&;dd 
> if=/dev/zero
> of=f1 bs=16M count=64&;dd if=/dev/zero of=f2 bs=16M count=64&;wait
>
> sandbox:/mnt/foo [1114]# filefrag f0 f1 f2
> f0: 25 extents found
> f1: 11 extents found
> f2: 20 extents found
>
>
> My Evaluation: this'd be the BEST result I got, when dumping into a 
> same dir.
>
>
>
>
> 7. XFS, dumping into 3 dirs among ten, similar to test 5:
>
> sandbox:/mnt [1127]# dd if=/dev/zero of=dir0/foo bs=16M count=64&;dd 
> if=/dev/zero
> of=dir4/foo bs=16M count=64&;dd if=/dev/zero of=dir9/foo bs=16M 
> count=64&;wait
>
> sandbox:/mnt [1128]# filefrag dir0/foo dir4/foo dir9/foo
> dir0/foo: 1 extent found
> dir4/foo: 1 extent found
> dir9/foo: 1 extent found
>
>
> My Evaluation: impressed! cant be any better now.
>
>
> 8. Reiser4, 1 dir
>
> sandbox:/mnt/foo [1155]# dd if=/dev/zero of=f0 bs=16M count=64&;dd 
> if=/dev/zero
> of=f1 bs=16M count=64&;dd if=/dev/zero of=f2 bs=16M count=64&;wait
>
> sandbox:/mnt/foo [1156]# filefrag f0 f1 f2
> f0: 45 extents found
> f1: 6011 extents found
> f2: 45 extents found
>
>
> My Evaluation: far better than it's brother reiser3. the 6011 extents of
> f1 was weird, i'd have done more iterations to get an average, just blame
> lazy me ;)
>
>
>
> 9. Reiser4, 3 dirs among 10:
>
> sandbox:/mnt [1165]# dd if=/dev/zero of=dir0/foo bs=16M count=64&;dd
> if=/dev/zero of=dir4/foo bs=16M count=64&;dd if=/dev/zero of=dir9/foo
> bs=16M count=64&;wait
>
> sandbox:/mnt [1167]# filefrag dir{0,4,9}/foo
> dir0/foo: 42 extents found
> dir4/foo: 50 extents found
> dir9/foo: 46 extents found
>
>
> My Evaluation: nice figures, really. and unlike its elder brother, using
> more dirs DID help.
>
>
>> Cheers, Andreas
>> -- 
>> Andreas Dilger
>> http://sourceforge.net/projects/ext2resize/
>> http://www-mddsp.enel.ucalgary.ca/People/adilger/
>>
>>
>> _______________________________________________
>> Ext3-users mailing list
>> Ext3-users@redhat.com
>> https://www.redhat.com/mailman/listinfo/ext3-users
>
>


-- 
Hans

