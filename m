From: "Joel Heenan" <joel.heenan@gmail.com>
Subject: Re: fsck.reiserfs --rebuild-tree out of disk space aborted
Date: Tue, 25 Jul 2006 21:41:59 +1000
Message-ID: <843700460607250441m44ea8786r75d0cd0858fac0b2@mail.gmail.com>
References: <843700460607201709i44c2d1f4i846a0cb716c80234@mail.gmail.com>
	 <1153492956.6271.37.camel@tribesman.namesys.com>
	 <843700460607211537o70d9b179o1c7448e47ef5d829@mail.gmail.com>
	 <1153825325.6292.59.camel@tribesman.namesys.com>
Reply-To: joelh@planetjoel.com
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_33963_11819844.1153827719380"
Return-path: <reiserfs-list-return-29192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153825325.6292.59.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

------=_Part_33963_11819844.1153827719380
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 7/25/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Hello
>
> On Sat, 2006-07-22 at 08:37 +1000, Joel Heenan wrote:
> > On 7/22/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
> > > hello
> > >
> > > On Fri, 2006-07-21 at 10:09 +1000, Joel Heenan wrote:
> > > > Hi,
> > > >
> > > > I can home about two weeks ago and found my media box locked up. I was
> > > > able to discover that it had filled up its /dev/md2 partition (mounted
> > > > on /home) which surprised me because it is 550 gigs. Perhaps mythtv
> > > > went nuts and used it all up. It was only a temporary thing I was
> > > > going to move mythtv to another partition anyway and boy I wish I had
> > > > now :-P.
> > > >
> > > > Anyway I rebooted and the fsck said I had to run rebuild-tree. So I
> > > > ran that and a few days later it said "out of disk space, aborted". I
> > > > can't mount the partition it says "No folder found I believe". I tried
> > > > it a few times with both the reiserfsprogs from etch:
> > > >
> > > > ii  reiserfsprogs                    3.6.19-2
> > > > User-level tools for ReiserFS filesystems
> > > >
> > > > and the latest ones downloaded from the website (3.6.19). I am
> > > > currently trying it with the -S option.
> > > >
> > > there is no need to use -S in your case.
> > >
> > > > I'm running a custom 2.6.12 kernel which is basically the same as the
> > > > default debian one except it includes some drivers for my dvico fusion
> > > > tv tuner.
> > > >
> > > > I read that the best way to fix this problem is to dd to a bigger
> > > > partition but there is really no easy way for me to do that - it will
> > > > probably involve me purchasing 2x300gig partitions, raiding them, then
> > > > performing the restore.
> > > >
> > > > Please let me know if there is a way I can fix this without going to a
> > > > bigger partition.
> > > >
>
> You can configure linear raid of the /dev/md2 and some additional
> device, which does not have to be very big. 100 mb should be enough and
> should not be hard to allocate for spare.
>
> Than you can have something like:
> raiddev /dev/md3
>         raid-level      linear
>         nr-raid-disks   2
>         chunk-size      32
>         persistent-superblock 0
>         device          /dev/md2
>         raid-disk       0
>         device          /dev/spare
>         raid-disk       1
>
>
> IMPORTANT NOTE: persistent-superblock has to be set to 0.
>
> Than you should run
> reiserfsck --rebuild-sb /dev/md3
> and answer n to "Did you use resizer(y/n)[n]:"
> and answer y to "Is this ok ? (y/n)[n]:"
>
> Than run reiserfsck --rebuild-tree. There should be no problem with lack
> of disk space.

Hey Vladimir,

Thanks... I followed your instructions exactly. I thought about doing
something similar but wasn't sure about how to go about it.

After I answered y to is this ok? it said "The fs may still be
unconsistent. Run reiserfsck --check.". I did that and it said it was
still messed up (as I expected). Its currently doing a rebuild-tree.

Greatly appreciate your help. Lets see how it goes :-)

Joel
>
> > > > Here is output of the fsck:
> > > >
> > > > """
> > > > fsck.reiserfs --rebuild-tree /dev/md2
> > > > reiserfsck 3.6.19 (2003 www.namesys.com)
> > > >
> > > > *************************************************************
> > > > ** Do not  run  the  program  with  --rebuild-tree  unless **
> > > > ** something is broken and MAKE A BACKUP  before using it. **
> > > > ** If you have bad sectors on a drive  it is usually a bad **
> > > > ** idea to continue using it. Then you probably should get **
> > > > ** a working hard drive, copy the file system from the bad **
> > > > ** drive  to the good one -- dd_rescue is  a good tool for **
> > > > ** that -- and only then run this program.                 **
> > > > ** If you are using the latest reiserfsprogs and  it fails **
> > > > ** please  email bug reports to reiserfs-list@namesys.com, **
> > > > ** providing  as  much  information  as  possible --  your **
> > > > ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> > > > ** messages  (including version),  the reiserfsck logfile, **
> > > > ** check  the  syslog file  for  any  related information. **
> > > > ** If you would like advice on using this program, support **
> > > > ** is available  for $25 at  www.namesys.com/support.html. **
> > > > *************************************************************
> > > >
> > > > Will rebuild the filesystem (/dev/md2) tree
> > > > Will put log info to 'stdout'
> > > >
> > > > Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
> > > > Replaying journal..
> > > > Reiserfs journal '/dev/md2' in blocks [18..8211]: 0 transactions replayed
> > > > ###########
> > > > reiserfsck --rebuild-tree started at Mon Jul 17 21:41:44 2006
> > > > ###########
> > > >
> > > > Pass 0:
> > > > ####### Pass 0 #######
> > > > Loading on-disk bitmap .. ok, 116676032 blocks marked used
> > > > Skipping 11771 blocks (super block, journal, bitmaps) 116664261 blocks
> > > > will be read
> > > > 0%....20%....block 85875092: The number of items (256) is incorrect,
> > > > should be (1) - corrected
> > > > block 85875092: The free space (1) is incorrect, should be (208) - corrected
> > > > pass0: vpf-10110: block 85875092, item (0): Unknown item type found
> > > > [33488896 65537 0x100 ??? (15)] - deleted
> > > >                                                    left 0, 15065 /seccseccccc
> > > > 108413 directory entries were hashed with "r5" hash.
> > > >         "r5" hash is selected
> > > > Flushing..finished
> > > >         Read blocks (but not data blocks) 116664261
> > > >                 Leaves among those 87768646
> > > >                         - leaves all contents of which could not be
> > > > saved and deleted 1
> > > >                 Objectids found 108417
> > > >
> > > > Pass 1 (will try to insert 87768645 leaves):
> > > > ####### Pass 1 #######
> > > > Looking for allocable blocks .. finished
> > > > 0%....20%....40%..Not enough allocable blocks, checking bitmap...there
> > > > are 1 allocable blocks, btw
> > > >
> > >
> > > I am working on a fix for this problem. But the above output looks
> > > suspicious.
> > >
> > > What kind of files are there, would you describe?
> >
> > It is the /home folder on my media box. So it has around 10gigs of
> > personal files (normal everyday file usage), and the rest is media.
> > There is 40 gigs of mp3s. 100 gigs of avi files of different sizes but
> > mostly large at least 100 megs or more.
> >
> > It also has 200 gigs of mythtv NUV files.
> >
> > My suspicion is that mythtv went nuts and began recording something
> > and never closed the file and used up all the space. But really I
> > don't know because it has been unusable since I found the problem.
> >
> > > Are they long? Did you mount reiserfs with any options?
> >
> > Some of the files are long, there would be some files that are 4 gigs
> > in size. Sometimes mythtv makes very large files.
> >
> > I mounted reiserfs with "defaults"
> >
> > > Can you give me ssh access to the filesystem so that I could take a look
> > > at it myself?
> >
> > The filesystem contains some sensitive data so I can't really do this
> > I'm afraid. I'm happy to run any diagnostic tools you have or provide
> > any more information.
> >
> > Joel
> >
>
>

------=_Part_33963_11819844.1153827719380
Content-Type: text/plain; name=reiserfsck.txt; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_eq2764hy
Content-Disposition: attachment; filename="reiserfsck.txt"

bWVkaWE6LyMgbWRhZG0gLUQgL2Rldi9tZDMNCi9kZXYvbWQzOg0KICAgICAgICBWZXJzaW9uIDog
MDAuOTAuMDENCiAgQ3JlYXRpb24gVGltZSA6IFR1ZSBKdWwgMjUgMjE6Mzc6MzYgMjAwNg0KICAg
ICBSYWlkIExldmVsIDogbGluZWFyDQogICAgIEFycmF5IFNpemUgOiA0Njc2MzU4NzIgKDQ0NS45
NyBHaUIgNDc4Ljg2IEdCKQ0KICAgUmFpZCBEZXZpY2VzIDogMg0KICBUb3RhbCBEZXZpY2VzIDog
Mg0KUHJlZmVycmVkIE1pbm9yIDogMw0KICAgIFBlcnNpc3RlbmNlIDogU3VwZXJibG9jayBpcyBu
b3QgcGVyc2lzdGVudA0KDQogICAgVXBkYXRlIFRpbWUgOiBUdWUgSnVsIDI1IDIxOjM3OjM2IDIw
MDYNCiAgICAgICAgICBTdGF0ZSA6IGNsZWFuDQogQWN0aXZlIERldmljZXMgOiAyDQpXb3JraW5n
IERldmljZXMgOiAyDQogRmFpbGVkIERldmljZXMgOiAwDQogIFNwYXJlIERldmljZXMgOiAwDQoN
CiAgICAgICBSb3VuZGluZyA6IDMySw0KDQogICAgTnVtYmVyICAgTWFqb3IgICBNaW5vciAgIFJh
aWREZXZpY2UgU3RhdGUNCiAgICAgICAwICAgICAgIDkgICAgICAgIDIgICAgICAgIDAgICAgICBh
Y3RpdmUgc3luYyAgIC9kZXYvbWQyDQogICAgICAgMSAgICAgICA4ICAgICAgIDIwICAgICAgICAx
ICAgICAgYWN0aXZlIHN5bmMgICAvZGV2L3NkYjQNCm1lZGlhOi8jIGRmDQpGaWxlc3lzdGVtICAg
ICAgICAgICAxSy1ibG9ja3MgICAgICBVc2VkIEF2YWlsYWJsZSBVc2UlIE1vdW50ZWQgb24NCi9k
ZXYvbWQxICAgICAgICAgICAgICAxOTUzNDI0NCAgIDI3NTI3MTYgIDE2NzgxNTI4ICAxNSUgLw0K
dG1wZnMgICAgICAgICAgICAgICAgICAgMjU4MTY0ICAgICAgICAgMCAgICAyNTgxNjQgICAwJSAv
ZGV2L3NobQ0KL2Rldi9tZDAgICAgICAgICAgICAgICAgIDk2MjQ4ICAgICA1MjEyMCAgICAgNDQx
MjggIDU1JSAvYm9vdA0KbWVkaWE6LyMgZGYgLWgNCkZpbGVzeXN0ZW0gICAgICAgICAgICBTaXpl
ICBVc2VkIEF2YWlsIFVzZSUgTW91bnRlZCBvbg0KL2Rldi9tZDEgICAgICAgICAgICAgICAxOUcg
IDIuN0cgICAxN0cgIDE1JSAvDQp0bXBmcyAgICAgICAgICAgICAgICAgMjUzTSAgICAgMCAgMjUz
TSAgIDAlIC9kZXYvc2htDQovZGV2L21kMCAgICAgICAgICAgICAgIDk0TSAgIDUxTSAgIDQ0TSAg
NTUlIC9ib290DQptZWRpYTovIyBkZiAvZGV2L21kMg0KRmlsZXN5c3RlbSAgICAgICAgICAgMUst
YmxvY2tzICAgICAgVXNlZCBBdmFpbGFibGUgVXNlJSBNb3VudGVkIG9uDQovZGV2L21kMSAgICAg
ICAgICAgICAgMTk1MzQyNDQgICAyNzUyNzE2ICAxNjc4MTUyOCAgMTUlIC8NCm1lZGlhOi8jIGRm
IC9kZXYvbWQzDQpGaWxlc3lzdGVtICAgICAgICAgICAxSy1ibG9ja3MgICAgICBVc2VkIEF2YWls
YWJsZSBVc2UlIE1vdW50ZWQgb24NCi9kZXYvbWQxICAgICAgICAgICAgICAxOTUzNDI0NCAgIDI3
NTI3MTYgIDE2NzgxNTI4ICAxNSUgLw0KbWVkaWE6LyMgZGYNCkZpbGVzeXN0ZW0gICAgICAgICAg
IDFLLWJsb2NrcyAgICAgIFVzZWQgQXZhaWxhYmxlIFVzZSUgTW91bnRlZCBvbg0KL2Rldi9tZDEg
ICAgICAgICAgICAgIDE5NTM0MjQ0ICAgMjc1MjcxNiAgMTY3ODE1MjggIDE1JSAvDQp0bXBmcyAg
ICAgICAgICAgICAgICAgICAyNTgxNjQgICAgICAgICAwICAgIDI1ODE2NCAgIDAlIC9kZXYvc2ht
DQovZGV2L21kMCAgICAgICAgICAgICAgICAgOTYyNDggICAgIDUyMTIwICAgICA0NDEyOCAgNTUl
IC9ib290DQptZWRpYTovIyByZWlzZXJmc2NrIC0tcmVidWlsZC1zYiAvZGV2L21kMw0KcmVpc2Vy
ZnNjayAzLjYuMTkgKDIwMDMgd3d3Lm5hbWVzeXMuY29tKQ0KDQoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQoqKiBJZiB5b3UgYXJl
IHVzaW5nIHRoZSBsYXRlc3QgcmVpc2VyZnNwcm9ncyBhbmQgIGl0IGZhaWxzICoqDQoqKiBwbGVh
c2UgIGVtYWlsIGJ1ZyByZXBvcnRzIHRvIHJlaXNlcmZzLWxpc3RAbmFtZXN5cy5jb20sICoqDQoq
KiBwcm92aWRpbmcgIGFzICBtdWNoICBpbmZvcm1hdGlvbiAgYXMgIHBvc3NpYmxlIC0tICB5b3Vy
ICoqDQoqKiBoYXJkd2FyZSwgIGtlcm5lbCwgIHBhdGNoZXMsICBzZXR0aW5ncywgIGFsbCByZWlz
ZXJmc2NrICoqDQoqKiBtZXNzYWdlcyAgKGluY2x1ZGluZyB2ZXJzaW9uKSwgIHRoZSByZWlzZXJm
c2NrIGxvZ2ZpbGUsICoqDQoqKiBjaGVjayAgdGhlICBzeXNsb2cgZmlsZSAgZm9yICBhbnkgIHJl
bGF0ZWQgaW5mb3JtYXRpb24uICoqDQoqKiBJZiB5b3Ugd291bGQgbGlrZSBhZHZpY2Ugb24gdXNp
bmcgdGhpcyBwcm9ncmFtLCBzdXBwb3J0ICoqDQoqKiBpcyBhdmFpbGFibGUgIGZvciAkMjUgYXQg
IHd3dy5uYW1lc3lzLmNvbS9zdXBwb3J0Lmh0bWwuICoqDQoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQoNCldpbGwgY2hlY2sgc3Vw
ZXJibG9jayBhbmQgcmVidWlsZCBpdCBpZiBuZWVkZWQNCldpbGwgcHV0IGxvZyBpbmZvIHRvICdz
dGRvdXQnDQoNCkRvIHlvdSB3YW50IHRvIHJ1biB0aGlzIHByb2dyYW0/W04vWWVzXSAobm90ZSBu
ZWVkIHRvIHR5cGUgWWVzIGlmIHlvdSBkbyk6WWVzDQoNCkRpZCB5b3UgdXNlIHJlc2l6ZXIoeS9u
KVtuXTogbg0KcmVidWlsZC1zYjogd3JvbmcgYmxvY2sgY291bnQgb2NjdXJlZCAoMTE2Njc2MDMy
KSwgZml4ZWQgKDExNjkwODk2MCkNCnJlYnVpbGQtc2I6IHdyb25nIGJpdG1hcCBudW1iZXIgb2Nj
dXJlZCAoMzU2MSksIGZpeGVkICgzNTY4KQ0KcmVidWlsZC1zYjogd3JvbmcgdHJlZSBoZWlnaHQg
b2NjdXJlZCAoNjU1MzUpLCB6ZXJvZWQNClJlaXNlcmZzIHN1cGVyIGJsb2NrIGluIGJsb2NrIDE2
IG9uIDB4OTAzIG9mIGZvcm1hdCAzLjYgd2l0aCBzdGFuZGFyZCBqb3VybmFsDQpDb3VudCBvZiBi
bG9ja3Mgb24gdGhlIGRldmljZTogMTE2OTA4OTYwDQpOdW1iZXIgb2YgYml0bWFwczogMzU2OA0K
QmxvY2tzaXplOiA0MDk2DQpGcmVlIGJsb2NrcyAoY291bnQgb2YgYmxvY2tzIC0gdXNlZCBbam91
cm5hbCwgYml0bWFwcywgZGF0YSwgcmVzZXJ2ZWRdIGJsb2Nrcyk6IDExNjY3NjAzMg0KUm9vdCBi
bG9jazogMA0KRmlsZXN5c3RlbSBpcyBjbGVhbg0KVHJlZSBoZWlnaHQ6IDANCkhhc2ggZnVuY3Rp
b24gdXNlZCB0byBzb3J0IG5hbWVzOiAicjUiDQpPYmplY3RpZCBtYXAgc2l6ZSA5NzIsIG1heCA5
NzINCkpvdXJuYWwgcGFyYW1ldGVyczoNCiAgICAgICAgRGV2aWNlIFsweDBdDQogICAgICAgIE1h
Z2ljIFsweDU3NDg3Y2VjXQ0KICAgICAgICBTaXplIDgxOTMgYmxvY2tzIChpbmNsdWRpbmcgMSBm
b3Igam91cm5hbCBoZWFkZXIpIChmaXJzdCBibG9jayAxOCkNCiAgICAgICAgTWF4IHRyYW5zYWN0
aW9uIGxlbmd0aCAxMDI0IGJsb2Nrcw0KICAgICAgICBNYXggYmF0Y2ggc2l6ZSA5MDAgYmxvY2tz
DQogICAgICAgIE1heCBjb21taXQgYWdlIDMwDQpCbG9ja3MgcmVzZXJ2ZWQgYnkgam91cm5hbDog
MA0KRnMgc3RhdGUgZmllbGQ6IDB4ZmEwMzoNCiAgICAgICAgRkFUQUwgY29ycnVwdGlvbnMgZXhp
c3QuDQogICAgICAgICBzb21lIGNvcnJ1cHRpb25zIGV4aXN0Lg0Kc2JfdmVyc2lvbjogMg0KaW5v
ZGUgZ2VuZXJhdGlvbiBudW1iZXI6IDc1Mjk2DQpVVUlEOiA8bm8gbGlidXVpZCBpbnN0YWxsZWQ+
DQpMQUJFTDogL2hvbWUNClNldCBmbGFncyBpbiBTQjoNCiAgICAgICAgQVRUUklCVVRFUyBDTEVB
Tg0KSXMgdGhpcyBvayA/ICh5L24pW25dOiB5DQpUaGUgZnMgbWF5IHN0aWxsIGJlIHVuY29uc2lz
dGVudC4gUnVuIHJlaXNlcmZzY2sgLS1jaGVjay4NCg0KbWVkaWE6LyMgbW91bnQgL2Rldi9tZDMg
L2hvbWUvDQptb3VudDogTm90IGEgZGlyZWN0b3J5DQptZWRpYTovIyByZWlzZXJmc2NrIC0tY2hl
Y2sgL2Rldi9tZDMNCnJlaXNlcmZzY2sgMy42LjE5ICgyMDAzIHd3dy5uYW1lc3lzLmNvbSkNCg0K
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKg0KKiogSWYgeW91IGFyZSB1c2luZyB0aGUgbGF0ZXN0IHJlaXNlcmZzcHJvZ3MgYW5kICBp
dCBmYWlscyAqKg0KKiogcGxlYXNlICBlbWFpbCBidWcgcmVwb3J0cyB0byByZWlzZXJmcy1saXN0
QG5hbWVzeXMuY29tLCAqKg0KKiogcHJvdmlkaW5nICBhcyAgbXVjaCAgaW5mb3JtYXRpb24gIGFz
ICBwb3NzaWJsZSAtLSAgeW91ciAqKg0KKiogaGFyZHdhcmUsICBrZXJuZWwsICBwYXRjaGVzLCAg
c2V0dGluZ3MsICBhbGwgcmVpc2VyZnNjayAqKg0KKiogbWVzc2FnZXMgIChpbmNsdWRpbmcgdmVy
c2lvbiksICB0aGUgcmVpc2VyZnNjayBsb2dmaWxlLCAqKg0KKiogY2hlY2sgIHRoZSAgc3lzbG9n
IGZpbGUgIGZvciAgYW55ICByZWxhdGVkIGluZm9ybWF0aW9uLiAqKg0KKiogSWYgeW91IHdvdWxk
IGxpa2UgYWR2aWNlIG9uIHVzaW5nIHRoaXMgcHJvZ3JhbSwgc3VwcG9ydCAqKg0KKiogaXMgYXZh
aWxhYmxlICBmb3IgJDI1IGF0ICB3d3cubmFtZXN5cy5jb20vc3VwcG9ydC5odG1sLiAqKg0KKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kg0KDQpXaWxsIHJlYWQtb25seSBjaGVjayBjb25zaXN0ZW5jeSBvZiB0aGUgZmlsZXN5c3RlbSBv
biAvZGV2L21kMw0KV2lsbCBwdXQgbG9nIGluZm8gdG8gJ3N0ZG91dCcNCg0KRG8geW91IHdhbnQg
dG8gcnVuIHRoaXMgcHJvZ3JhbT9bTi9ZZXNdIChub3RlIG5lZWQgdG8gdHlwZSBZZXMgaWYgeW91
IGRvKTpZZXMNCiMjIyMjIyMjIyMjDQpyZWlzZXJmc2NrIC0tY2hlY2sgc3RhcnRlZCBhdCBUdWUg
SnVsIDI1IDIxOjQxOjUzIDIwMDYNCiMjIyMjIyMjIyMjDQpSZXBsYXlpbmcgam91cm5hbC4uDQpS
ZWlzZXJmcyBqb3VybmFsICcvZGV2L21kMycgaW4gYmxvY2tzIFsxOC4uODIxMV06IDAgdHJhbnNh
Y3Rpb25zIHJlcGxheWVkDQpaZXJvIGJpdCBmb3VuZCBpbiBvbi1kaXNrIGJpdG1hcCBhZnRlciB0
aGUgbGFzdCB2YWxpZCBiaXQuDQpDaGVja2luZyBpbnRlcm5hbCB0cmVlLi4NCg0KQmFkIHJvb3Qg
YmxvY2sgMC4gKC0tcmVidWlsZC10cmVlIGRpZCBub3QgY29tcGxldGUpDQoNCkFib3J0ZWQNCm1l
ZGlhOi8jIHJlaXNlcmZzY2sgLS1yZWJ1aWxkLXRyZWUgL2Rldi9tZDMNCnJlaXNlcmZzY2sgMy42
LjE5ICgyMDAzIHd3dy5uYW1lc3lzLmNvbSkNCg0KKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KKiogRG8gbm90ICBydW4gIHRoZSAg
cHJvZ3JhbSAgd2l0aCAgLS1yZWJ1aWxkLXRyZWUgIHVubGVzcyAqKg0KKiogc29tZXRoaW5nIGlz
IGJyb2tlbiBhbmQgTUFLRSBBIEJBQ0tVUCAgYmVmb3JlIHVzaW5nIGl0LiAqKg0KKiogSWYgeW91
IGhhdmUgYmFkIHNlY3RvcnMgb24gYSBkcml2ZSAgaXQgaXMgdXN1YWxseSBhIGJhZCAqKg0KKiog
aWRlYSB0byBjb250aW51ZSB1c2luZyBpdC4gVGhlbiB5b3UgcHJvYmFibHkgc2hvdWxkIGdldCAq
Kg0KKiogYSB3b3JraW5nIGhhcmQgZHJpdmUsIGNvcHkgdGhlIGZpbGUgc3lzdGVtIGZyb20gdGhl
IGJhZCAqKg0KKiogZHJpdmUgIHRvIHRoZSBnb29kIG9uZSAtLSBkZF9yZXNjdWUgaXMgIGEgZ29v
ZCB0b29sIGZvciAqKg0KKiogdGhhdCAtLSBhbmQgb25seSB0aGVuIHJ1biB0aGlzIHByb2dyYW0u
ICAgICAgICAgICAgICAgICAqKg0KKiogSWYgeW91IGFyZSB1c2luZyB0aGUgbGF0ZXN0IHJlaXNl
cmZzcHJvZ3MgYW5kICBpdCBmYWlscyAqKg0KKiogcGxlYXNlICBlbWFpbCBidWcgcmVwb3J0cyB0
byByZWlzZXJmcy1saXN0QG5hbWVzeXMuY29tLCAqKg0KKiogcHJvdmlkaW5nICBhcyAgbXVjaCAg
aW5mb3JtYXRpb24gIGFzICBwb3NzaWJsZSAtLSAgeW91ciAqKg0KKiogaGFyZHdhcmUsICBrZXJu
ZWwsICBwYXRjaGVzLCAgc2V0dGluZ3MsICBhbGwgcmVpc2VyZnNjayAqKg0KKiogbWVzc2FnZXMg
IChpbmNsdWRpbmcgdmVyc2lvbiksICB0aGUgcmVpc2VyZnNjayBsb2dmaWxlLCAqKg0KKiogY2hl
Y2sgIHRoZSAgc3lzbG9nIGZpbGUgIGZvciAgYW55ICByZWxhdGVkIGluZm9ybWF0aW9uLiAqKg0K
KiogSWYgeW91IHdvdWxkIGxpa2UgYWR2aWNlIG9uIHVzaW5nIHRoaXMgcHJvZ3JhbSwgc3VwcG9y
dCAqKg0KKiogaXMgYXZhaWxhYmxlICBmb3IgJDI1IGF0ICB3d3cubmFtZXN5cy5jb20vc3VwcG9y
dC5odG1sLiAqKg0KKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKg0KDQpXaWxsIHJlYnVpbGQgdGhlIGZpbGVzeXN0ZW0gKC9kZXYvbWQz
KSB0cmVlDQpXaWxsIHB1dCBsb2cgaW5mbyB0byAnc3Rkb3V0Jw0KDQpEbyB5b3Ugd2FudCB0byBy
dW4gdGhpcyBwcm9ncmFtP1tOL1llc10gKG5vdGUgbmVlZCB0byB0eXBlIFllcyBpZiB5b3UgZG8p
Olllcw0KUmVwbGF5aW5nIGpvdXJuYWwuLg0KUmVpc2VyZnMgam91cm5hbCAnL2Rldi9tZDMnIGlu
IGJsb2NrcyBbMTguLjgyMTFdOiAwIHRyYW5zYWN0aW9ucyByZXBsYXllZA0KWmVybyBiaXQgZm91
bmQgaW4gb24tZGlzayBiaXRtYXAgYWZ0ZXIgdGhlIGxhc3QgdmFsaWQgYml0LiBGaXhlZC4NCiMj
IyMjIyMjIyMjDQpyZWlzZXJmc2NrIC0tcmVidWlsZC10cmVlIHN0YXJ0ZWQgYXQgVHVlIEp1bCAy
NSAyMTo0MzowMyAyMDA2DQojIyMjIyMjIyMjIw0KDQpQYXNzIDA6DQojIyMjIyMjIFBhc3MgMCAj
IyMjIyMjDQpMb2FkaW5nIG9uLWRpc2sgYml0bWFwIC4uIG9rLCAxMTY2ODY4NDggYmxvY2tzIG1h
cmtlZCB1c2VkDQppbml0X3NvdXJjZV9iaXRtYXA6IEJpdG1hcCAzNTYxIChvZiAzMjc2OCBiaXRz
KSBpcyB3cm9uZyAtIG1hcmsgYWxsIGJsb2NrcyBbMTE2Njg2ODQ4IC0gMTE2NzE5NjE2XSBhcyB1
c2VkDQppbml0X3NvdXJjZV9iaXRtYXA6IEJpdG1hcCAzNTYyIChvZiAzMjc2OCBiaXRzKSBpcyB3
cm9uZyAtIG1hcmsgYWxsIGJsb2NrcyBbMTE2NzE5NjE2IC0gMTE2NzUyMzg0XSBhcyB1c2VkDQpp
bml0X3NvdXJjZV9iaXRtYXA6IEJpdG1hcCAzNTYzIChvZiAzMjc2OCBiaXRzKSBpcyB3cm9uZyAt
IG1hcmsgYWxsIGJsb2NrcyBbMTE2NzUyMzg0IC0gMTE2Nzg1MTUyXSBhcyB1c2VkDQppbml0X3Nv
dXJjZV9iaXRtYXA6IEJpdG1hcCAzNTY0IChvZiAzMjc2OCBiaXRzKSBpcyB3cm9uZyAtIG1hcmsg
YWxsIGJsb2NrcyBbMTE2Nzg1MTUyIC0gMTE2ODE3OTIwXSBhcyB1c2VkDQppbml0X3NvdXJjZV9i
aXRtYXA6IEJpdG1hcCAzNTY1IChvZiAzMjc2OCBiaXRzKSBpcyB3cm9uZyAtIG1hcmsgYWxsIGJs
b2NrcyBbMTE2ODE3OTIwIC0gMTE2ODUwNjg4XSBhcyB1c2VkDQppbml0X3NvdXJjZV9iaXRtYXA6
IEJpdG1hcCAzNTY2IChvZiAzMjc2OCBiaXRzKSBpcyB3cm9uZyAtIG1hcmsgYWxsIGJsb2NrcyBb
MTE2ODUwNjg4IC0gMTE2ODgzNDU2XSBhcyB1c2VkDQppbml0X3NvdXJjZV9iaXRtYXA6IEJpdG1h
cCAzNTY3IChvZiAyNTUwNCBiaXRzKSBpcyB3cm9uZyAtIG1hcmsgYWxsIGJsb2NrcyBbMTE2ODgz
NDU2IC0gMTE2OTA4OTYwXSBhcyB1c2VkDQpTa2lwcGluZyAxMTc3OCBibG9ja3MgKHN1cGVyIGJs
b2NrLCBqb3VybmFsLCBiaXRtYXBzKSAxMTY4OTcxODIgYmxvY2tzIHdpbGwgYmUgcmVhZA0KMCVe
QSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlZnQg
MTE0NzU5NDc4LCAxMzc5MSAvc2Vj
------=_Part_33963_11819844.1153827719380--
