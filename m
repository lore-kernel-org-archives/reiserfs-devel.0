From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: reiser4: mount -o remount,ro / causes error on reboot
Date: Sun, 10 Sep 2006 17:01:18 +0000 (UTC)
Message-ID: <ee1gcu$dgb$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29843-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

Using: gentoo
kernel 2.6.17.11 with beyond patchset
reiser patch 2.6.17-3
reiser4progs 1.0.5

At the end of the gentoo shutdown script is a short function which
remounts / as ro.

sync; sync
sleep 1
.....
# ${x} = /
mount -n -o remount,ro "${x}" &>/dev/null

On reboot or after a poweroff, root does not mount properly, and after
some modules are loaded, there are segfaults when running init scripts.

The init scripts prompts for the root password for maintenance. Simply
typing exit forces an unmount of / and a reboot.

After this, everything is normal. On a normal shutdown, this error cycle
begins anew. Something has changed in the gentoo shutdown sequence as this
error is new to my system. However, gentoo does not support reiser4 as it
is experimental. I wanted to report this.

Remount is required since with the halt script running, the root cannot be
unmounted. After halt.sh, reboot -idpk is called or shutdown.

My hds are IDE

/dev/hda:

 Model=Maxtor 6Y200P0, FwRev=YAR41BW0, SerialNo=Y65WFMPE
 Config={ Fixed }
 RawCHS=16383/16/63, TrkSize=0, SectSize=0, ECCbytes=57
 BuffType=DualPortCache, BuffSize=7936kB, MaxMultSect=16, MultSect=16
 CurCHS=16383/16/63, CurSects=16514064, LBA=yes, LBAsects=268435455
 IORDY=on/off, tPIO={min:120,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes:  pio0 pio1 pio2 pio3 pio4 
 DMA modes:  mdma0 mdma1 mdma2 
 UDMA modes: udma0 udma1 udma2 udma3 udma4 udma5 *udma6 
 AdvancedPM=yes: disabled (255) WriteCache=enabled
 Drive conforms to: (null):  ATA/ATAPI-1 ATA/ATAPI-2 ATA/ATAPI-3 ATA/ATAPI-4 ATA/ATAPI-5 ATA/ATAPI-6 ATA/ATAPI-7

 * signifies the current active mode

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

