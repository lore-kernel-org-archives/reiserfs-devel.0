From: "David Dabbs" <david@dabbs.net>
Subject: RE: yeah, it was hardware error, we can ship!
Date: Thu, 5 Aug 2004 10:29:07 -0500
Message-ID: <20040805153225.D2E5B15D2F@mail03.powweb.com>
References: <16654.53838.10331.358355@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16654.53838.10331.358355@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'ReiserFS List' <reiserfs-list@namesys.com>



> -----Original Message-----
> From: Nikita Danilov [mailto:nikita@clusterfs.com]
> Sent: Monday, August 02, 2004 6:46 PM
> To: Hans Reiser
> Cc: David Dabbs; 'ReiserFS List'
> Subject: Re: yeah, it was hardware error, we can ship!
> 
> Hans Reiser writes:
>  > Nikita Danilov wrote:
>  > >
>  > Are your words intended to suggest that it is not a hardware bug, and
>  > thus might be software?
> 
> Yes, these messages are harmless. I am getting them also, on a brand-new
> disk, SuSE9.1
> 
> Jul  3 10:44:04 tau kernel: hda: drive_cmd: status=0x51 { DriveReady
> SeekComplete Error }
> Jul  3 10:44:04 tau kernel: hda: drive_cmd: error=0x04 { DriveStatusError
> }
> Jul  3 10:44:04 tau kernel: hda: task_no_data_intr: status=0x51 {
> DriveReady SeekComplete Error }
> Jul  3 10:44:04 tau kernel: hda: task_no_data_intr: error=0x04 {
> DriveStatusError }
> 
> Search for SeekComplete in the LKML archive.
> 
> Nikita.

Well, whether or not the messages are innocuous, they are gone. I have a new
refurbished disk that provides more space and is faster. And I am rerunning
the mongo benchmarks whose failure started this thread.

David


