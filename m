From: Horst Simon <hsimon@optusnet.com.au>
Subject: Re: Zero Bit found
Date: Tue, 27 Jul 2004 20:45:32 +1000
Message-ID: <200407272045.32998.hsimon@optusnet.com.au>
References: <6913951.1090812351701.SLOX.WebMail.wwwrun@neptune.hsc-consulting.com.au> <7295144.1090882775326.SLOX.WebMail.wwwrun@neptune.hsc-consulting.com.au> <4105FF07.3080807@namesys.com>
Reply-To: hsimon@optusnet.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4105FF07.3080807@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On Tue, 27 Jul 2004 05:06 pm, Hans Reiser wrote:
> Horst Simon wrote:
> >On Jul 26, 2004 08:08 PM, Vladimir V. Saveliev <vs@namesys.com> wrote:
> >>Hello
> >>
> >>Horst Simon wrote:
> >>>Hi,
> >>>
> >>>I recently added a 200GB Seagate IDE drive to my system on a
> >>>build-in
> >>>promise controller on an ASUS A7V, updated BIOS which supports large
> >>>disk drives.
> >>>The O/S is United Linux 1.0 with the latest patches and the kernel
> >>>version is
> >>>2.4.21 with latest United Linux patches. The reiserfs is 3.6. During
> >>>the
> >>>initial
> >>>setup and first reboot no reiserfsck errors are report. After
> >>>writing
> >>>data to the disk I get now following reiserfsck messages during each
> >>>boot:
> >>>
> >>> ZERO BIT FOUND IN ON-DISK BITMAP AFTER THE LAST VALID BIT
> >>>Switching to --fix-fixable mode
> >>>Checking
> >>>
> >>>It displays directory paths which it is checking and after finishing
> >>>following message is displayed:
> >>>
> >>>The on-disk and the correct bitmaps differ. Will be fixed later
> >>>
> >>>No corruption found
> >>>
> >>>There are on the filesystem:
> >>>
> >>>    Leaves 20264
> >>>
> >>>      Internal nodes 125
> >>>
> >>>        Directories 2063
> >>>
> >>>  Other files 22869
> >>>
> >>> Data block pointers 15940960 (0 of them are zero)
> >>>
> >>> Safe links 0
> >>>
> >>>###########
> >>>
> >>>What is this ZERO BIT, is this a serious problem?
> >>
> >>No, it is not. Reiserfs manages disk space by bitmaps. Those bitmaps
> >>are stored in disk blocks.
> >>Reiserfsck expects last bitmap to be filled by 1s in the area which
> >>address blocks out of device.
> >>Somehow you got that padding area in last bitmap incorrectly
> >>initialized.
> >>It is completely harmless.
> >>
> >>What could be wrong
> >>
> >>>bad BIOS, reiserfs, etc.?
> >>
> >>What version of reiserfsprogs you are using?
> >>
> >>>Regards,
> >>>Horst
> >
> >Thanks for the information, the reiserfsprogs are 3.6.17. On the weekend
> >I will
> >try the suggestions from Vitaly Fertman. I noticed that this problem
> >only occured after writing to the disk.
> >
> >Regards,
> >Horst
>
> Writing in what way?  Usual fs operations, or writing to random blocks
> not via the fs or with something like corrupt partition tables?
>
> (I prefer to think that reiserfs has no bugs that write to random
> blocks.....)

Just to clarify when copying data to the disk. I suspect now the onboard 
promise controller. On the weekend I will move the disk to an other
system and do more testing.

Regards,
Horst
-- 
E-Mail: hsimon@optusnet.com.au
 Tel: +61(0)3 9553-1624
 Fax: +61(0)3 9553-1624

 This message was sent by
 KMail 1.6.2 Using KDE3.2.1 & SuSE Linux 9.1

