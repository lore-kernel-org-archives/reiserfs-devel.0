From: butdiene <butdiene@yahoo.com>
Subject: Re: reiser4 mount options
Date: Wed, 26 Dec 2007 06:14:00 -0800 (PST)
Message-ID: <14502529.post@talk.nabble.com>
References: <14476466.post@talk.nabble.com> <476E6CE2.7030004@namesys.com> <14483298.post@talk.nabble.com> <476EFF85.2070002@namesys.com> <14484849.post@talk.nabble.com> <476FC217.9090408@namesys.com> <1198517663.6209.18.camel@localhost> <14493053.post@talk.nabble.com> <14498380.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14498380.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


I guess the solution for me is atom_min_size=0x100 or even smaller.

for a laptop, I don't want anything to hang, even at cost of general fs
performance.

/dev/root / reiser4
rw,atom_max_size=0x100,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10
0 0



butdiene wrote:
> 
> unfortunately, "sync" still hangs firefox
> 
> anything else to try?
> 
> 
> butdiene wrote:
>> 
>> /dev/root / reiser4
>> rw,atom_max_size=0x800,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10
>> 0 0
>> 
>> it works without initrd for me.  the mount options are set properly in
>> /proc/mounts now. 
>> 
>> still need to see how it performs 
>> 
>> thanks a lot!
>> 
>> 
>> Zan Lynx wrote:
>>> 
>>> 
>>> On Mon, 2007-12-24 at 17:28 +0300, Edward Shishkin wrote:
>>> 
>>>> Sorry, ignore my suggestion about fstab. It is impossible to pass
>>>> reiser4-specific mount options for ''/" via fstab, because all such
>>>> options
>>>> are passed to "/" via remount, but ->remount_fs() super operation is
>>>> not
>>>> implemented for reiser4.
>>>> 
>>>> However, it is possible to pass reiser4-specific mount options for "/"
>>>> via
>>>> boot loader. I have passed a string "rootflags=tmgr.atom_max_size=2048"
>>>> to my grub, and it works for me. Note, that prefix "tmgr." is required
>>>> and
>>>> values should be passed in decimal format.
>>> 
>>> Last year when I needed rootflags I found out that they only work if
>>> your distro implements them through an initrd or initramfs.  Since most
>>> distros do this it works ok.  But my Gentoo system did not use an
>>> initramfs and I could not get rootflags options to work on the kernel
>>> command line.
>>> 
>>> So I made my own initramfs with BusyBox and a short script.
>>> -- 
>>> Zan Lynx <zlynx@acm.org>
>>> 
>>>  
>>> 
>> 
>> 
> 
> 

-- 
View this message in context: http://www.nabble.com/reiser4-mount-options-tp14476466p14502529.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

