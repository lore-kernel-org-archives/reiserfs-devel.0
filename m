From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: yeah, it was hardware error, we can ship!
Date: Tue, 3 Aug 2004 03:46:22 +0400
Message-ID: <16654.53838.10331.358355@gargle.gargle.HOWL>
References: <41112B30.2050509@namesys.com>
	<20040804191654.D1AF915DE1@mail03.powweb.com>
	<16657.19343.880344.58340@laputa.namesys.com>
	<411156F1.5010802@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20020-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411156F1.5010802@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, 'ReiserFS List' <reiserfs-list@namesys.com>

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > >David Dabbs writes:
 > > > 
 > > > >David, what distribution were you using when he got these errors?  What
 > > > >desktop environment was running on X at the time?
 > > > 
 > > > SuSE 9.1 kde
 > > > 
 > >
 > >Then you can ignore these messages. They are driver artefact. There
 > >was lengthy thread on this subject on LKML recently.
 > > 
 > > > 
 > > > >BTW: I have ext3 and reiserfs (3.6) partitions on this notebook.  On the
 > > > >old hard drive, I used plain old partitions.  On the new drive, I use
 > > > >LVM for everything except /boot and swap.
 > > > 
 > > > Thanks for the info, Lamont.
 > > > 
 > > > David
 > > > 
 > >
 > >Nikita.
 > >
 > > > 
 > > > 
 > >
 > >
 > >  
 > >
 > Are your words intended to suggest that it is not a hardware bug, and 
 > thus might be software?

Yes, these messages are harmless. I am getting them also, on a brand-new
disk, SuSE9.1

Jul  3 10:44:04 tau kernel: hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }
Jul  3 10:44:04 tau kernel: hda: drive_cmd: error=0x04 { DriveStatusError }
Jul  3 10:44:04 tau kernel: hda: task_no_data_intr: status=0x51 { DriveReady SeekComplete Error }
Jul  3 10:44:04 tau kernel: hda: task_no_data_intr: error=0x04 { DriveStatusError }  

Search for SeekComplete in the LKML archive.

Nikita.
