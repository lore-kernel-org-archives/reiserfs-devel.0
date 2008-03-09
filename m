From: Matthew <jackdachef@gmail.com>
Subject: Re: reiser4 w. cryptcompress data-corruption (?!)
Date: Sun, 9 Mar 2008 12:05:22 +0100
Message-ID: <e85b9d30803090405l115397caqc6ab5bb0b7d89d74@mail.gmail.com>
References: <loom.20080225T213801-660@post.gmane.org>
	 <a08621850802251503w10b88e3an59a5170dd41805bb@mail.gmail.com>
	 <e85b9d30802260057s5ed62dc6t78fc5b6cfb02a5da@mail.gmail.com>
	 <47C3EC20.8010208@gmail.com>
	 <e85b9d30802260406n6d83f63r37d1f06e7ab542d0@mail.gmail.com>
	 <47D2EEF9.6090904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=MN78W5PpwTTCk3rYjdUuDhChYZSdn7MkpeOOhQUqCG0=;
        b=EIEnjHNwxtZnFXjlNmjDp5zbqRAzRZ+n58JcAKGNiSfzs+D27jqoEZE4y648gTByfF6FUmUAWCVsMDea58MrODqxaBnGqhP/YddrhRFRS9XOPIi72N5WlcJev7202bF1WGB6AubnlTz/qad/xcrfj8zpHE2zV66THNHUKWrz6A0=
In-Reply-To: <47D2EEF9.6090904@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Dushan Tcholich <dusanc@gmail.com>, reiserfs-devel@vger.kernel.org

On Sat, Mar 8, 2008 at 8:54 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Hello Mat,
>
>  It looks like someone stomped your data, and that
>  antivirus is the first candidate to this position ;)
>
>  For more careful diagnostics your root partition should
>  be investigated with debugfs.reiser4 to check consistency
>  of disk clusters. The next stage is to make surveillance
>  under root drive to figure out who does issue write requests
>  when scanning /mnt/win.
>
>  If you don't object, then I'll put it to longterm todo ;)
>
>  Thanks,
>  Edward.
>
>
>
>  Matthew wrote:
>
>  >On Tue, Feb 26, 2008 at 11:38 AM, Edward Shishkin
>  ><edward.shishkin@gmail.com> wrote:
>  >
>  >
>  >>Matthew wrote:
>  >>
>  >> >On Tue, Feb 26, 2008 at 12:03 AM, Dushan Tcholich <dusanc@gmail.com> wrote:
>  >> >
>  >> >
>  >> >>Hi
>  >> >>
>  >> >>I had a same scary experience of reiser4 repairing thousands of errors on
>  >> >>cryptocompressed partition, but it was false alarm as Edward said:
>  >> >>
>  >> >>
>  >> >>
>  >> >>>Me:
>  >> >>>
>  >> >>>
>  >> >> > After fsck.reiser4 --check I had to do a fsck.reiser4 --build-fs,
>  >> >> > which lasted ~55min. It fixed 1 error on the start and for next 50 min
>  >> >> > fixed wrong bytes errors in every node, like in the second picture.
>  >> >>
>  >> >>Edward:
>  >> >> Ignore reports about wrong bytes.
>  >> >> This is because cryptcompress plugin doesn't keep a track about bytes,
>  >> >> and fsck calculates and insert correct value. Keeping a track of bytes
>  >> >> by kernel leads to performance drop (even worse then with atime), so
>  >> >> we decided to not support it.
>  >> >>
>  >> >>
>  >> >>Were those thousands of errors in step 6. of your mail wrong byte errors?
>  >> >>
>  >> >>Dushan
>  >> >>
>  >> >>
>  >> >
>  >> >Hi, Dushan,
>  >> >
>  >> >no, those actually were (real) data corruption errors,
>  >> >as I wrote (I didn't made it that clear) I impatiently interrupted
>  >> >fsck.reiser4, reformatted the partition and extracted the tarball with
>  >> >the system
>  >> >
>  >> >I just woke up & thinking over it now: the corruption behavior was
>  >> >pretty similar to the corruption with bitdefender-console,
>  >> >
>  >> >Edward:
>  >> >I hope you still have the mails were I described
>  >> >"corrupting"/triggering the error with ntfs-scanning before you fixed
>  >> >it?
>  >> >
>  >> >1.) boot into system with reiser4 as root partition
>  >> >2.) start up GUI (gnome, kde, whatever)
>  >> >3.) work with with it a little
>  >> >4.) mount ntfs-partition (it shouldn't matter if mounted with
>  >> >in-kernel ntfs-driver or ntfs3g) [the partition should ideally contain
>  >> >a windows-system with several gigabytes of data]
>  >> >5.) scan the partition with bdc --arc --files /mnt/win
>  >> >
>  >> >
>  >>
>  >> what is the bdc?
>  >>
>  >>
>  >>
>  >> >6.) filesystem corrupts,
>  >> >7.) result: nothing can be launched anymore, even bash is broken -
>  >> >just everything
>  >> >
>  >> >it was also the case this time:
>  >> >whenever I tried to launch epiphany, nautilus, gnome-terminal it
>  >> >wouldn't launch them
>  >> >--> the only thing still working was gnome-terminal
>  >> >after that I exited to the CLI & when I recognised it was similar to
>  >> >the previous corruption case (bitdefender-console)
>  >> >I immediately killed everything via magic sysrq key & rebooted without
>  >> >syncing to maintain my data intact (on /home)
>  >> >
>  >> >the behavior is pretty interesting:
>  >> >it seems to corrupt progressively in steps (such as with the
>  >> >bitdefender-console corruption)
>  >> >
>  >> >first almost all still works, bit by bit more and more programs won't
>  >> >work anymore
>  >> >
>  >> >Regards
>  >> >
>  >> >Mat
>  >> >
>  >> >
>  >> >
>  >>
>  >>
>  >>
>  >>
>  >
>  >sorry for not clearing that:
>  >
>  >[I] app-antivirus/bitdefender-console
>  >     Available versions:  -7.0.1-r1 -7.0.1-r1[1] (~)7.1 (~)7.1[1]
>  >     Installed versions:  7.1[1](22:37:31 06.01.2008)
>  >     Homepage:            http://www.bitdefender.com/
>  >     Description:         BitDefender console antivirus
>  >
>  >[1] "portage" /usr/local/portage
>  >
>  >the name of the program's file is:
>  >' BitDefender-Console-Antivirus-7.1-3.linux-gcc3x.i386.run '
>  >
>  >Thanks
>  >
>  >Mat
>  >
>  >
>  >
>
>

Hi Edward,

sure, I'm happy with the current state of reiser4 (for now),

it's on the root-partition on 2 computers, and several data partitions,
the only problems I had until now was with the root partition(s)
involved, so no "real" data corruption/loss, as there's always a
backup-tarball of my system
on an external hdd lying next to me ;)

I think I need to omit contact with those usage-cases as far as
possible (ntfs & bitdefender-console) then it'll be fine

> If you don't object, then I'll put it to longterm todo ;)

no, of course not, just go ahead, there are more important "cases"
than mine waiting to get taken care of :)
*crossing fingers* that reiser4' problems will be sorted out as fast
as possible

Good luck &
thanks a lot again,

Mat
