From: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Subject: OT: Advice on SATA sought
Date: Sat, 27 Mar 2004 23:52:20 +0100
Message-ID: <406605A4.7020903@edsons.demon.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: the filesystem <reiserfs-list@namesys.com>

Greetings,


I am considering buying some 250G SATA drives (3 in a RAID5 config) for 
multimedia backend storage.
disks will likely be WD SATA WD2500JD unless somebody points out good 
reasons not to. Can get those for about 200 Euro excluding VAT each.
This is going to be used to store interactively accessed MPEG2 video 
files. They will be stored from at least 2 (on short notice 3) sources, 
and simultaously read from 2 or 3 locations. In other words: storage 
backend for a MythTV setup with 2 or 3 backends, and multiple frontends 
using a combination of PVR-250 and PVR-350s. 350 for frontend connected 
to a TV, several frontends using X for output.

The controller i am considering is the Promise SATA TX4.
kernel: 2.6.4 or later from kernel.org on a recent slackware-current 
distro.

Any experience, either with this controller, with SATA, with other 
controllers, please share so I can make a better decision. I've 
currently no real experience with SATA.

Filesystem choice has been made: Reiserfs3. This is going to be a 
production machine, I will not yet test Reiserfs4 on that. Too risky 
considering "comments" i would get on failure...

Regards,

Rudy

