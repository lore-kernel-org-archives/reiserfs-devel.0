From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Error Code 255 and "Permission Denied"
Date: Tue, 07 May 2002 02:54:04 +0200
Message-ID: <3CD725AC.6000708@mb.tu-ilmenau.de>
References: <scd69d55.074@gwd.albion.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10269-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Christiansen <christiansen@albion.edu>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Chris Mason <mason@suse.com>

On 05/06/2002 09:12 PM, Daniel Christiansen wrote:

> Everything seems to work by using the 3.x.1b version of reisfsck with
> --rebuild-tree.  Thank you very much, Oleg, for taking the time to solve
> my problem.
> 
> I don't know anything about the "write cache enabled" issue below.  Is
> this something I have to change with a jumper, a bios setting, or a
> software configuration?
> 


Huh! Maybe you can jumper this on your MB, too?! Or maybe also set it in 
your BIOS?

Use "hdparm -i /dev/drive-whatever" to get this information from your 
disk drive.
If your drive supports it, you 'll find a number in kB after 
"BuffSize=". If your jumpers/BIOS do support it with your current 
settings or your disks defaults do it, search for a 
"WriteCache=enabled". If your BIOS doesn't make it for you it, you can 
enable it by a "hdparm -W1 /dev/drive-whatever" and disable it with 
parameter "-W0" instead of "-W1". And, of course, have a look at the 
manpage -- this feature is marked "(DANGEROUS)" (just in case your 
hardware does not support it)! I have hdparm v4.6 on here since January 
but I just saw a v4.9 on
  ftp://sunsite.unc.edu/pub/Linux/system/hardware     and on
  ftp://metalab.unc.edu/pub/Linux/system/hardware/    .

> Thanks again.
> 
> 
>>>Other indications of a problem:  I ran the dmesg program from /bin
>>>
> and
> 
>>>got "Warning log replay starting on readonly filesystem" and lots of
>>>"i/o failure trying to find stat data" messages.
>>>
>>Your filesystem was corrupted by something. Do you have Windows on
>>that box, too?
>>I have windows on the first drive, which I rarely use, and a vfat
>>windows partition on the second drive so that I could transfer files.
>>I'm not sure, but I think my problems started after a power outage.
>>
> 
> Hm. Do you have write cache enabled on your harddrive? That may explain
> your problems (and yes, most of drive manufacturers do enable write
> caching
> by default).
> 


Oleg, do you really think a dumb-crashing-Windows to be a reason?? What 
version do you run on your disks? I have a Win98 spread over the 
partitions of my 2 disks but the only things I get from a 
crashed=powered-off Win98 are many-many unusable files in Win98 -- not 
affecting my Linux system.
When I have a complete-crash=power-off when there was a running VMware 
with Win98 inside (but it's a dual boot system with real partitions' 
access for VMware from Linux) I have 2-to-5 truncates-to-complete on 
restart/mount of my reiserfs / and the "usual" vfat problems later... 
like missing files, checks needed and so on)

Maybe it's the kernel <-reiserfs-sub-version-> version Daniel runs at 
the moment? Oleg?

Or is it somekind of connected to Chris Masons thread "2.4.19-pre7 / 
corruption on unwanted reboot"??? If Chris and Jens found bugs on IDE 
interaction with ReiserFS they should really put out a patch soon... ;-)

Chris M.? Is that related eventually? Just a doubt!


Best regards,

Manuel

