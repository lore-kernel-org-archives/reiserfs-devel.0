From: Islam Amer <pharon@gmail.com>
Subject: Re: Full of surprises - A reiser4 story from userland
Date: Wed, 28 Sep 2005 17:51:14 +0300
Message-ID: <5d8b7b905092807514da5958e@mail.gmail.com>
References: <1127914812.12894.96.camel@laptop>
	 <200509281825.49873.vitaly@namesys.com>
Reply-To: Islam Amer <pharon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509281825.49873.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com, Fionn Behrens <fionn@spamfilter.de>

On 9/28/05, Vitaly Fertman <vitaly@namesys.com> wrote:
> On Wednesday 28 September 2005 17:40, Fionn Behrens wrote:
> >
> > Hello all,
>
> Hello
>
> > I just wanted to tell along a bit about my recent experiences with
> > reiserfs. I have been using reiser3.[56] without any glitch for more
> > than five years and when I got a new notebook last year, I decided to
> > give reiser4 a try. There even was a handy kernel patch package
> > available in debian! How nice. A few bencharks proved my choice was
> > right. Over the last 12 months I was very happy with it - no sign of a
> > problem and pretty fast operation on 2.6.10 and 11.
> >
> > A few days ago I decided to upgrade to 2.6.13 because I need it for
> > development at work. Having heard about the discussions around reiser4
> > kernel integration I supposed it should be quite stable now and that it
> > may even have improved some more. I also expected it to be readily
> > available as a kernel patch for everyone to try.
> >
> > There was my first surprise: It was not! I spent quite some time
> > searching around and finally found that seemingly the only way to get
> > reiser4 for the latest kernel were a dozen and a half reiser4* patches
> > from mm. Their proper sequence of application also is up to the
> > technically interested user.
> > Why you request a software to be integrated into Linux while you dont
> > even provide an official patch download for the very kernel version you
> > want it in, is beyond my comprehension.
> >
> > Well, since I needed 2.6.13 and my root partition already was reiser4 I
> > had to take things like they were. I spent another hour applying those
> > patches and getting around some minor problems doing so. Finally, there
> > was my shiny new 2.6.13 with reiser4.
> >
> > But alas, the next surprise was not far away. Trying to suspend my
> > notebook now resulted in some reiser4 kernel processes going postal:
> >
> >   PID USER      PR   SHR S  %CPU  %MEM    TIME+   COMMAND
> >   984 root      25     0 R  25.3   0.0   0:23.62  ktxnmgrd:dm-0:t
> >  3246 root      25     0 R  24.3   0.0   0:23.54  ktxnmgrd:hda4:t
> >   985 root      25     0 R  23.3   0.0   0:23.61  ent:dm-0.
> >  3247 root      25     0 S  23.3   0.0   0:23.60  ent:hda4.
> >
> > The load went up to 8 and my computer became the most expensive heater
> > on the block. Reboot unavoidable. Maybe reiser4 had not improved that
> > much. A short check on the net just popped a few posts about recent
> > reiser4 being "a turkey" and that someone should put up a warning
> > somewhere (DAMN YES YOU SHOULD) but no solution.
> > I decided to go back to 2.6.11 before any more bad things happen.
> >
> > Third surprise: they had already happened. 2.6.11 refused to boot the
> > root partition, claiming that there were an inconsistency in the FS.
>
> the disk format got new parameters and old kernels cannot understand it r=
ight.
>
> > Sep 28 08:44:20 rtfm kernel: WARNING: wrong pset member (11) for 42
> > Sep 28 08:44:20 rtfm kernel: reiser4[mount(840)]: init_inode_static_sd
> > (fs/reiser4/plugin/item/static_stat.c:283)[nikita-631]:
> > Sep 28 08:44:20 rtfm kernel: WARNING: unused space in inode 42
> >
> > I know the disk is ok and I had not had a crash of any sort (the freake=
d
> > out kernel from above seemed to shut down properly at least). So I
> > probed this a bit further:
> >
> > trying 2.6.13 reiser4:   booting without a warning.
> > trying 2.6.11 again:     error, error, no go
> > trying 2.6.13 once more: booting nicely
> > trying 2.6.11 finally:   error again.
> >
> > Okay, I'd call this another surprise. I just did not know whether there
> > actually was a problem or not! So I decided to give fsck a shot (on
>
> which fsck version?
>
> > 2.6.11 - I had somewhat lost my belief in recent reiser4 code).
> > I just ran in with --check, because the man page said that this would b=
e
> > read-only.
>
> it says:
> "
> --check
> the default action checks the consistency and reports, but does not
> repair any corruption that it finds. This option may be used on a
> read-only file system mount.
> "
>
> it does not mean 100% read-only check.
>
> > It found this:
> >
> > FSCK: Node (2196341), item (0), [29:1(SD):0:2a:0]: does not look like a
> > valid SD
> > plugin set extention: wrong pset member count detected (12).
> > FSCK: Node (2196341), item (0), [29:1(SD):0:2a:0]: does not look like a
> > valid stat data.
> > FSCK: Node (2196341), item (0), [29:1(SD):0:2a:0]: broken item found.
> > FSCK: Node (2196341): the node is broken. Pointed from the node
> > (2196340), item (0), unit (0). The whole subtree is skipped.
> >
> > Of course, as a user, I don't have the slightest idea what this means.
> > "The whole subtree is skipped" sounded worryingly lossy, however.
> > At the end of the run, fsck told me I had to rerun it with --build-fs.
> > Now that sounded pretty heavy. I still have some real work to do and I
> > already had lost several working hours to this and was not very willing
> > to do so right now.
> > So I decided to take advantage of the now proven fact that
> > REISER4-2.6.13 DOES NOT RECOGNIZE ITS SELF-MADE DAMAGE and give it
> > another go for today (I made a backup the other day anyway), save my
> > work on NFS and let the --build-fs thing run tonight after work.
> >
> > There was my fourth surprise: This fsck thing had LIED to me; it was no=
t
> > read-only.
>
> why do you think --build-fs is read-only?
>
> > It may have checked the fs read-only but it must have
> > treacherously flipped some "error" bit somewhere on disk because now
> > even 2.6.13 reiser4 refused to boot the partition properly:
> >
> > Warning, mounting filesystem with fatal errors, forcing read-only mount
> > (followed by the error from above)
>
> do you see anything relevant in the syslog?
>
> > So much for --check being just a check. I grabbed a book and lost about
> > two more precious working hours running the --build-fs thing.
> >
> > At this point I admittedly was >slightly< upset. No, wait. I was pissed=
.
> >
> > After the rebuild had finally finished, I dropped my book and rebooted
> > into 2.6.11. But hey ho, surprises had not ended yet: The root partitio=
n
> > still booted read-only telling me it had fatal errors.
>
> you need to clarify what reiser4progs version you are running.
> 1.0.5 fixes the fs to the letest format, which is needed for 2.6.13.
> 1.0.3 to the 2.6.10's one.
>
> > Obviously that
> > switch flipped by the "read-only" check had not been flipped back durin=
g
> > the "read-write" restoration. So I probably have to remount,rw now afte=
r
> > every reboot.
> > But at least I can suspend again without my system going nuts.
> >
> > The bottom line: obviously after twelve months without problems, some
> > higher entity has decided I am up for a busy day. Apart from the funny
> > "fatal error" thing my adventure ended where it had begun: I still need
> > 2.6.13 and a working reiser4.
> > The version in mm obviously is seriously flawed and - from what I found
> > - may even cause file system corruption.
> >
> > Probably the biggest surprise of all for me was that the people of
> > namesys put up such a pile of bugs right at the very moment they want
> > their stuff in the kernel tree. Anyone who is going the lengths to try
> > their code (maybe to evaluate whether it is actually worth incorporatio=
n
> > in the kernel) will be up for a not-so-nice surprise. And I did not see
> > a warning anywhere on namesys.com as well!
> >
> > Now, would someone please tell me where I can find a reiser4 patch that
> > works as stable and surprise-free as your code back then in the old age=
s
> > of 2004 and that can be applied to 2.6.13?
> > Please? Or would I have been better off using XFS from the beginning?
> >
> > Congratulations to all who read the whole story.
> >
> > Thanks to everyone who will answer any of my questions.
> >
> > best regards,
> >               Fionn
> >
> > P.S.: How do I switch back that annoying "corruption bit"?
> >       Run another "read-only" check?
>
> --
> Vitaly
>

I don't like to turn LKML into another battleground, but from one user
to another I have to answer this.

*You know reiser4 is development code , this is why it isn't included
in vanilla ( yet ) in the first place.

*reiser4 is included in mm and the separate patches from the
broken-out package should be applied in the order listed in the
included series file ( usually using quilt ).

*I too faced problems when I upgraded to 2.6.13-mm because of the
change in the filesystem format. However everything returned to normal
when I upgraded my progsreiserfs and repatched grub with the latest
patch.

*reiser4 is sometimes victimized due to bugs in the -mm releases. For
example I am having problems with a 100% cpu usage of a process called
" ent:hda7! " cured only by a reboot. The problem has eased a little
when I replaced the " per-task-predictive-write-throttling". However I
think the problem still exists.

*reiser4 is in a state of flux due to the code changes being made in
preparation for the review leading to ( hopefully ) its inclusion in
the kernel.

I hope I cleared some of the problems you complained of , and I hope I
didn't step on someones toes or make someone upset. If I did , I
apologize in advance. Thank you.
