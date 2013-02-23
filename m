From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Further work on reiser4: discard support and performance issues
Date: Sat, 23 Feb 2013 16:21:46 +0400
Message-ID: <1435419.Em4W395xSI@intelfx-laptop>
References: <1856576.kOCPiaH0RB@intelfx-laptop> <CAErSLm0PFf03S8_6tjT0GgFXw=EpWCf+6RBoxxFYoecQPYWoLA@mail.gmail.com> <51184DD5.7020409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:user-agent
         :in-reply-to:references:mime-version:content-transfer-encoding
         :content-type;
        bh=brY9H7q1CjK2KcbpJCdz/5G4NFXn/M7CXsl8xY02QMI=;
        b=YtW1TRqX1cAzEDGX20XxEeEb1YatUWwEmiVRTq42BlOffuqVab/KjeiDhk4ExIBpjF
         KmndYJVPJpM1KDZLMZIrJqzp1Ljsz7X0Eaoc7VzWQ9CQUR8Sv5wQ5i+KZ+OegdVOXf5o
         iapvUMDkGQvQD+3uxj4sfLW+8kObVqEhu+NfR3TMtrl2RHpTy4azC+gknL4G/ZzvoXuU
         ilsSqRUq9I8C9fuI1P4E0WqfCOqs6aHkmbxr4Y0Rzf6XSZHOA9bXdef9xhHCRIpEP5jO
         hxn5ZVvFNsr8iWDYM7RR8BgJjCnBWL7j14iqh9+DoeuP/WRZxQZERqFLMwGAec8ZAgkL
         e43w==
In-Reply-To: <51184DD5.7020409@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 11 February 2013 02:48:05 Edward Shishkin wrote:
> On 02/10/2013 07:20 AM, =D0=98=D0=B2=D0=B0=D0=BD =D0=A8=D0=B0=D0=BF=D0=
=BE=D0=B2=D0=B0=D0=BB=D0=BE=D0=B2 wrote:
> > Hi Edward,
>=20
> Hello Ivan.
>=20
> > Sorry for the long silence...
>=20
> NP, I just wanted to make sure that things move in right
> direction (if any).
>=20
>=20
>   I've been extremely busy with real-life
>=20
> > things here - so just had no time even to walk through the code and
> > build up a list of questions (not to mention the actual development=
).
> > I guess I'll finally return in a week or so.
>=20
> The same problem here: almost zero spare time in which I try to
> implement different transaction modes to have a pure journalling
> mode (where reiser4 partitions won't quickly accumulate external
> fragmentation) and pure COW (AKA "Write-Anywhere") mode, which is
> needed to implement snapshots; also COW would be an optimal mode
> for SSD drives.
>=20
> > But here's what I currently think about discard implementation.
> > In filesystems like jfs, it is implemented pretty straightforward.
> > "Online" discard on block freeing is done through hooking into
> > function dbFree(), which marks the blocks as free in the _working_
> > allocation map. Batch discard via FITRIM ioctl is done through lock=
ing
> > the whole allocation group, allocating everything in it, trimming
> > these blocks and freeing them again.
> >=20
> > For reiser4, I think it will translate into something like this:
> > With "online" discard, it would be better to discard the blocks at
> > transaction commit time (the time when working bitmap is copied to =
the
> > persistent one... am I right?)
>=20
> I am sorry, but I still don't know the TRIM/discard background well
> enough to make any decisions. I understand that a file system should
> issue some commands to "help" the hardware? What those commands will
> result in?

---- tl;dr area begin

The TRIM is a command in the ATA protocol, operating on a sector range.
It tells the hardware (storage) that the given sector range is not used=
=20
anymore and hence data contained in it can be discarded/removed.
(Similar commands exist in several other protocols, like SCSI UNMAP and
SD ERASE, and the "discard" is an in-kernel abstraction to all such com=
mands.)

The reason why do we need such a command for SSDs is that in flash memo=
ry
an "overwrite data" operation is actually an "erase + write data" and i=
s much=20
more costly than just a "write data onto free space". Flash memory
is organized into pages (usually 4K), which are further grouped into bl=
ocks=20
(512K); and while a write is done per-page, an erase is done per-block
(so a controller shall read the whole block into cache and then rewrite=
 all=20
pages in it, except the one being updated).

Modern controllers do internal block remapping to achieve some "wear le=
veling"=20
(i. e. spreading use across all blocks instead of continuously rewritin=
g one=20
block which is updated by the user), but they obviously need a pool of =
free=20
blocks, and anyway - writes to the locations that the software would=20
consider empty still may trigger a read-erase-write cycle.

So, the TRIM command notifies the controller that the block can be eras=
ed and=20
returned to the free pool. There is a restriction on sector ranges give=
n to=20
the command: they should actually represent whole blocks
(otherwise they are ignored, AFAIK).

So, from the software's point of view, an SSD-aware operation looks lik=
e
1) putting whatever is likely to be updated simultaneously into the sam=
e block=20
(TRIM unit);
2) delaying writeback in hope that more adjacent data will be written a=
t once;
3) notify the storage when the blocks are logically freed by issuing a =
TRIM=20
command.

(1) and (2) are largely my guesses (and anyway out of scope), while
(3) is a common practice and is implemented at storage driver, kernel a=
nd=20
filesystem layers.

---- tl;dr area end

So, inside the filesystem we need to notify the kernel about  we need t=
o=20
implement TRIM (more precisely, discard - as we're working with
in-kernel abstractions) support in the filesystem

About the implementation:
There is an API call, blkdev_issue_discard() [1], which does all the=20
work and is supposed to be called from the filesystem. The discard prop=
erties=20
are stored in struct queue_limits.

And for the filesystem itself, there are generally two modes to support=
 discard=20
operations [2].
1) "Realtime" or online discard - the filesystem discards blocks as the=
y are=20
deallocated (files being deleted, tree nodes being cut, etc.).
2) "Batch" discard - the filesystem discards all free blocks upon a use=
r's=20
request (when mounted).
In this "batch" case, the signaling is done through a FITRIM ioctl on a=
ny file.

"Batch" mode:
Implementing it should be simple enough (if I'm making correct assumpti=
ons=20
about how does reiser4 work): we can just lock the bitmap and walk thro=
ugh it,=20
issuing a discard for each long enough free sequence.

"Realtime" mode:
It will be more complex given that we have to do the actual work on=20
transaction commit.
You are right about the slowness of bitmap comparison (yes, 32K bitops.=
=2E. I=20
haven't thought about it); we'll need to store locations to discard in =
some=20
per-atom data structure.=20

Let's define a "minimal discard range" to be a block range,
1) whose begin is properly aligned,
2) whose size is equal to discard granularity.
This can be checked using data from struct queue_limits (exact algorith=
m can=20
be derived from code of blkdev_issue_discard()).

Actually, simply storing each deallocated interval in the atom and then=
=20
iterating through the list upon commit will be suboptimal.
Reasons:
- if a single deallocated range is smaller than the discard granularity=
, then=20
this particular range won't be discarded even if it is surrounded by en=
ough=20
free blocks to make a minimal discard range;
- we won't be able to merge small adjacent ranges to form a range that'=
s long=20
enough.

Solution:
- record all deallocated ranges verbatim (in a list);
- on commit time, for each recorded range find minimal discard range(s)=
 which=20
encompass the given range and check if all their blocks can be discarde=
d
(i. e. are free);
- add each suitable minimal discard range to a locally-allocated tree (=
while=20
merging the added ranges);
- issue discard for all found ranges.

Hope this won't be too slow. BTW, kernel sometimes seems to report wron=
g=20
granularity. In my case, granularity is reported as 512 bytes.


[1]:
http://www.kernel.org/doc/htmldocs/kernel-api/API-blkdev-issue-discard.=
html

[2]:
http://xfs.org/index.php/FITRIM/discard

[3]:
http://www.kernel.org/doc/Documentation/ABI/testing/sysfs-block

>=20
>=20
>   by performing a comparison between the
>=20
> > old (on-disk) and new bitmaps, remembering all changed chunks and
> > issuing discard for them.
>=20
> I afraid that comparison the bitmaps is something expensive: it means
> 4K*8 =3D 32K comparisons per bitmap block.. Maybe it makes sense to
> accumulate the "difference" in special per-atom data structures
> (say, rb-trees)?
>=20
>=20
>   Also, the discard granularity can be higher
>=20
> > than the bitmap granularity. E. g. if we have a bitmap pattern like
> > "0010" and it changes to "0000", it would be better to issue a disc=
ard
> > for 4 blocks instead of just one.
> >=20
> > And with FITRIM, we could just lock the bitmap and walk through it,
> > discarding all free chunks. Of course, it can only be done if locki=
ng
> > policy allows us to "just lock the bitmap"...
> >=20
> > BTW, I'm afraid I don't understand what "a proposal" means. Is it a
> > kind of some official document - and if yes, who needs it?
>=20
> Nothing official, this is a usual practice in groups that work
> remotely: someone send a kind of roadmap. In the simplest case it
> can be a set of links where one can read about TRIM/discard.
> Maybe "proposal" sounds too official? :)
>=20
> > For the other things: the freezing issue seems to be related to
> > fsync() indeed; the freeze rate decreased substantially when I stop=
ped
> > using InnoDB as the MySQL backend. Some of them remained, seemingly
> > related to Dropbox (=3D=3D concurrent reads and writes to the same =
file).
>=20
> This is a known problem, I'll try to find Reiser's suggestions how to
> resolve this..

Due to transactional fs's nature?

>=20
> > And yes, I'll try to do the bisection as soon as enough free time
> > appears... Will a virtual machine be enough, or it is crucial that =
the
> > tests shall be performed on a real machine?
>=20
> It can be remote, but it should be a real machine. BTW, where are you
> territorially?

I'm in Moscow (RU). Actually, I can do that on my primary PC - if those=
 old=20
kernels are able to boot a SandyBridge chipset.

BTW, mirror at mirror.sit.wisc.edu is offline... I'll use mirror.linux.=
org.au -=20
and hope that patches will apply to any of the intermediate states.
What is the first known bad version?

Ivan.

>=20
> Edward.
>=20
> > Thanks,
> > Ivan.
> >=20
> > 2013/2/10 Edward Shishkin<edward.shishkin@gmail.com>:
> >> Hi Ivan,
> >>=20
> >> How our TRIM/dsicard is doing?
> >> Any questions, or everything is clear? :)
> >>=20
> >> Edward.
> >>=20
> >> On 01/17/2013 05:39 PM, Edward Shishkin wrote:
> >>> On 01/07/2013 02:42 AM, Ivan Shapovalov wrote:
> >>>> Hi again Edward,
> >>>=20
> >>> Hello.
> >>>=20
> >>>> Here's what I want to try to do with reiser4 in meantime. I'd
> >>>> appreciate some
> >>>> hints on that all...
> >>>>=20
> >>>> So, first thing I'd like to implement is TRIM/discard support, b=
oth
> >>>> online
> >>>> (via -o discard) and in a separate FITRIM ioctl().
> >>>> That's just because I've got an SSD two days ago and thus now ha=
ve to
> >>>> use in
> >>>> rootfs some discard-aware fs like ext4.
> >>>=20
> >>> I think it would be nice for beginning. Moreover, reiser4 still d=
oesn't
> >>> have any setup optimal for SSD.
> >>>=20
> >>> Unfortunately I don't have a ready proposal for TRIM/discard supp=
ort in
> >>> reiser4.
> >>>=20
> >>> I have ready proposals for the following features (they can be ra=
ther
> >>> complicated for the beginners though):
> >>>=20
> >>> 1) Repacker (On-line defragmentation);
> >>> 2) Support of different transaction models:
> >>> a. pure journalling;
> >>> b. pure COW (Copy-On-Write);
> >>> c. smart (the current "mixed" one);
> >>> d. no transaction support (for people with UPSs);
> >>> 3) Subvolumes (AKA "chunkfs");
> >>> 4) Snapshots.
> >>>=20
> >>>> And then I want to do something with performance: sometimes duri=
ng
> >>>> heavy I/O
> >>>> to a slow /home storage (especially when it's multithreaded) man=
y
> >>>> processes,
> >>>> including the DE, just get stuck in "D" state and sit there for =
a
> >>>> minute or
> >>>> two with load average of apx. 5.5 (on a hyperthreaded 2-core CPU=
).
> >>>=20
> >>> and some process waits for fsync() completion?
> >>>=20
> >>>> For the first, I can look into other filesystems' implementation=
s, but
> >>>> I'll
> >>>> probably be unsure at which layer to put the actual discard call=
 (in
> >>>> order not
> >>>> to break reiser4's transactional nature).
> >>>=20
> >>> If you decide to proceed with TRIM/discard support, you will need=
 to
> >>> prepare the proposal by yourself. Let's start with some backgroun=
d,
> >>> that is:
> >>> . clarify underlying reasons (specific for SSD geometry?) of
> >>> TRIM/discard support: why do we need such support on the file
> >>> system layer;
> >>> . review of existing hardware and software means for such support=
;
> >>> . etc..
> >>>=20
> >>> And yes, it would be nice to review existing TRIM/discard support
> >>> implementations in other file systems (say, ext4).
> >>>=20
> >>> Once we figure out, what bits of reiser4 you should understand
> >>> perfectly to implement TRIM/discard support, I'll provide you wit=
h
> >>> respective hints.
> >>>=20
> >>>> And for the second, I just don't know why does that happen. Can =
it be
> >>>> due to
> >>>> some r4-specific things/issues or that's just a horribly slow ra=
ndom
> >>>> access
> >>>> speed of my hw?
> >>>=20
> >>> Which hw? SSD?
> >>>=20
> >>> I also remember complaints that umount (i.e. the final sync takes=
 2-3,
> >>> or even more minutes). It looks like in some cases reiser4 accumu=
lates
> >>> too much dirty stuff..
> >>>=20
> >>> It would be nice to periodically dump some info about atoms (curr=
ent
> >>> number of all atoms, size of each atom, etc) to see the full pict=
ure of
> >>> their evolution during such freezing. I think, it makes sense to =
port
> >>> the old reiser4 profiling stuff, and populate it with more info (=
if
> >>> needed).
> >>>=20
> >>> Also there is an oldest issue:
> >>> The following (old) benchmarks created with mongo(*) test suit sh=
ow x2
> >>> advantage of reiser4 against reiserfs(v3) on CREATE phase (let's
> >>> consider only this phase for simplicity):
> >>>=20
> >>>=20
> >>> http://web.archive.org/web/20061113154648/http://www.namesys.com/=
benchma
> >>> rks.html
> >>>=20
> >>>=20
> >>> I've made similar benchmarks with latest 2.6 kernels (sorry, lost=
 the
> >>> results) and found that the advantage has disappeared (real time =
in
> >>> CREATE phase is the same as of reiserfs, or even worse). It shoul=
dn't
> >>> be so: it indicates that something wrong is going on.. I remember
> >>> people complained on the performance drop in reiser4 long time ag=
o, but
> >>> didn't have a chance to investigate this.
> >>>=20
> >>> The straightforward way to narrow down the problem changeset is t=
o
> >>> bisect starting from 2.6.8-mm2, the archives can be found here:
> >>> http://mirror.sit.wisc.edu/pub/linux/kernel/people/akpm/patches/2=
=2E6/
> >>> http://ftp.icm.edu.pl/packages/linux-reiserfs/reiser4-for-2.6/
> >>>=20
> >>> http://mirror.sit.wisc.edu/pub/linux/kernel/people/edward/reiser4=
/reiser
> >>> 4-for-2.6/
> >>>=20
> >>> However, it can be rather painful and requires a separate machine=
=2E
> >>>=20
> >>> Thanks,
> >>> Edward.
> >>>=20
> >>> (*)
> >>>=20
> >>> http://sourceforge.net/projects/reiser4/files/reiser4-utils/bench=
-stress
> >>> -tools/
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
