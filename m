From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: partition cannot be mounted from grub
Date: Thu, 21 Sep 2006 11:10:00 +0000 (UTC)
Message-ID: <eetru8$vjq$1@sea.gmane.org>
References: <eet9jg$463$1@sea.gmane.org> <eetanq$6ij$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29959-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Thu, 21 Sep 2006 08:16:26 +0200, Huub wrote:

> Huub wrote:
>> Hi,
>> 
>> Using Suse 10.1, I had a spontaneous reboot after which I got a fast 
>> running screen full of reiserfs messages. Another (inflicted) reboot and 
>> Grub gives error 17, meaning it cannot mount a recognized partition.
>> Using the boot-dvd, I selected Rescue, and logged in as root but I have 
>> no idea how to proceed trying to save my system.
>> Help is appreciated.
>> 
>> Thanks,
>> 
>> Huub
>> 
>> 
> 
> Correction: errormessage means:
> 
> This error is returned if the partition requested exists, but the 
> filesystem type cannot be recognized by GRUB.
> 
> I.e. GRUB doesn't recognize it's a ReiserFS partition...

Two suggestions.

1) I have found that grub files in r3 have to be copied using -o notail on
the mount command. If you do not use notail, the files are not able to be
read by grub.
2) do not try and create a grub boot while in the r3 partition. Make sure
the partition is unmounted, then boot from a live cd and run grub from
there.

e.g. in your case, with /dev/hdc2 being your root

root(hd2,1)
# at this point grub should respond that filesystem is reiserfs
setup(hd2)
# at this point, grub should install the boot loader.
# unless hdc is NOT your boot disk. If not, then use hd0 or 1.

If not, try recopying /boot/grub by doing this from the live cd.

mount /dev/hdc2 /mnt/wherever -o notail,rw,[noatime]
cd /boot
cp -rP grub grub2
rm -fr grub
mv grub2 grub

then umount it and try the grub commands above.

I have had lots of woes with grub and reiser 3/4. This seems to work for
me.
-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

